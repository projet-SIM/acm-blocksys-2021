set terminal pngcairo nocrop enhanced font "verdana,8" size 640,400
set output "PBFT_result.eps"

set terminal postscript eps enhanced color font 'Times-Roman,18'

set title "PBFT Consensus for 4 to 24 nodes"

set grid ytics lc rgb "black" lw 1.5 lt 0.1
set grid xtics lc rgb "black" lw 1.5 lt 0.1


set xlabel "Input TPS"
set ylabel "Output TPS"

set yrange [0 to 25]

set key at graph 0.25, 0.95

#csv settings:
# set key autotitle columnhead
set datafile separator comma


$data << EOD
5,5,5,5,5,5
10, 10, 10, 10, 10, 8
15, 14, 14, 14, 13, 10
20, 17, 17, 14, 10, 5
25, 20, 19, 14, 9, 15
30, 20, 19, 13, 9, 11
40, 21, 21, 13, 14, 17
50, 25, 20, 13, 13, 13
EOD

plot "$data" using 1:2 with linespoints title "5 nodes", \
    "$data" using 1:3 with linespoints title "6 nodes", \
    "$data" using 1:4 with linespoints title "12 nodes", \
    "$data" using 1:5 with linespoints title "18 nodes", \
    "$data" using 1:6 with linespoints title "24 nodes"