#!/bin/bash

echo "=============================================================================="
echo "                            INFORMACION DE DOMINIOS                           "
echo "  --------------------------------------------------------------------------  "

apiKey=$1
var1=hersheys.com
var2=telmex.com
var3=twitter.com

for ((i=0; $i <= 2; i = $i+1)); do
	if [[ $i == 0 ]]; then
		dominio=$var1
	elif [[ $i == 1 ]]; then 
		dominio=$var2
	elif [[ $i == 2 ]]; then
		dominio=$var3
	fi

	url="https://api.hunter.io/v2/domain-search?domain=${dominio}&api_key=${apiKey}"
	curl -X GET -v ${url} -o ${dominio}.txt
done
echo "=============================================================================="
