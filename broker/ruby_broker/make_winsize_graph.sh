#!/bin/bash

TIME=$(date "+%Y%m%d_%H%M")

ruby cal_winsize.rb $TIME

gnuplot -persist <<-EOFMarker
set datafile separator ","
set xlabel 'Windowsize'
set ylabel 'Sec'
set logscale x
plot "log/win_time_$TIME.log" using 1:2 with lines
replot "log/win_time_$TIME.log" using 1:3 with lines
replot "log/win_time_$TIME.log" using 1:4 with lines
set terminal png
set output "log/graph/win_time_$TIME.png"
replot
EOFMarker

gnuplot -persist <<-EOFMarker
set datafile separator ","
set xlabel 'Windowsize'
set ylabel 'gbps'
set logscale x
plot "log/win_gbps_$TIME.log" using 1:2 with lines
replot "log/win_gbps_$TIME.log" using 1:3 with lines
replot "log/win_gbps_$TIME.log" using 1:4 with lines
set terminal png
set output "log/graph/win_gbps_$TIME.png"
replot
EOFMarker

:>| log/latest_file.mulog
