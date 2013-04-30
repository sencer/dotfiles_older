proc cell {} {
  package require pbctools
  global fname
  global x
  global y
  global z
  set x 0
  set y 0
  set z 0
  set mol [molinfo top]
  set file [open $fname r]
  while { [gets $file line] != -1 } { 
    if {[lindex $line 0] == "CRYST1"} { 
      set a [lindex $line 1] 
      set b [lindex $line 2]
      set c [lindex $line 3]
      break } } 
  pbc set "$a $b $c"
  close $file
  user add key u {
    pbc unwrap -all
    set x 0
    set y 0
    set z 0
    pbc box -shiftcenter "$x $y $z" }  
  user add key o {pbc box -toggle -shiftcenter "$x $y $z"}  
  user add key w { pbc wrap -all }  
  user add key Right {
    set x [expr $x+0.1]
    pbc wrap -all -shiftcenter "$x $y $z"
    pbc box -shiftcenter "$x $y $z" }  
  user add key Left {
    set x [expr $x-0.1]
    pbc wrap -all -shiftcenter "$x $y $z"
    pbc box -shiftcenter "$x $y $z" }  
  user add key Page_Down {
    set y [expr $y-0.1]
    pbc wrap -all -shiftcenter "$x $y $z"
    pbc box -shiftcenter "$x $y $z" }  
  user add key Page_Up {
    set y [expr $y+0.1]
    pbc wrap -all -shiftcenter "$x $y $z"
    pbc box -shiftcenter "$x $y $z" }  
  user add key Up {
    set z [expr $z+0.1]
    pbc wrap -all -shiftcenter "$x $y $z"
    pbc box -shiftcenter "$x $y $z" }
  user add key Down {
    set z [expr $z-0.1]
    pbc wrap -all -shiftcenter "$x $y $z"
    pbc box -shiftcenter "$x $y $z" } }
