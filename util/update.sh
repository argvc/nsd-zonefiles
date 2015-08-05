#!/bin/bash

NOW_IPADDR=$1

OLD_IPADDR=$(cat ../zone/arg.vc.zone | grep "srv001.arg.vc." | grep -v "CNAME" | cut -d " " -f 5 | xargs echo)

python changeip.py $OLD_IPADDR $NOW_IPADDR




