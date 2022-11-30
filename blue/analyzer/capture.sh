#!/usr/local/bin/bash

#set -x # echo on

EXPERIMENT="secure-g3"
DST_IP="10.1.2.2"

ETH=$(ssh $1.${EXPERIMENT}.offtech "sudo ip route get ${DST_IP}" | head -1 | awk '{print $5}')

ssh $1.${EXPERIMENT}.offtech "sudo rm -f pcap.pcap"
ssh $1.${EXPERIMENT}.offtech "sudo tcpdump -s0 -U --immediate-mode -nn -i ${ETH} -w pcap.pcap"

