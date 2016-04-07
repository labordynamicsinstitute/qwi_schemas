#!/bin/bash
# set defaults
toclevels=3
# print out info
if [[ -z $1 ]]
then
echo "
	$0 [start|version]

	will build the format documentation from CSV files and a template.

	Version = cornell|draft|official changes a note in the document
	"
	exit 1
fi

if [[ "$1" = "start" ]]
then
	version=cornell
else
	version=$1
fi
case $version in
	cornell)
	author=lars.vilhuber@cornell.edu
	;;
	official|draft)
	author=ces.qwi.feedback@census.gov
	;;
esac
cwd=$(pwd)
# parse version from directory
numversion=${cwd##*/}
# convert the column definitions to CSV
sed 's/  /,/g;s/R N/R,N/; s/,,/,/g; s/,,/,/g; s/,,/,/g; s/, /,/g' column_definitions.txt | tail -n +2 > tmp.csv

# create ascii doc version
asciifile=lehd_csv_naming.asciidoc
echo "= LEHD Public Use CSV Naming Schema $numversion - CSV Naming Convention"> $asciifile
echo "Lars Vilhuber <${author}>" >> $asciifile
echo "$(date +%d\ %B\ %Y)
// a2x: --dblatex-opts \"-P latex.output.revhistory=0 --param toc.section.depth=${toclevels}\"

( link:$(basename $asciifile .asciidoc).pdf[Printable version] )

" >> $asciifile

# A note on the relevance/beta/draft status of this file.

case $version in
	cornell)
echo "
[IMPORTANT]
.Important
==============================================
This document is not an official Census Bureau publication. It is compiled from publicly accessible information
by Lars Vilhuber (http://www.ilr.cornell.edu/ldi/[Labor Dynamics Institute, Cornell University]).
Feedback is welcome. Please write us at
link:mailto:lars.vilhuber@cornell.edu?subject=LEHD_Schema_v4[lars.vilhuber@cornell.edu].
==============================================
" >> $asciifile
  ;;
	draft)
	echo "
[IMPORTANT]
.Important
==============================================
This specification is draft. Feedback is welcome. Please write us at link:mailto:${author}?subject=LEHD_Schema_draft[${author}].
==============================================
	" >> $asciifile
	;;
	official)
echo "
[IMPORTANT]
.Important
==============================================
Feedback is welcome. Please write us at link:mailto:${author}?subject=LEHD_Schema_draft[${author}].
==============================================
	" >> $asciifile
	;;
esac

# start the schema description
echo "
Purpose
-------
The public-use data from the Longitudinal Employer-Household Dynamics Program, including the Quarterly Workforce Indicators (QWI)
and Job-to-Job Flows (J2J), are available for download with the following data schema.
These data are available as Comma-Separated Value (CSV) files through the LEHD website’s Data page at
http://lehd.ces.census.gov/data/ and through LED Extraction Tool at http://ledextract.ces.census.gov/.

This document describes the file naming schema for LEHD-provided CSV files. The contents (schema) are described in  link:lehd_public_use_schema.html[].

Extends
-------
This version extends v4.0. Any file compliant with LEHD or QWI Schema v4.0 will also be compliant with this schema.

Supersedes
----------
For the specified files, this is the first schema.


Basic Schema
------------

All files are preceded by a file type definition, followed by additional information on the aggregation level of the file, or
some other identifier.

-------------------
[TYPE]_[DETAILS].[EXT]
-------------------


=== QWIPU from the LED Extraction Tool
Files downloaded through the  LED Extraction Tool at http://ledextract.ces.census.gov/ follow the following naming convention:
------------------------------------
[type]_[id].[EXT]
------------------------------------
where +[id]+ is the Request ID (a unique string of characters) generated every time ``Submit Request'' is clicked. The ID references each query submission made to the database.

=== Other files
Files downloaded from the LEHD website at http://lehd.ces.census.gov/data follow the following naming convention:
--------------------------------
[type]_[geohi]_[demo]_[fas]_[geocat]_[indcat]_[ownercat]_[sa].[EXT]
--------------------------------
where each component is described in more detail below. Schema files detailing legal values for each component can be downloaded from this website.

" >> $asciifile


#########################3 Types
echo "
== Description of Filename Components

=== Types

( link:naming_type.csv[] )

[width=\"90%\",format=\"csv\",delim=\";\",cols=\"^1,<3,<5,<3\",options=\"header\"]
|===================================================
include::naming_type.csv[]
|===================================================
" >> $asciifile

######################## other components
# start with fips postal
name=geohi
  arg=naming_$name.csv
  echo "=== $name
( link:${arg}[] )

This component is based on the alphabetic FIPS state code equivalent to the numeric FIPS code in link:label_fipsnum.csv[], based on https://catalog.data.gov/dataset/fips-state-codes[FIPS PUB 5-2]. It is expanded to encompass additional codes denoting national coverage, or a collection of states.

[width=\"60%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
type,Description
$(egrep "^all" $arg)
$(egrep "^us" $arg)
st,Any legal 2-character state postal code (see link:${arg}[] )
|===================================================
" >> $asciifile

for name in demo fas geocat indcat owncat sa ext
do
  arg=naming_$name.csv
  echo "=== $name
( link:${arg}[] )

[width=\"60%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================

<<<

" >> $asciifile
done

# extensions


cat CHANGES.txt >> $asciifile

echo "
[IMPORTANT]
.Important
==============================================
Some of the data products noted above do not exist yet.
==============================================

<<<
*******************
This revision: $(date)
*******************
" >> $asciifile
echo "$asciifile created"
asciidoc -a icons -a toc -a numbered -a linkcss $asciifile
echo "$(basename $asciifile .asciidoc).html created"
a2x -f pdf -a icons -a toc -a numbered -a linkcss $asciifile
echo "$(basename $asciifile .asciidoc).pdf created"
html2text $(basename $asciifile .asciidoc).html > $(basename $asciifile .asciidoc).txt
echo "$(basename $asciifile .asciidoc).txt created"
