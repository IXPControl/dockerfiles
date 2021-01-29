#!/bin/bash
cd /root/ixpcontrol/PEERS;
for v6ASN in *; do
    if [ -d "$v6ASN" ]; then
		echo "Found ASN: $v6ASN"
		if [[ -e /root/ixpcontrol/PEERS/$v6ASN/AS-SET ]]; then
			peerAS=$(cat /root/ixpcontrol/PEERS/$v6ASN/AS-SET)
				echo "AS-SET Present for ASN: $v6ASN - AS-SET: $peerAS"
			bgpq3 -b6l "define PREFIX_AS$v6ASN" -S NTTCOM,RADB,RIPE,ALTDB,BELL,LEVEL3,RGNET,APNIC,JPIRR,ARIN,BBOI,TC,AFRINIC,ARIN-WHOIS,REGISTROBR $peerAS > /root/ixpcontrol/PEERS/$v6ASN/prefix_v6.conf
			echo "ASN: $v6ASN using $peerAS Complete"
			echo "Prefix List"
			cat /root/ixpcontrol/PEERS/$v6ASN/prefix_v6.conf
			sleep 2
		else
			echo "NO AS-SET Found for $v6ASN, Using ASN Only."
			bgpq3 -b6l "define PREFIX_AS$v6ASN" -S NTTCOM,RADB,RIPE,ALTDB,BELL,LEVEL3,RGNET,APNIC,JPIRR,ARIN,BBOI,TC,AFRINIC,ARIN-WHOIS,REGISTROBR AS$v6ASN > /root/ixpcontrol/PEERS/$v6ASN/prefix_v6.conf
			echo "ASN: $v6ASN using AS$v6ASN Complete"
			echo "Prefix List"
			cat /root/ixpcontrol/PEERS/$v6ASN/prefix_v6.conf
			sleep 2
		fi
    fi
done