set macro
red_000 = "#F9B7B0"
red_025 = "#F97A6D"
red_050 = "#E62B17"
red_075 = "#8F463F"
red_100 = "#6D0D03"

blue_000 = "#A9BDE6"
blue_025 = "#7297E6"
blue_050 = "#1D4599"
blue_075 = "#2F3F60"
blue_100 = "#031A49" 

green_000 = "#A6EBB5"
green_025 = "#67EB84"
green_050 = "#11AD34"
green_075 = "#2F6C3D"
green_100 = "#025214"

brown_000 = "#F9E0B0"
brown_025 = "#F9C96D"
brown_050 = "#E69F17"
brown_075 = "#8F743F"
brown_100 = "#6D4903"

grid_color = "#d5e0c9"
text_color = "#6a6a6a"

# my_font = "SVBasic Manual, 12"

# my_line_width = "2"
# my_axis_width = "1.5"
# my_ps = "1.2"

# # define the font for the terminal
# set term wxt enhanced font my_font

# # set default point size
# set pointsize my_ps

# # set the style for the set 1, 2, 3...
# set style line 1 linecolor rgbcolor blue_025 linewidth @my_line_width pt 7
# set style line 2 linecolor rgbcolor green_025 linewidth @my_line_width pt 5
# set style line 3 linecolor rgbcolor red_025 linewidth @my_line_width pt 9
# set style line 4 linecolor rgbcolor brown_025 linewidth @my_line_width pt 13
# set style line 5 linecolor rgbcolor blue_050 linewidth @my_line_width pt 11
# set style line 6 linecolor rgbcolor green_050 linewidth @my_line_width pt 7
# set style line 7 linecolor rgbcolor red_050 linewidth @my_line_width pt 5
# set style line 8 linecolor rgbcolor brown_050 linewidth @my_line_width pt 9
# set style line 9 linecolor rgbcolor blue_075 linewidth @my_line_width pt 13
# set style line 10 linecolor rgbcolor green_075 linewidth @my_line_width pt 11
# set style line 11 linecolor rgbcolor red_075 linewidth @my_line_width pt 7
# set style line 12 linecolor rgbcolor brown_075 linewidth @my_line_width pt 5
# set style line 13 linecolor rgbcolor blue_100 linewidth @my_line_width pt 9
# set style line 14 linecolor rgbcolor green_100 linewidth @my_line_width pt 13
# set style line 15 linecolor rgbcolor red_100 linewidth @my_line_width pt 11
# set style line 16 linecolor rgbcolor brown_100 linewidth @my_line_width pt 7
# set style line 17 linecolor rgbcolor "#224499" linewidth @my_line_width pt 5
# set style line 18 linecolor rgbcolor text_color linewidth @my_line_width pt 5 lt 1

# # this is to use the user-defined styles we just defined.
# set style increment user

# # set the color and font of the text of the axis
# set xtics textcolor rgb text_color font my_font
# set ytics textcolor rgb text_color font my_font
# set ztics textcolor rgb text_color font my_font

# # set the color and font (and a default text) for the title and each axis
# set title "Top Title" textcolor rgb text_color font my_font
# set xlabel "X Label (unit)" textcolor rgb text_color font my_font
# set ylabel "Y Label (unit)" textcolor rgb text_color font my_font
# set zlabel "Z Label (unit)" textcolor rgb text_color font my_font 

# # set the text color and font for the label
# set label textcolor rgb text_color font my_font

# # set the color and width of the axis border
# set border 31 lw @my_axis_width lc rgb text_color

# # set key options
# set key outside box ls 18 width 2 height 2 enhanced spacing 2 

# # set grid color
# set grid lc rgb grid_color

set term wxt enhanced dashed persist
set linetype 17 lt 5 lc rgb "#8b1a0e" lw 2 pt 0 ps 0.5 #red
set linetype 18 lt 5 lc rgb "#5e9c36" lw 2 pt 0 ps 0.5 #green
set linetype 19 lt 5 lc rgb "#0060ad" lw 2 pt 0 ps 0.5 #blue
set linetype 20 lt 5 lc rgb "#404040" lw 2 pt 0 ps 0.5 #gray
set linetype 1 lt 1 lc rgb "#8b1a0e" lw 2 pt 7 ps 0.5 #red
set linetype 2 lt 1 lc rgb "#5e9c36" lw 2 pt 7 ps 0.5 #green
set linetype 3 lt 1 lc rgb "#0060ad" lw 2 pt 7 ps 0.5 #blue
set linetype 4 lt 1 lc rgb "#404040" lw 2 pt 7 ps 0.5 #gray
set linetype 5 lt 17 lc rgb "#8b1a0e" lw 2 pt 5 ps 0.5 #red
set linetype 6 lt 17 lc rgb "#5e9c36" lw 2 pt 5 ps 0.5 #green
set linetype 7 lt 17 lc rgb "#0060ad" lw 2 pt 5 ps 0.5 #blue
set linetype 8 lt 17 lc rgb "#404040" lw 2 pt 5 ps 0.5 #gray
set linetype 9 lt 0 lc rgb "#8b1a0e" lw 2 pt  9 ps 0.5 #red
set linetype 10 lt 0 lc rgb "#5e9c36" lw 2 pt 9 ps 0.5 #green
set linetype 11 lt 0 lc rgb "#0060ad" lw 2 pt 9 ps 0.5 #blue
set linetype 12 lt 0 lc rgb "#404040" lw 2 pt 9 ps 0.5 #gray
set linetype 13 lt 14 lc rgb "#8b1a0e" lw 2 pt 13 ps 0.5 #red
set linetype 14 lt 14 lc rgb "#5e9c36" lw 2 pt 13 ps 0.5 #green
set linetype 15 lt 14 lc rgb "#0060ad" lw 2 pt 13 ps 0.5 #blue
set linetype 16 lt 14 lc rgb "#404040" lw 2 pt 13 ps 0.5 #gray

set label textcolor lt 2
set border lt 4 lw 1
set tics textcolor rgb "#404040" 
set grid lt 12 lw 1 


raise=1
persist=1
ctrl=0
rendering=2
hinting=100
