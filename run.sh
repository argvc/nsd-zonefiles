#!/bin/bash

nsd_command='/usr/sbin/nsd -d -c /etc/nsd3/nsd.conf -l /var/lib/nsd.log'

function start {
    eval ${nsd_command}
}

function start_with_test {
    nsd-checkconf  /etc/nsd3/nsd.conf
    eval ${nsd_command} &
    rake
}

function version {
    echo "$(basename ${0}) version 0.0.1 "
}

function usage {
    cat <<EOF
run.sh is a tool for argvc/nsd

Usage:
    $(basename ${0}) [command] [<options>]

Commmand:
    nsd         run nsd3
    test        test
    version     print $(basename ${0}) version
    help        print this
EOF
}

case ${1} in
    nsd)
      start
    ;;
    
    test)
      start_with_test
    ;;

    help)
      usage
    ;;

    version)
      version
    ;;

    *)
      echo "Invalid Command"
      usage
      exit 1
    ;;
esac

