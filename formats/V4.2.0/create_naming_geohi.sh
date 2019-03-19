#!/bin/bash
# This builds naming_geohi.csv from components
output=naming_geohi.csv
inputa=label_stusps.csv
inputb=label_geography_metro.csv

if [[ -z $1 ]]
then
  cat << EOF
  $0 start

  will create $output based on $inputa and $inputb and some manual text.

  Existing file will be moved out of the way, and compared at the end.
EOF
exit 2
fi
# initialize file
[[ -f $output ]] && mv -i ${output} ${output}.bak
cat > $output << EOF
type,Description
us,"National data (50 states + DC)"
all,"Collection of all available states"
EOF
tail -n +3 $inputa | grep -vE "Puerto Rico|Virgin Islands" | awk -F, ' BEGIN { OFS=","}  { state =  tolower($2); gsub(/"/,"",state); print state,$3 }  ' >> $output
tail -n +2 $inputb | awk -F',"|^"|"$|",' ' BEGIN { OFS=","}  { print $1,"\"" $2 "\"" }' >> $output

# compare

diff ${output}.bak ${output} | less
