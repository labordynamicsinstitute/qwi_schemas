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
# parse version from directory
   version=cornell
else
   version=$1
fi
case $version in
	cornell)
	author=lars.vilhuber@cornell.edu
	;;
	draft)
	author=lars.vilhuber@census.gov
	;;
	official)
	author=ces.qwi.feedback@census.gov
	;;
esac
cwd=$(pwd)
numversion=${cwd##*/}
# convert the column definitions to CSV
sed 's/  /,/g;s/R N/R,N/; s/,,/,/g; s/,,/,/g; s/,,/,/g; s/, /,/g' column_definitions.txt | tail -n +2 > tmp.csv

# create ascii doc version
asciifile=lehd_public_use_schema.asciidoc
echo "= LEHD Public Use Data Schema $numversion" > $asciifile
echo "Lars Vilhuber <${author}>" >> $asciifile
echo "$(date +%d\ %B\ %Y)
// a2x: --dblatex-opts \"-P latex.output.revhistory=0 --param toc.section.depth=${toclevels}\"
:ext-relative: {outfilesuffix}
( link:QWIPU_Data_Schema.pdf[Printable version] )

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
Feedback is welcome. Please write us at link:mailto:${author}?subject=LEHD_Schema[${author}].
==============================================
	" >> $asciifile
	;;
esac

# start the schema description
echo "
Purpose
-------
The public-use Quarterly Workforce Indicators (QWI) data from the Longitudinal Employer-Household Dynamics Program
 are available for download with the following data schema.
These data are available as Comma-Separated Value (CSV) files through the LEHD website’s Data page at
http://lehd.ces.census.gov/data/ and through LED Extraction Tool at http://ledextract.ces.census.gov/.


This document describes the data schema for QWI files. For each variable,
a set of allowable values is defined. Definitions are provided as CSV files,
with header variable definitions.  Changes relative to the original v4.0 version are listed <<changes,at the end>>.

File naming
-----------
The naming conventions of the data files is documented in link:lehd_csv_naming.html[].

Extends
-------
This version extends v4.0. Any file compliant with LEHD or QWI Schema v4.0 will also be compliant with this schema.

Basic Schema
------------
Each data file is structured as a CSV file. The first columns contain <<identifiers,identifiers>>, subsequent columns contain <<indicators,indicators>>, followed by <<statusflags,status flags>>.

=== Generic structure

[width=\"30%\",format=\"csv\",cols=\"<2\",options=\"header\"]
|===================================================
Column name
[ Identifier1 ]
[ Identifier2 ]
[ Identifier3 ]
[ ... ]
[ Indicator 1 ]
[ Indicator 2 ]
[ Indicator 3 ]
[ ... ]
[ Status Flag 1 ]
[ Status Flag 2 ]
[ Status Flag 3 ]
[ ... ]
|===================================================

Note: A full list of indicators for each type of file are shown below in the <<indicators,Indicators>> section.
While all indicators are included in the CSV files, only the requested indicators
will be included in data outputs from the LED Extraction Tool.

<<<

=== [[identifiers]]Identifiers
Records, unless otherwise noted, are parts of time-series data. Unique record identifiers are noted below, by file type.
Identifiers without the year and quarter component can be considered a series identifier.
" >> $asciifile

############################## Identifiers

for arg in   $(ls lehd_identifiers_*csv)
do
  name="$(echo ${arg%*.csv}| sed 's/lehd_//; s/_/ for /; s/ident/Ident/')"
  echo "==== $name
( link:${arg}[] )

[width=\"100%\",format=\"csv\",cols=\"2*^1,<3\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================
<<<

" >> $asciifile
done

################################# Variables
echo "
<<<
=== [[indicators]]Indicators
The following tables and associated mapping files
list the indicators available on each file.  The ''Indicator Variable'' is the short name of the variable on the CSV files, suitable for machine processing in a wide variety of statistical applications. When given, the ''Alternate name'' may appear in related documentation and articles. The ''Status Flag'' is used to indicate publication or data quality status (see <<statusflags,Status Flags>>). The ''Indicator Name'' is a more verbose description of the indicator.


( link:variables_qwipu.csv[variables_qwipu.csv] )
[width=\"95%\",format=\"csv\",cols=\"3*^2,<5\",options=\"header\"]
|===================================================
include::variables_qwipu.csv[]
|===================================================

<<<
" >> $asciifile


################################ Formats
echo "
== [[catvars]]Categorical Variables
Categorical variable descriptions are displayed above each table, with the variable name shown in parentheses. Unless otherwise stated, every possible value/label combination for each categorical variable is listed. Please note that not all values will be available in every table.

" >> $asciifile

# we do industry and geo last
for arg in $(ls label_*csv| grep -vE "geo|ind_level|industry|agg_level|flags|fips")
do
  name=$(echo ${arg%*.csv}| sed 's/label_//')
  echo "=== $name
( link:${arg}[] )

[width=\"60%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================
" >> $asciifile
done
################################ Industry formats
# now do industry
  name=Industry

  echo "<<<
=== $name ===

 " >> $asciifile

for arg in   $(ls label_ind_level*csv)
do
  name="$(echo ${arg%*.csv}| sed 's/lehd_//; s/_/ for /')"
  link="$(echo ${arg%*.csv}| sed 's/label_//')"
  echo "[[$link]]
==== Industry levels
( link:${arg}[] )

[width=\"60%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================
" >> $asciifile

arg=label_industry.csv
	# construct the sample industry file
	head -8 $arg > tmp2.csv
	echo "...," >> tmp2.csv
	grep -A 4 -B 4 "31-33" $arg | tail -8  >> tmp2.csv
	echo "...," >> tmp2.csv

echo "
==== Industry
( link:${arg}[] )

Only a small subset of available values shown.
The 2012 NAICS (North American Industry Classification System) is used for all years.
QWI releases prior to R2015Q3 used the 2007 NAICS classification (see link:../V4.0.1[Schema v4.0.1]).
For a full listing of all valid 2012 NAICS codes, see http://www.census.gov/cgi-bin/sssd/naics/naicsrch?chart=2012.

[width=\"90%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
include::tmp2.csv[]
|===================================================
<<<
" >> $asciifile
done


################################ Geo formats
# now do geography
  name=Geography
	# construct the NS file
	nsfile=label_fipsnum.csv
	echo "geography,label" > $nsfile
	grep -h -E "^[0-9][0-9]," ??/label_geography.csv >> $nsfile

	# construct the sample fips file
	head -8 $nsfile > tmp.csv
	echo "...," >> tmp.csv
	head -50 $nsfile | tail -8  >> tmp.csv

	# construct the composite file from separate files
	head -1 ak/label_geography.csv > label_geography_all.csv
	echo '00,"National (50 States + DC)"' >> label_geography_all.csv
	for arg in $(ls ??/label_geography.csv)
	do
	  tail -n +2 $arg >> tmp3.csv
	done
	cat tmp3.csv | sort -n -k 1 -t , >> label_geography_all.csv
	rm tmp3.csv

  echo "=== $name ===

  " >> $asciifile

for arg in   $(ls label_geo_level*csv)
do
  name="$(echo ${arg%*.csv}| sed 's/label_//')"
  echo "[[$name]]
==== Geographic levels
[[$arg]]
( link:${arg}[] )

[width=\"40%\",format=\"csv\",cols=\"^1,<3\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================
" >> $asciifile
done

echo "
Geography labels are provided in separate files, in directories by state. Note that cross-state CBSA will have
state-specific parts, and thus will appear in multiple files.
A separate link:$nsfile[$nsfile] contains values and labels
for all entities of <<geo_level,geo_level>> 'n' or 's', and is a summary of separately available files. For convenience

==== State-level values ====
( link:$nsfile[] )

[width=\"40%\",format=\"csv\",cols=\"^1,<3\",options=\"header\"]
|===================================================
include::tmp.csv[]
|===================================================

==== Detailed state and substate level values

For a full listing of all valid geography codes (except for WIA codes), see http://www.census.gov/geo/maps-data/data/tiger.html.
Note about geography codes: Four types of geography codes are represented with this field, depending on the value of <<geo_level,geo_level>>.
Each geography has its own code structure:

- State is the 2-digit http://www.census.gov/geo/reference/ansi_statetables.html[FIPS 55-2] (now INCITS 38:200x) code (<<geo_level,geo_level>> = 's')
- A two-digit '00' reflects coverage for \"National (50 States + DC)\" (<<geo_level,geo_level>> = 'n')
- County is the 5-digit http://www.census.gov/geo/reference/codes/cou.html[FIPS 6-4] (now INCITS 31:200x) code (<<geo_level,geo_level>> = 'c')
- Metropolitan/Micropolitan codes are constructed from the 2-digit state FIPS code and the 5-digit http://www.census.gov/population/metro/[CBSA] code provided by the Census Bureau’s Geography Division. (<<geo_level,geo_level>> = 'm')
** In the QWI, the metropolitan/micropolitan areas are the state parts of the full CBSA areas.
- The WIA code is constructed from the 2-digit state FIPS code and the 6-digit WIA identifier provided by LED State Partners. (<<geo_level,geo_level>> = 'w')

The 2015 vintage of Census TIGER/Line geography is used for all tabulations as of the R2015Q4 release.

For convenience, a composite file containing all geocodes is available as
link:label_geography_all.csv[].

[format=\"csv\",width=\"50%\",cols=\"^1,^3\",options=\"header\"]
|===================================================
State,Format file" >> $asciifile

  for arg in $(ls  ??/label_geography.csv )
  do
  	state=$(dirname ${arg}|tr [a-z] [A-Z])
	echo "$state,link:${arg}[]" >> $asciifile
  done
echo "|===================================================" >> $asciifile

################################# Variables
# finish file


arg=label_flags.csv
echo "
<<<
== [[statusflags]]Status flags
( link:${arg}[] )

Each status flag in the tables above contains one of the following valid values.
The values and their interpretation are listed in the table below.


[width=\"80%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================

<<<

" >> $asciifile


cat CHANGES.txt >> $asciifile

echo "

<<<
*******************
This revision: $(date)
*******************
" >> $asciifile
echo "$asciifile created"
asciidoc -a icons -a toc -a numbered -a linkcss -a toclevels=$toclevels -a outfilesuffix=.html $asciifile
[[ -f $(basename $asciifile .asciidoc).html  ]] && echo "$(basename $asciifile .asciidoc).html created"
a2x -f pdf -a icons -a toc -a numbered -a outfilesuffix=.pdf $asciifile
[[ -f $(basename $asciifile .asciidoc).pdf  ]] && echo "$(basename $asciifile .asciidoc).pdf created"
mv $(basename $asciifile .asciidoc).pdf "QWIPU_Data_Schema.pdf" && echo "$(basename $asciifile .asciidoc).pdf moved to QWIPU_Data_Schema.pdf"
html2text $(basename $asciifile .asciidoc).html > $(basename $asciifile .asciidoc).txt
[[ -f $(basename $asciifile .asciidoc).txt  ]] && echo "$(basename $asciifile .asciidoc).txt created"
echo "Removing tmp files"
rm tmp*
