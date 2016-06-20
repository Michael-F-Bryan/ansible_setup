#!/bin/bash

START="yesterday"
END="now"
start_to_end="--start $START --end $END"

# General summary
aureport $start_to_end

# Login Report
aureport --login --summary --success -i $start_to_end
aureport --login --summary --failed -i $start_to_end

# Anomaly report
sudo aureport -n $start_to_end

# List events by key
sudo aureport --summary -i --key --success $start_to_end
aureport --summary -i --failed --key $start_to_end

# Summary of all executables
aureport -x --summary $start_to_end

# All attempted ssh logins
echo "Attempted login via SSH"
echo "======================="
sudo aureport -i --failed --login $start_to_end

