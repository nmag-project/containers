#!/bin/bash

#change the working directory to examples folder
cd examples 
### Hysteresis Example 
""" 
This example computes the hysteresis loop of a flat disc magnetised along a direction orthogonal to the main axis.
the mesh is contained in nanodot1.nmesh.h5 which is created from the_nanodot.geo with Netgen
"""
### Ref: http://nmag.soton.ac.uk/nmag/current/manual/singlehtml/manual.html#example-hysteresis-loop-for-thin-disk
singularity exec ./../nmag.sif nsim nanodot1.py --clean
### Extracting the Mx-Hx data fom .ndt file
singularity exec ./../nmag.sif ncol nanodot1 H_ext_0 m_Py_0 > plot.dat
### Gnuplot for plotting and saving the file to .eps file 
gnuplot -e "
set term postscript eps enhanced color;
set out 'container_test_2.eps';
set xlabel 'Applied field (A/m)';
set ylabel 'M / Ms';
set xrange [-1.e5:1.0e5];
set yrange [-1.2:1.2];
plot 'plot.dat' u 1:2 ti 'nanodot1_hysteresis' with linespoints lw 3 pt 5;
"
### Moving the saved plot to the main directory from which the testing was done.
cd ..
mv ./examples/container_test_2.eps ./
### Open the plot file using evince
evince container_test_2.eps
