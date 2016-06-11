#!/bin/bash

# Miscellaneous functions
function usage() {
  echo "Usage: $0 [-h] [playbook_name]"
}

function print_help() {
  usage
  echo
  echo "Options:"
  echo "-h                 Print out this help text"
  echo
  echo "Arguments:"
  echo "playbook_name      Name of the playbook to run (defaults to \"main\")"
}

# Initialize variables
OPTIND=1

# Parse commandline arguments with getopts
while getopts ":h" opt; do
  case ${opt} in
    h )
      print_help >&2
      exit 0
      ;;
    \? )
      echo "Invalid option: -$OPTARG" >&2
      usage >&2
      exit 1
      ;;
  esac
done
shift $((OPTIND-1))

# If there are any other arguments, print usage and exit
if [[ $# > 0 ]]; then
  usage >&2
  exit 1
fi

# Run the command
echo "Running command: ansible-playbook site.yml --ask-vault-pass"
ansible-playbook site.yml --ask-vault-pass
exit $?

