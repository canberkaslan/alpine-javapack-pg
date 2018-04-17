
run_method() {
    if [ -n "$cli_method" ]; then
        case "$cli_method" in
        'install-cacert')
            install_cacert
            ;;
        *)
            #echo $cli_method
        esac
    else
        echo "error: no command given"
        show_help
        exit 1
    fi
}

install_cacert() {
    source_set='false' && ([ -n "$cli_input_string" ] || [ -n "$cli_input_file" ]) && source_set='true'
    one_source='false' && ([ -z "$cli_input_string" ] && [ -n "$cli_input_file" ]) \
                       || ([ -n "$cli_input_string" ] && [ -z "$cli_input_file" ]) && one_source='true'
    output_set='false' && ([ -n "$cli_output_file" ]) && output_set='true'

    if [ $source_set == 'false' ] || [ $one_source == 'false' ] || [ $output_set == 'false' ]; then
        show_help
        exit 1;
    fi

    echo installing cacert

    source='' && [ -n "$cli_input_string" ] && source="$cli_input_string"
    [ -z "$source" ] && [ -n "$cli_input_file" ] && source=$(cat "$cli_input_file")


    printf "$source" > "$cli_output_file"
}

show_help() {
    echo \
'''
Usage: ./utility.cli.sh [OPTIONS] COMMAND

Options:
    -h, -?     help & usage
    -o         output file path
    -f         input file path
    -s         string value

Commands:
    install-cacert  (requires: -f|-s and -o)
'''
}