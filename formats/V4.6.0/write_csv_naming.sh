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
	official|lehd|draft|*)
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
previousvintage=$(cd ..; ls -1d * | grep -E "V[0-9]" | tail -2 | head -1)
echo "= LEHD Public Use  Schema $numversion - File and Directory Naming Convention"> $asciifile
echo "<${author}>" >> $asciifile
echo "$(date +%d\ %B\ %Y)
:ext-relative: {outfilesuffix}

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
by Lars Vilhuber (https://www.ilr.cornell.edu/ldi/[Labor Dynamics Institute, Cornell University]).
Feedback is welcome. Please write us at
link:mailto:${author}?subject=LEHD_Schema_v4[${author}].
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
https://lehd.ces.census.gov/data/ and through LED Extraction Tool at https://ledextract.ces.census.gov/.

This document describes the file and directory naming schema for LEHD-provided CSV files.

Schema for Data File Contents
-----------------------------

The contents (schema) for LEHD data files are described in  link:lehd_public_use_schema{ext-relative}[].
The contents (schema) for shapefiles are described in link:lehd_shapefiles{ext-relative}[].

Extends
-------
This version modifies a portion of the structure of the metadata. Many files compliant with LEHD or QWI Schema v4.2 or lower will also be compliant with this schema, but compatibility is not guaranteed.

Supersedes
----------
This version supersedes V4.4.0, for files released as of R2020Q1.


Basic Filename Schema
---------------------

All files are preceded by a file type definition, followed by additional information on the aggregation level of the file, or
some other identifier.

....................................
 [TYPE]_[DETAILS].[EXT]
....................................

( link:naming_convention.csv[] )
" >> $asciifile

# transform the convention file to prevent typographical interpretation by asciidoc
cat naming_convention.csv | sed 's+_+\\_+g' | sed 's+\\_\[id\]+_[id]+' |
 sed 's+\\_\[sa\]+_[sa]+' | sed 's+\\_\[geocat\]\.zip+_[geocat].zip+' |
 sed 's+\\_\[fas\]\.+_[fas].+' | sed 's+\\_\[geography\]\\_+_[geography]_+' > tmp_naming_convention.csv

echo "
[width=\"90%\",format=\"csv\",delim=\",\",cols=\"^1,<3,<5\",options=\"header\"]
|===================================================
include::tmp_naming_convention.csv[]
|===================================================

=== QWIPU from the LED Extraction Tool
Files downloaded through the  LED Extraction Tool at https://ledextract.ces.census.gov/ follow the following naming convention:
....................................
 [type]_[id].[EXT]
....................................
where +[id]+ is the Request ID (a unique string of characters) generated every time ``Submit Request'' is clicked. The ID references each query submission made to the database.


=== [[versionqwi]]Metadata for QWI and J2J data files (version.txt)
Metadata accompanies the data files, identifying provenance, geographic and temporal coverage. These files follow the following naming convention:
....................................
$(awk -F, ' NR == 5 { print $1 }' naming_convention.csv  )
....................................
where each name component is described in more detail <<components,below>>.



=== [[version_j2jod]]Metadata for J2JOD files
Because the origin-destination (J2JOD) data link two regions, we provide an auxiliary file with the time range for which cells containing data for each geographic pairing may appear in a data release. The reference region will always be either the origin or the destination.
These files follow the following naming convention:
....................................
$(awk -F, ' NR ==  6 { print $1 }' naming_convention.csv  )
....................................
where each name component is described in more detail <<components,below>>.


" >> $asciifile


######################### Types
echo "
== [[paths]]Directory Paths
Downloadable data files are organized on the download server (at the time of this writing: https://lehd.ces.census.gov/data/) in directories organized as follows:

....................................
 SERVER/data/[PRODUCT]/[RELEASE]/[GEOHI][ /[TYPE] ]/{files}
....................................

where [<<products,PRODUCT>>], [<<release,RELEASE>>], [<<geohi,GEOHI>>], and [<<types,TYPE>>] are each described below. [<<types,TYPE>>] is optional.


== [[components]]Description of Naming Components

=== [[release]]Release

A *release* is defined by the calendar year quarter when data production occurs. It is thus generically constructed as

....................................
 R[YEAR]Q[QUARTER]
....................................

where +[YEAR]+ is the 4-digit year and +[QUARTER]+ the single-digit calendar year quarter (1-4).

=== [[types]]Types and [[products]]Products

( link:naming_type.csv[] )

[width=\"90%\",format=\"csv\",delim=\";\",cols=\"^1,<1,<3,<5,<3\",options=\"header\"]
|===================================================
include::naming_type.csv[]
|===================================================
" >> $asciifile

######################## other components
# start with fips postal
name=geohi
  arg=naming_$name.csv
  echo "=== [[$name]]$name
( link:${arg}[] )

The $name component in *filenames* is based on one of two possible code sets:

- the lower-case alphabetic FIPS or postal state code based on https://catalog.data.gov/dataset/fips-state-codes[FIPS PUB 5-2] (see also link:label_stusps.csv[] for upper-case variants).
- the numeric CBSA code corresponding to the metropolitan areas (see link:label_geography_metro.csv[])
- It is expanded to encompass additional codes denoting national coverage, or a collection of states.

For *directories*, files at the CBSA level are collected under a single *metro* directory.

[width=\"60%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
type,Description
$(egrep "^all" $arg)
$(egrep "^us" $arg)
metro,Indicates collection of CBSA-level files (*directory names only*)
+[st]+,Any legal 2-character lower-case state postal code
+[NNNNN]+,Any valid CBSA-derived code listed in link:label_geography_metro.csv[]
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
asciidoctor -b html5 -a icons -a toc -a numbered -a linkcss -a outfilesuffix=.html $asciifile
echo "$(basename $asciifile .asciidoc).html created"
asciidoctor-pdf -a pdf-page-size=letter -a icons -a toc -a numbered -a linkcss -a outfilesuffix=.pdf $asciifile
echo "$(basename $asciifile .asciidoc).pdf created"
#html2text $(basename $asciifile .asciidoc).html > $(basename $asciifile .asciidoc).txt
#echo "$(basename $asciifile .asciidoc).txt created"
echo "Deleting tmp files"
rm tmp*
