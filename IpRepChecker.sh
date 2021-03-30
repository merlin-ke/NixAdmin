#!/bin/bash
function greynoise(){
        curl -s http://api.greynoise.io/v3/community/$1 | python -m json.tool

}

function virustotal()
{
        echo "WIP"
}

function oTX()
{
        echo "WIP"
}

function ipconvert ()  
{
if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$  ]]
then
        local IP=$1
        echo "$1 is a valid IP"
        echo "Will now query Greynoise"
        greynoise $IP
else
        echo "$1 is an invalid IP"
fi

  }

ipconvert $1
