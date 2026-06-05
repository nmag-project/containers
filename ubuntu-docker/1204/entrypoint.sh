#!/bin/bash

mpd &   # Start MPD
sleep 1 # Wait for MPD to start
$@      # Forward commands from input
