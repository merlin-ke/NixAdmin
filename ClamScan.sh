#!/bin/bash
timestamp=$(date "+%Y.%m.%d")
scan=$(hostname).$timestamp.Daily.txt
myhome=$(hostname | cut -d . -f1)
mymail=$myhome
mysupport="123@123.com"
status=$?
echo "Subject:Daily Scan Report For $(hostname | cut -d . -f1) On $(date "+%Y.%m.%d")" > /home/Scripts/scanresult/$scan
echo "MIME-Version: 1.0" >> /home/Scripts/scanresult/$scan
echo "Content-Type: text/plain" >> /home/Scripts/scanresult/$scan
echo "From: $myhome<$mymail>" >> /home/Scripts/scanresult/$scan
echo "Sender:$myhome <$mymail>" >> /home/Scripts/scanresult/$scan
echo -en '\n' >>  /home/Scripts/scanresult/$scan
sudo clamscan -i -r  /123/123/123/ /12/lo34/ >> /home/Scripts/scanresult/$scan
if [ "$status" = "0" ]; then
       /usr/sbin/sendmail $mysupport < /home/Scripts/scanresult/$scan
else
   echo "Subject:Scan Report For $(hostname | cut -d . -f1) On $(date "+%Y.%m.%d") Failed" | sudo /usr/sbin/sendmail $mysupport
fi
