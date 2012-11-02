#!/usr/bin/env bash 
awk '
  BEGIN {
    cell=49.54827348
    shift=12.030475887
  }
  NR > 24 {
    if($1 < shift){
      printf "% .9f % .9f % .9f\n", $1-shift+cell , $2, $3 > "temp"
      printf "% .9f % .9f % .9f\n", $1-shift+2*cell , $2, $3 > "temp2"
    } else {
      printf "% .9f % .9f % .9f\n", $1-shift , $2, $3 > "temp1"
      printf "% .9f % .9f % .9f\n", $1-shift+cell, $2, $3 > "temp3"
    }
  }
' totV1.average

cat temp1 temp temp3 temp2 > potential.dat;
\rm temp1 temp temp2 temp3
