#!/bin/bash

function usage
{
    echo "usage: cbb_bias.sh -b bias"
    echo ""
    echo "       parameters:   -b --bias     : bias from conduction band bottom (cbb)"
}

bias=10000000

#scan command line
while [ "$1" != "" ]; do
    case $1 in
        -b | --bias )      	 shift
                                bias=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

if [ "$bias" == "10000000" ]; then
	usage
	exit
fi

#first get the fermi energy
fermi=$(grep -a "the Fermi energy is" output.txt | tail -n 1 | awk '{print $5}')

#get the parameters for the last band energy block
start_line=$(grep -a -n "End of self-consistent calculation" output.txt | tail -n 1 | awk 'BEGIN{FS=":"}{print $1}')
total_line=$(wc -l output.txt | awk '{print $1}')
num_lines=$(echo "$total_line - $start_line + 1" | bc)

#now get the cbb and calculate the bias
tail -n $num_lines output.txt | awk '
{
	if ($0 ~ /End of self-consistent calculation/)
	{
		#skip the empty line
		getline
		#get the next line to see if this is spol or not
		getline
		if ($0 ~ /------ SPIN UP ------------/)
		{
			#if spol then i look at the UP spin
			#skip the next 4 lines
			getline
			getline
			getline
			getline
		}
		else
		{
			#skip 1 line
			getline
		}
		
		#parse the band energies until we find a gap bigger than 0.5 eV (this may have to be changed)
		getline
		last = -10000
		while ($0 != "")
		{
			for (i=1;i<=NF;i++)
			{
				val = $i
				
				if (last != -10000)
				{
					if (val - last > 0.5)
					{
						cbb = val
					}
				}
				
				last = val
			}
			
			getline
		}
	}
}
END {	
	fbias = cbb + bias - fermi
	
	print "cbb        = " cbb
	print "cbb bias   = " bias
	print "fermi bias = " fbias
	
}' fermi=$fermi bias=$bias output.txt
