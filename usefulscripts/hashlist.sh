#!/bin/bash
set -e


if [[ $# -eq 0 ]] ; then
    echo -e "Usage: \n $0 dump.pcap \n"
    exit 0
fi


tmp_hash_file=/tmp/hcxpcapnghash_$((RANDOM))

hcxpcapngtool -o $tmp_hash_file $1
hcxhashtool -i $tmp_hash_file --info=stdout

rm $tmp_hash_file
