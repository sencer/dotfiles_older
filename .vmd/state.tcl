proc state {} {
  global x
  global y
  global z
  if { [file exists view.vmd] } {
    source view.vmd
  } else {
    foreach mid [molinfo list] {
      molinfo $mid set {
        center_matrix rotate_matrix scale_matrix global_matrix
      } {{{1 0 0 -5} {0 1 0 -6} {0 0 1 -6} {0 0 0 1}}
        {{1 0 0 0} {0 0 1 0} {0 -1 0 0} {0 0 0 1}}
        {{0.19 0 0 0} {0 0.19 0 0} {0 0 0.19 0} {0 0 0 1}}
        {{1 0 0 -0.04} {0 1 0 -0.16} {0 0 1 0} {0 0 0 1}}
     }
      mol delrep 0 $mid
      mol representation VDW 0.300000 18.000000
      mol color Name
      mol selection all
      mol addrep $mid
      mol representation DynamicBonds 2.100000 0.100000 16.000000
      mol color Name
      mol selection all and not name H
      mol addrep $mid
      mol representation DynamicBonds 1.100000 0.100000 16.000000
      mol color Name
      mol selection all
      mol addrep $mid
    }
  }
user add key W {
  global representations
  global viewpoints
  save_viewpoint
  save_reps

  set fildes [open view.vmd w]

  foreach mol [molinfo list] {
    puts $fildes "mol delrep 0 top"
    if [info exists representations($mol)] {
      set i 0
      foreach rep $representations($mol) {
        foreach {r s c m pbc numpbc on selupd colupd colminmax smooth framespec cplist} $rep { break }
        puts $fildes "mol representation $r"
        puts $fildes "mol color $c"
        puts $fildes "mol selection {$s}"
        puts $fildes "mol material $m"
        puts $fildes "mol addrep top"
        if {[string length $pbc]} {
          puts $fildes "mol showperiodic top $i $pbc"
          puts $fildes "mol numperiodic top $i $numpbc"
    }
    puts $fildes "mol selupdate $i top $selupd"
    puts $fildes "mol colupdate $i top $colupd"
    puts $fildes "mol scaleminmax top $i $colminmax"
    puts $fildes "mol smoothrep top $i $smooth"
    puts $fildes "mol drawframes top $i {$framespec}"
    set cpnum 0
    foreach cp $cplist {
      foreach { center color normal status } $cp { break }
      puts $fildes "mol clipplane center $cpnum $i top {$center}"
      puts $fildes "mol clipplane color  $cpnum $i top {$color }"
      puts $fildes "mol clipplane normal $cpnum $i top {$normal}"
      puts $fildes "mol clipplane status $cpnum $i top {$status}"
      incr cpnum
    }
    if { !$on } {
      puts $fildes "mol showrep top $i 0"
    }
    incr i
  } 
}
if {[molinfo $mol get drawn] == 0} {
  puts $fildes "molinfo top set drawn 0"
}
if {[molinfo $mol get active] == 0} {
  puts $fildes "molinfo top set active 0"
}
puts $fildes "set viewpoints(\[molinfo top\]) [list $viewpoints($mol)]"
puts $fildes "lappend viewplist \[molinfo top\]"
if {$mol == [molinfo top]} {
  puts $fildes "set topmol \[molinfo top\]"
}
puts $fildes "\# done with molecule $mol"
} 
puts $fildes "foreach v \$viewplist \{"
  puts $fildes "  molinfo \$v set {center_matrix rotate_matrix scale_matrix global_matrix} \$viewpoints(\$v)"
  puts $fildes "\}"
  puts $fildes "unset viewplist"
  if {[llength [molinfo list]] > 0} {
    puts $fildes "mol top \$topmol"
    puts $fildes "unset topmol"
}
save_colors $fildes
# save_labels $fildes
puts $fildes "set x \$x"
puts $fildes "set y \$y"
puts $fildes "set z \$z"
puts $fildes "pbc box -shiftcenter \"$x $y $z\""
puts $fildes "pbc wrap -shiftcenter \"$x $y $z\""
close $fildes
}
}

