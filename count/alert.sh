#!/bin/bash

Time=$(date +"%m-%d-%yT%H:%M:%SZ" --date="20 minutes ago")
echo $Time

mongo --host mongo.local --authenticationDatabase test --eval 'db.access.find({"time": { $gt: ISODate("2020-06-06T12:28:55Z")}, "code": "401"})' > test.txt

ErrorCount=$(wc -l test.txt | cut -d' ' -f1)
echo $ErrorCount

if [ $ErrorCount -ge 10 ]; then
  echo "sending mail"
  echo "Nginx - access denied to website "$ErrorCount" times"  | sendemail -l email.log \
    -f "keshav.thakur991@gmail.com"  \
    -u "Nginx access denied"  \
    -t "keshav.thakur991@gmail.com"  \
    -s "smtp.gmail.com:587"  \
    -o tls=yes  \
    -xu "username or email"  \
    -xp "password"
fi
