#!/bin/bash

if [[ -z $1 ]]
then
cat << EOF
  $0 (name of file)

  converts qwipu and qwipur variable names into variability names

EOF
exit
fi

file=$1
[[ -f $file ]] || ( echo "$file not found" && exit 2)

outfile=$(basename $file .csv)v.csv
[[ -f $outfile ]] && \rm -i $outfile
[[ -f $outfile ]] && exit 2

prefixes="st vt vb vm df mr"

head -1 $file | awk -F, ' OFS="," { print $1, $2, $4 }' > $outfile

for prefix in $prefixes
do
  case $prefix in
    st)
    name="Standard error of "
    ;;
    vt)
    name="Total variation of "
    ;;
    vb)
    name="Between-implicate variability for "
    ;;
    vw)
    name="Average within-implicate variability for "
    ;;
    mr)
    name="Missingness ratio for "
    ;;
    df)
    name="Degrees of freedom for VT of "
    ;;
  esac

 tail -n +2 $file |\
  awk -v prefix=$prefix -v name="$name" -F, ' OFS="," { print prefix"_"$1, prefix"_"$2,name $4 }' >> $outfile
done
