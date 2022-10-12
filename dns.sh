#!/bin/bash
domain=$1
a=$(dig +short "$domain" A)
if [ -z "$domain" ];then
    echo "please specify the domain name"
    exit 1

fi

echo "Name Servers for the domain "$domain" is"
dig +short "$domain" NS
echo
echo "A record for the "$domain" is"
dig +short "$domain" A
echo
echo "MX record for the domain "$domain" is"
dig +short "$domain" MX
echo
echo "TXT records associated with the domain "$domain" is"
dig +short "$domain" TXT
echo
echo "cheking for cname record for www."$domain" is"
dig +short www."$domain" CNAME
echo
echo "checking DMARC record for the domain "$domain" is"
dig +short _dmarc."$domain" TXT
echo
echo "checking for DKIM records"
dig +short default._domainkey."$domain" TXT
echo
echo "checking for PTR record for "$a" 
host ${a}
