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
	official|lehd)
	author=ces.qwi.feedback@census.gov
	;;
esac
cwd=$(pwd)
numversion=${cwd##*/}
# convert the column definitions to CSV
sed 's/  /,/g;s/R N/R,N/; s/,,/,/g; s/,,/,/g; s/,,/,/g; s/, /,/g' column_definitions.txt | tail -n +2 > tmp.csv

# create ascii doc version
asciifile=lehd_j2jexplorer_schema.asciidoc
appname="J2J Explorer (beta)"
versionvintage=R2017Q3
versionstate=mo
versionj2jurl=https://lehd.ces.census.gov/data/j2j/$versionvintage/j2j/$versionstate/

echo "= LEHD Public Use Data Schema for $appname $numversion" > $asciifile
echo "Lars Vilhuber <${author}>" >> $asciifile
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
	official|lehd)
	echo "
[IMPORTANT]
.Important
==============================================
Feedback is welcome. Please write us at link:mailto:${author}?subject=LEHD_Schema[${author}].
==============================================
	" >> $asciifile
	;;
esac

echo "
Purpose
-------
The public-use Job-to-Job Flows (J2J) data provided by the Longitudinal Employer-Household Dynamics Program are accessible through the https://j2jexplorer.ces.census.gov/[$appname]. This document provides information on the schema used to format files downloaded through that application.

Additional information
----------------------
The complete LEHD schema is documented in link:lehd_public_use_schema{ext-relative}[]. LEHD-provided SHP files are separately described in link:lehd_shapefiles{ext-relative}[]. The naming conventions of the data files is documented in link:lehd_csv_naming{ext-relative}[].

Extends
-------
This is the first version of the schema for the $appname application.

Supersedes
----------
No prior version.

Basic Schema
------------
Each data file is structured as a CSV file. The first columns contain <<identifiers>>, subsequent columns contain <<indicators>>, followed by <<statusflags,status flags>>.

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

Note: The $appname provides the full set of J2J indicators in addition to two composite Origin-Destination indicators. Files downloadable through other means may be structured differently, please consult the complete LEHD schema in link:lehd_public_use_schema{ext-relative}[].

<<<

=== [[identifiers]]Identifiers
Records, unless otherwise noted, are parts of time-series data. Unique record identifiers are noted below, by file type.
Identifiers without the year and quarter component can be considered a series identifier.
" >> $asciifile

############################## Identifiers
#for arg in  lehd_mapping_identifiers.csv
#do
#  name="$(echo ${arg%*.csv}| sed 's/lehd_//; s/_/ for /; s/mapping/Mapping/; s/ident/Ident/')"
#  echo "==== $name
#( link:${arg}[] )

#Each of the released files has a set of variables uniquely identifying records ('Identifiers'). The table below relates the set of identifier specifications
#to the released files. The actual CSV files containing the identifiers for each set are listed after this table. Each identifier can take on a specified list of values, documented in the section on <<catvars,Categorical #Variables>>.

#[width=\"80%\",format=\"csv\",cols=\"<3,6*^1\",options=\"header\"]
#|===================================================
#include::$arg[]
#|===================================================
#<<<
#" >> $asciifile
#done

for arg in   $(ls lehd_identifiers_j2j*csv)
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
list the indicators available on each file.
The ''Indicator Variable'' is the short name of the variable on the
CSV files, suitable for machine processing in a wide variety of statistical applications.
When given, the ''Alternate name'' may appear in related documentation and articles.
The ''Status Flag'' is used to indicate publication or data quality status
(see <<statusflags,Status Flags>>).
The ''Indicator Name'' is a more verbose name for the indicator.
The ''Description'' provides a complete description of the indicator.
''Units'' identify the type of variable: counts, rates, monetary amounts.
''Concept'' classifies each indicator in a descriptive category: employment, hire, separation, earnings, or flow.
The ''Base'' indicates the denominator used to compute the statistic, and may be '1'.

