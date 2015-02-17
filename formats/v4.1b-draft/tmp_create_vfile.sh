#!/bin/bash

if [[ -z $2 ]]
then
echo "$0 infile outfile

	will generate a draft variability measure file
	"
exit 2
fi

infile=$1
outfile=$2

echo "Variability measure,Alternate name,Name of variable" > $outfile
awk -F, ' { OFS=","; print "vt_" $1 , "vt_" $2 , "Total variation of " $4 } ' $infile | grep -v "Indicator" >> $outfile
awk -F, ' { OFS=","; print "df_" $1 , "df_" $2 , "Degrees of freedom for VT of " $4 } ' $infile | grep -v "Indicator" >> $outfile
awk -F, ' { OFS=","; print "mr_" $1 , "mr_" $2 , "Missingness ratio for " $4 } ' $infile | grep -v "Indicator" >> $outfile
awk -F, ' { OFS="," ; print "vw_" $1, "vb_" $2, "Average within-implicate variability for " $4 } ' $infile | grep -v "Indicator" >> $outfile
awk -F, ' { OFS="," ; print "vb_" $1, "vb_" $2, "Between-implicate variability for " $4 } ' $infile | grep -v "Indicator" >> $outfile
