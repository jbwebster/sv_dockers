#!/bin/bash

set -o pipefail
set -o errexit
set -o nounset

for i in $(echo ${1} | tr "," "\n"); do
  echo "$i" >> vcf_list.txt
done

/usr/bin/SURVIVOR merge vcf_list.txt ${2} ${3} ${4} ${5} ${6} ${7} ${8}
