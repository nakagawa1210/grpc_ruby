#!/bin/bash
while read line
do
    FILE=$line
    gnuplot
    plot "$FILE"every ::1 using 1:2
done < time_result/latest_file.log
gnuplot
