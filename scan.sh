#!/bin/bash

# Default value for site geneator if none found by scan.
default="Unknown"

# file to hold list of all federal domains.
file=current-federal.csv

# Timeout values for curl command.
max_time=10
connect_time=5

# Download current listing of federal domains for Executive agencies, if needed.
if [ ! -f "$file" ]; then
    curl -s https://raw.githubusercontent.com/GSA/data/master/dotgov-domains/current-federal.csv \
    | grep "Federal Agency - Executive" \
    > $file
fi

# Get domains to curl.
domains=($(cat $file | csvcut -c 1 | sort))

# Header row.
echo "Domain, Generator"

# curl domains and extract the x-generator HTTP response header.
for domain in "${domains[@]}"
do
    generator=$(curl -sIL --max-time ${max_time} --connect-timeout ${connect_time} $domain | grep -i x-generator)
    echo "${domain}, ${generator:-$default}"
done