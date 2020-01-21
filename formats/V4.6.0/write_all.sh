#!/bin/bash
# print out info
if [[ -z $1 ]]
then
echo "
	$0 [start|version]

	will build the format documentation from CSV files and a template.
  for all docs

	Version = cornell|draft|official changes a note in the document
	"
	exit 1
fi

./write_csv_naming.sh $1
./write_schemadoc.sh $1
./write_shapefiles.sh $1
#./write_j2jappdoc.sh $1
