#!/bin/bash

#change the working directory to examples folder
cd examples 
### Hysteresis Example 
""" 
This example computes the hysteresis loop of an ellipsoidal magnetic object. 
The mesh is contained in ellipsoid.nmesh.h5 and produced with Netgen from ellipsoid.geo
"""
### Ref: http://nmag.soton.ac.uk/nmag/current/manual/singlehtml/manual.html#example-simple-hysteresis-loop
singularity exec ./../nmag.sif nsim ellipsoid.py --clean
### Extracting the Mx-Hx data fom .ndt file
singularity exec ./../nmag.sif ncol ellipsoid H_ext_0 m_Py_0 > plot.dat
### Gnuplot for plotting and saving the file to .eps file 
gnuplot -e "
set term postscript eps enhanced color; 
set out 'container_test_1.eps';
set xlabel 'Applied field H_x   (A/m)'; 
set ylabel 'M_x / M_s'; 
set xrange [-1050000:1050000]; 
set yrange [-1.2:1.2] ; 
plot 'plot.dat' u 1:2 ti 'ellipsoid_hysteresis' w lp;
"
### Moving the saved plot to the main directory from which the testing was done.
cd ..
mv ./examples/container_test_1.eps ./
### Open the plot file using evince
evince container_test_1.eps
