#!/bin/bash
cd /root/ixpcontrol/PEERS;
for v4ASN in *; do
    if [ -d "$v4ASN" ]; then
		echo "Found ASN: $v4ASN"
		if [[ -e /root/ixpcontrol/PEERS/$v4ASN/AS-SET ]]; then
			peerAS=$(cat /root/ixpcontrol/PEERS/$v4ASN/AS-SET)
				echo "AS-SET Present for ASN: $v4ASN - AS-SET: $peerAS"
			bgpq3 -bl "define PREFIX_AS$v4ASN" -S NTTCOM,RADB,RIPE,ALTDB,BELL,LEVEL3,RGNET,APNIC,JPIRR,ARIN,BBOI,TC,AFRINIC,ARIN-WHOIS,REGISTROBR $peerAS > /root/ixpcontrol/PEERS/$v4ASN/prefix_v4.conf
			echo "ASN: $v4ASN using $peerAS Complete"
			echo "Prefix List"
			cat /root/ixpcontrol/PEERS/$v4ASN/prefix_v4.conf
			sleep 2
		else
			echo "NO AS-SET Found for $v4ASN, Using ASN Only."
			bgpq3 -bl "define PREFIX_AS$v4ASN" -S NTTCOM,RADB,RIPE,ALTDB,BELL,LEVEL3,RGNET,APNIC,JPIRR,ARIN,BBOI,TC,AFRINIC,ARIN-WHOIS,REGISTROBR AS$v4ASN > /root/ixpcontrol/PEERS/$v4ASN/prefix_v4.conf
			echo "ASN: $v4ASN using ASv4ASN Complete"
			echo "Prefix List"
			cat /root/ixpcontrol/PEERS/$v4ASN/prefix_v4.conf
			sleep 2
		fi
    fi
done
