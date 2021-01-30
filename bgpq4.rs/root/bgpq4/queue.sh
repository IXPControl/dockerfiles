cd /root/ixpcontrol/QUEUE;
for v4ASN in *; do
    if [ -d "$v4ASN" ]; then
        if [[ -e /root/ixpcontrol/QUEUE/$v4ASN/peer_v4.conf ]]; then
                echo "Found ASN: $v4ASN"
                if [[ -e /root/ixpcontrol/QUEUE/$v4ASN/AS-SET ]]; then
                        peerAS=$(cat /root/ixpcontrol/QUEUE/$v4ASN/AS-SET)
                        echo "AS-SET Present for ASN: $v4ASN - AS-SET: $peerAS"
                                bgpq4 -bl "define PREFIX_AS$v4ASN" -S NTTCOM,RADB,RIPE,ALTDB,BELL,LEVEL3,RGNET,APNIC,JPIRR,ARIN,BBOI,TC,AFRINIC,ARIN-WHOIS,REGISTROBR $peerAS > /root/ixpcontrol/QUEUE/$v4ASN/prefix_v4.conf
                        echo "ASN: $v4ASN using $peerAS Complete"
                else
                        echo "NO AS-SET Found for $v4ASN, Using ASN Only."
                                bgpq4 -bl "define PREFIX_AS$v4ASN" -S NTTCOM,RADB,RIPE,ALTDB,BELL,LEVEL3,RGNET,APNIC,JPIRR,ARIN,BBOI,TC,AFRINIC,ARIN-WHOIS,REGISTROBR AS$v4ASN > /root/ixpcontrol/QUEUE/$v4ASN/prefix_v4.conf
                        echo "ASN: $v4ASN Complete"
                fi
                        echo "Moving Files"
                                if [[ ! -e /root/ixpcontrol/PEERS/$v4ASN ]]; then
                                          mkdir /root/ixpcontrol/PEERS/$v4ASN
                                fi
                                if [[ ! -e /root/ixpcontrol/QUEUE/$v4ASN/peer_v6.conf ]]; then
                                        mv /root/ixpcontrol/QUEUE/$v4ASN/AS-SET /root/ixpcontrol/PEERS/$v4ASN/AS-SET
                                fi
                                if [[ -e /root/ixpcontrol/QUEUE/$v4ASN/prefix_v4.conf ]]; then
                                        mv /root/ixpcontrol/QUEUE/$v4ASN/peer_v4.conf /root/ixpcontrol/PEERS/$v4ASN/peer_v4.conf
                                        mv /root/ixpcontrol/QUEUE/$v4ASN/prefix_v4.conf /root/ixpcontrol/PEERS/$v4ASN/peer_v4.conf
                                fi
        fi
    fi
done

cd /root/ixpcontrol/QUEUE;
for v6ASN in *; do
    if [ -d "$v6ASN" ]; then
        if [[ -e /root/ixpcontrol/QUEUE/$v6ASN/peer_v6.conf ]]; then
                echo "Found ASN: $v6ASN"
                if [[ -e /root/ixpcontrol/QUEUE/$v6ASN/AS-SET ]]; then
                        peerAS=$(cat /root/ixpcontrol/QUEUE/$v6ASN/AS-SET)
                        echo "AS-SET Present for ASN: $v6ASN - AS-SET: $peerAS"
                                bgpq4 -b6l "define PREFIX_AS$v6ASN" -S NTTCOM,RADB,RIPE,ALTDB,BELL,LEVEL3,RGNET,APNIC,JPIRR,ARIN,BBOI,TC,AFRINIC,ARIN-WHOIS,REGISTROBR $peerAS > /root/ixpcontrol/QUEUE/$v6ASN/prefix_v6.conf
                        echo "ASN: $v6ASN using $peerAS Complete"
                else
                        echo "NO AS-SET Found for $v6ASN, Using ASN Only."
                                bgpq4 -b6l "define PREFIX_AS$v6ASN" -S NTTCOM,RADB,RIPE,ALTDB,BELL,LEVEL3,RGNET,APNIC,JPIRR,ARIN,BBOI,TC,AFRINIC,ARIN-WHOIS,REGISTROBR AS$v6ASN > /root/ixpcontrol/QUEUE/$v6ASN/prefix_v6.conf
                        echo "ASN: $v6ASN Complete"
                fi
                        echo "Moving Files"
                                if [[ ! -e /root/ixpcontrol/PEERS/$v6ASN ]]; then
                                          mkdir /root/ixpcontrol/PEERS/$v6ASN
                                fi
                                if [[ ! -e /root/ixpcontrol/QUEUE/$v6ASN/peer_v4.conf ]]; then
                                        mv /root/ixpcontrol/QUEUE/$v6ASN/AS-SET /root/ixpcontrol/PEERS/$v6ASN/AS-SET
                                fi
                                if [[ -e /root/ixpcontrol/QUEUE/$v6ASN/prefix_v6.conf ]]; then
                                        mv /root/ixpcontrol/QUEUE/$v6ASN/peer_v6.conf /root/ixpcontrol/PEERS/$v6ASN/peer_v6.conf
                                        mv /root/ixpcontrol/QUEUE/$v6ASN/prefix_v6.conf /root/ixpcontrol/PEERS/$v6ASN/peer_v6.conf
                                fi
        fi
    fi
done


rm -rf /root/ixpcontrol/QUEUE/*;