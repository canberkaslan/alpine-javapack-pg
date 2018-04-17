#!/usr/bin/env sh

source /scripts/utility.methods.sh

# Parse CLI Input
# http://mywiki.wooledge.org/BashFAQ/035#getopts
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

# used by getops to iterate through cli inputs
OPTIND=1         

# options germane to these utility methods
cli_input_file=""
cli_output_file=""
cli_input_string=""

# stores command germane to these utility methods
cli_method=""

# parse the cli
while [ -n "$1" ]; do
    case "$1" in
    -h|-\?)  
        show_help
        exit 0
        ;;
    -o) 
        cli_output_file=$2
        ;;
    -f) 
        cli_input_file=$2
        ;;
    -s) 
        cli_input_string=$2
        ;;
    *)  
        break
        ;;
    esac

    shift 2
done



# shift $((OPTIND-1))


# [ "$1" = "--" ] && shift

# # after
cli_method="$1"

run_method
