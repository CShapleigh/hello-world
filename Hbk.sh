#!/bin/bash
set -e
set -u
set -o pipefail 
array=($(ls ./junk/*.gz))
echo ${array[@]}
for file in ${array[@]};
do
	results="$(basename $file .fa.gz).out"
	/programs/diamond-0.7.5/diamond blastx -d  phosphonate_A.dmnd -q ${file} -p 8 -e 1e-5 -k 10 -a ./junk/$results
done;