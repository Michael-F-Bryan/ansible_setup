#!/bin/bash

START="yesterday"
END="now"
start_to_end="--start $START --end $END"

# General summary
aureport $start_to_end

# Login Report
aureport --login --summary -i

# Summary of all executables
aureport -x --summary $start_to_end

# Anomaly report
sudo aureport -n $start_to_end

# The total log time range
aureport -t
