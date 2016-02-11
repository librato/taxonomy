#!/bin/sh 

#recursively walk the tree and generate the index pages 
p2="./Part2"

cd ${p2}
dirlist=$(find . -type f |grep -vi README | while read i; do dirname ${i}; done | sort | uniq)

for dir in ${dirlist}
do 
	files=$(find ${dir} -type f | grep -vi README)
	echo "# Tools in ${dir}" > ${dir}/README.md
	for file in ${files}
	do
		link=$(basename ${file})
		name=$(cat ${file} | grep '^#[^#]')
		if echo ${name} | grep -q '<Name>'
		then
			name=$(echo ${link} | sed -e 's/\..*$//')
		fi
		desc=$(cat ${file} | grep '^##[^#]')
		if echo ${desc} | grep -q '<Single-Line Description>'
		then
			desc='This tool is not yet documented'
		fi
		echo "## [${name}](${link})" >> ${dir}/README.md
		echo "${desc}" >> ${dir}/README.md
	done
done