==== Job-to-job flow counts (J2J)
( link:variables_j2j.csv[] )
[width=\"95%\",format=\"csv\",cols=\"3*^2,<5,<5,<2,<2,^1\",options=\"header\"]
|===================================================
include::variables_j2j.csv[]
|===================================================
<<<

==== Job-to-job flow rates (J2JR)
( link:variables_j2jr.csv[] )

Rates are computed from published data, and are provided as a convenience.


[width=\"95%\",format=\"csv\",cols=\"3*^2,<5,<5,<2,<2,^1\",options=\"header\"]
|===================================================
include::variables_j2jr.csv[]
|===================================================


<<<

==== Job-to-job flow Origin-Destination (J2JOD)
( link:variables_j2jod.csv[] )
[width=\"95%\",format=\"csv\",cols=\"3*^2,<5,<5,<2,<2,^1\",options=\"header\"]
|===================================================
include::variables_j2jod.csv[]
|===================================================
<<<

==== Job-to-job flow computed by the app (J2JAPP)
( link:variables_j2japp.csv[] )
[width=\"95%\",format=\"csv\",cols=\"3*^2,<5,<5,<2,<2,^1\",options=\"header\"]
|===================================================
include::variables_j2japp.csv[]
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
	echo "...,," >> tmp2.csv
	grep -A 4 -B 4 "31-33" $arg | tail -8  >> tmp2.csv
	echo "...,," >> tmp2.csv

echo "
==== Industry
( link:${arg}[] )

Only a small subset of available values shown.
The 2017 NAICS (North American Industry Classification System) is used for all years.
QWI releases prior to R2018Q1 used the 2012 NAICS classification (see link:../V4.1.3[Schema v4.1.3]).
For a full listing of all valid 2017 NAICS codes, see http://www.census.gov/cgi-bin/sssd/naics/naicsrch?chart=2017.

[width=\"90%\",format=\"csv\",cols=\"^1,<5,^1\",options=\"header\"]
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
	#echo "geography,label" > $nsfile
	#echo '00,"National (50 States + DC)"' >> $nsfile
	#grep -h -E "^[0-9][0-9]," label_geography_??.csv | sort -n -k 1 >> $nsfile

	# construct the sample fips file
	head -8 $nsfile > tmp.csv
	echo "...,," >> tmp.csv
	head -50 $nsfile | tail -8  >> tmp.csv

	# construct the composite file from separate files
	head -1 label_geography_us.csv > label_geography.csv
	for arg in $(ls label_geography_*.csv | grep -vE "cbsa|metro")
	do
	  tail -n +2 $arg >> tmp3.csv
	done
	cat tmp3.csv | sort -n -k 1 -t , >> label_geography.csv
	rm tmp3.csv

	echo "=== [[geography]]$name ===

  " >> $asciifile

for arg in   $(ls label_geo_level*csv)
do
  name="$(echo ${arg%*.csv}| sed 's/label_//')"
  echo "[[$name]]
==== [[geolevel]] Geographic levels
Geography labels for data files are provided in separate files, by scope. Each file 'label_geograpy_SCOPE.csv' may contain one or more types of records as flagged by <<geolevel,geo_level>>. For convenience, a composite file containing all geocodes is available as link:label_geography.csv[].
The 2017 vintage of  https://www.census.gov/geo/maps-data/data/tiger-line.html[Census TIGER/Line geography] is used for all tabulations as of the R2018Q1 release.




Shapefiles are described in a link:lehd_shapefiles{ext-relative}[separate document].


( link:${arg}[] )

[width=\"80%\",format=\"csv\",cols=\"^1,<3,<8,<8\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================
" >> $asciifile
done

echo "

==== National and state-level values ====
( link:$nsfile[] )

The file link:$nsfile[$nsfile] contains values and labels
for all entities of <<geolevel,geo_level>> 'N' or 'S', and is a summary of separately available files.

[width=\"40%\",format=\"csv\",cols=\"^1,<3,^1\",options=\"header\"]
|===================================================
include::tmp.csv[]
|===================================================

==== [[stusps]]State postal codes

Some parts of the schema use (lower or upper-case) state postal codes.

( link:label_stusps.csv[] )

[width=\"60%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
include::label_stusps.csv[]
|===================================================

==== Detailed state and substate level values

Note: cross-state CBSA, in records of type <<geolevel,geo_level>> = M, are present on files of type 'label_geography_XX.csv'. A particular cross-state CBSA will appear on multiple files.



">> $asciifile

#[IMPORTANT]
#.Important
#==============================================
#The above section should include hyperlinks to
#the appropriate reference.
#==============================================

echo "
[format=\"csv\",width=\"50%\",cols=\"^1,^3\",options=\"header\"]
|===================================================
Scope,Format file" >> $asciifile
	for arg in label_geography_us.csv label_geography_metro.csv
	do
	state=$(echo ${arg%*.csv} | awk -F_ ' { print $3 } '| tr [a-z] [A-Z])
	echo "$state,link:${arg}[]" >> $asciifile
	done
  echo "*States*," >> $asciifile
  for arg in  $(ls label_geography_??.csv|grep -v geography_us)
  do
  	state=$(echo ${arg%*.csv} | awk -F_ ' { print $3 } '| tr [a-z] [A-Z])
	echo "$state,link:${arg}[]" >> $asciifile
  done
echo "|===================================================" >> $asciifile

################################# Variables
# finish file

nsfile=label_agg_level.csv
nsfileshort=tmp_label_agg_level.csv

head -8 $nsfile > $nsfileshort
echo "...,,,,,,,,,,,,,,,,,,,,,," >> $nsfileshort
head -14 $nsfile | tail -3 >> $nsfileshort
echo "...,,,,,,,,,,,,,,,,,,,,,," >> $nsfileshort
head -31 $nsfile | tail -3 >> $nsfileshort
echo "...,,,,,,,,,,,,,,,,,,,,,," >> $nsfileshort

echo "
<<<
=== Aggregation level
( link:$nsfile[] )

Measures within the J2J and QWI data products are tabulated on many different dimensions, including demographic characteristics, geography, industry, and other firm characteristics. For Origin-Destination (O-D) tables, characteristics of the origin and destination firm can be tabulated separately.  Every tabulation level is assigned a unique aggregation index, represented by the agg_level variable. This index starts from 1, representing a national level grand total (all industries, workers, etc.), and progresses through different combinations of characteristics. There are gaps in the progression to leave space for aggregation levels that may be included in future data releases.

*agg_level* is currently  reported only for  J2J data products.


The following variables are included in the link:$nsfile[label_agg_level.csv]   file:

[width=\"60%\",format=\"csv\",cols=\"<2,<5\",options=\"header\"]
|===================================================
include::variables_agg_level.csv[]
|===================================================


The characteristics available on an aggregation level are repeated using a series of flags following the standard schema:

- <<geolevel,geo_level>> - geographic level of table
- <<ind_level,ind_level>> - industry level of table
- by_ variables - flags indicating other dimensions reported, including ownership, demographics, firm age and size.

A shortened representation of the file is provided below, the complete file is available in the link above.


[width=\"90%\",format=\"csv\",cols=\">1,3*<2,5*<1\",options=\"header\"]
|===================================================
include::$nsfileshort[]
|===================================================
">> $asciifile


arg=label_flags.csv
echo "
<<<
== [[statusflags]]Status flags
( link:${arg}[] )

Each status flag in the tables above contains one of the following valid values.
The values and their interpretation are listed in the table below.

[IMPORTANT]
.Important
==============================================
Note: Currently, the J2J tables only contain status flags '-1', '1', '5'. Status flags with values 10 or above only appear in online applications, not in CSV files.
==============================================


[width=\"80%\",format=\"csv\",cols=\"^1,<4\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================

<<<
" >> $asciifile
arg=variables_version.csv
sed 's/naming convention/link:lehd_csv_naming{ext-relative}[]/' $arg |
  sed 's/stusps/<<stusps>>/' |
  sed 's/geography/<<geography>>/' > tmp_$arg
echo "
<<<

== [[metadata]]Metadata
( link:${arg}[] )

=== [[metadataqwij2j]]Version Metadata for J2J Files (version.txt)

Each data release is accompanied by one or more files with metadata on geographic and temporal coverage, in a compact notation. These files follow the following naming convention:
--------------------------------
$(awk -F, ' NR == 6 { print $1 }' naming_convention.csv  )
--------------------------------
where each component is described in more detail in link:lehd_csv_naming{ext-relative}[].

The contents contains the following elements:
[width=\"90%\",format=\"csv\",cols=\"<1,<2,<5\",options=\"header\"]
|===================================================
include::tmp_$arg[]
|===================================================

For instance, the metadata for the $versionvintage release of
$(grep -E "^$versionstate," naming_geohi.csv | awk  -F, ' { print $2 } ' | sed 's/"//g') J2J
tabulations (obtained from $versionj2jurl/version_j2j.txt[here]) has  the following content:
--------------------------------
$(curl $versionj2jurl/version_j2j.txt)
--------------------------------
Some J2J metadata may contain multiple lines, as necessary.

=== [[metadataj2jod]]Additional Metadata for J2JOD Files (avail.csv)
(link:variables_avail.csv[])

Because the origin-destination (J2JOD) data link two regions, we provide an auxiliary file with the time range that cells containing data for each geographic pairing may appear in a data release.
[width=\"80%\",format=\"csv\",cols=\"<2,<2,<4\",options=\"header\"]
|===================================================
include::variables_avail.csv[]
|===================================================
The reference region will always be either the origin or the destination. National tabulations contain records where both origin and destination are <<geolevel,geo_level>>=N; state tabulations contain records where <<geolevel,geo_level>> in (N,S); metro tabulations contain records where <<geolevel,geo_level>> in (N,S,B). Data may be suppressed for certain combinations of regions and quarters because the estimates do not meet Census Bureau publication standards.
" >> $asciifile


arg=variables_lags.csv
lagqwi=lags_qwi.csv
lagj2j=lags_j2j.csv
lagj2japp=lags_j2japp.csv

echo "
=== [[metadatalags]]Metadata on Indicator Availability
(link:${arg}[])

Each <<indicators,Indicator>> potentially requires leads and/or lags of data to be computed, and thus may not be available for certain time periods.  The date range for J2J and J2JR can be found in <<metadataqwij2j,version.txt>>; the date range for J2JOD can be found in <<metadataj2jod,avail.csv>>.

For each indicator, the following files contain the quarters of data required to be available relative to the overall date range described in the metadata for the release:

* link:${lagj2j}[]
* link:${lagj2japp}[]

The files are structured as follows:
[width=\"80%\",format=\"csv\",cols=\"<2,<2,<4\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================
" >> $asciifile



echo "

<<<
*******************
This revision: $(date)
*******************
" >> $asciifile
echo "$asciifile created"
asciidoctor -b html5 -a icons -a toc -a numbered -a linkcss -a toclevels=$toclevels -a outfilesuffix=.html $asciifile
[[ -f $(basename $asciifile .asciidoc).html  ]] && echo "$(basename $asciifile .asciidoc).html created"
asciidoctor-pdf -a pdf-page-size=letter -a icons -a toc -a numbered -a outfilesuffix=.pdf $asciifile
[[ -f $(basename $asciifile .asciidoc).pdf  ]] && echo "$(basename $asciifile .asciidoc).pdf created"
#html2text $(basename $asciifile .asciidoc).html > $(basename $asciifile .asciidoc).txt
#[[ -f $(basename $asciifile .asciidoc).txt  ]] && echo "$(basename $asciifile .asciidoc).txt created"
echo "Removing tmp files"
rm tmp*
