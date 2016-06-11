#!/bin/bash

function usage() {
  echo "Usage: $0 [-h]"
}

function print_help() {
  usage
  echo
  echo "-h     Print out this help text"
}

# Initialize variables
OPTIND=0

# Parse commandline arguments
while getopts ":h" opt; do
  case ${opt} in
    h )
      print_help
      exit 0
      ;;
    \? )
      usage
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))

# If there were any left over arguments then print
# out usage and exit
if [[ $(($# - OPTIND)) >  0 ]]; then
  usage
  exit 1
fi

# Play the master playbook
ansible-playbook site.yml --ask-vault-pass
