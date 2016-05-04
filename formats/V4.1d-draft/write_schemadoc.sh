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
Feedback is welcome. Please write us at link:mailto:${author}?subject=LEHD_Schema[${author}].
==============================================
	" >> $asciifile
	;;
esac

echo "
Purpose
-------
The public-use data from the Longitudinal Employer-Household Dynamics Program, including the Quarterly Workforce Indicators (QWI)
and Job-to-Job Flows (J2J), are available for download with the following data schema.
These data are available as Comma-Separated Value (CSV) files through the LEHD website’s Data page at
http://lehd.ces.census.gov/data/ and through LED Extraction Tool at http://ledextract.ces.census.gov/.

This document describes the data schema for LEHD files. For each variable,
a set of allowable values is defined. Definitions are provided as CSV files,
with header variable definitions.  Changes relative to the original v4.0 version are listed <<changes,at the end>>.

File naming
-----------
The naming conventions of the data files is documented in link:lehd_csv_naming{ext-relative}[].

Replaces
-------
This version replaces v4.0. Any file compliant with LEHD or QWI Schema v4.0 will also be compliant with this schema, but some changes may have been applied to auxiliary data.

Basic Schema
------------
Each file is structured as a CSV file. The first columns contain <<identifiers>>, subsequent columns contain <<indicators>>, followed by <<statusflags,status flags>>.

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
for arg in  lehd_mapping_identifiers.csv
do
  name="$(echo ${arg%*.csv}| sed 's/lehd_//; s/_/ for /; s/mapping/Mapping/; s/ident/Ident/')"
  echo "==== $name
( link:${arg}[] )

Each of the released files has a set of variables uniquely identifying records ('Identifiers'). The table below relates the set of identifier specifications
to the released files. The actual CSV files containing the identifiers for each set are listed after this table. Each identifier can take on a specified list of values, documented in the section on <<catvars,Categorical Variables>>.

[width=\"80%\",format=\"csv\",cols=\"<3,6*^1\",options=\"header\"]
|===================================================
include::$arg[]
|===================================================
<<<
" >> $asciifile
done

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

==== National QWI and state-level QWI (QWIPU) ====

( link:variables_qwi.csv[variables_qwi.csv] )
[width=\"95%\",format=\"csv\",cols=\"3*^2,<5,<2\",options=\"header\"]
|===================================================
include::variables_qwi.csv[]
|===================================================
<<<

==== National QWI and state-level QWI rates (QWIPUR) ====
Rates are computed from published data, and are provided as a convenience. The column *Base* indicates the denominator used to compute the rate.


( link:variables_qwir.csv[variables_qwir.csv] )
[width=\"95%\",format=\"csv\",cols=\"3*^2,<5,<2,<2\",options=\"header\"]
|===================================================
include::variables_qwir.csv[]
|===================================================


<<<

==== Job-to-job flow counts (J2J)
( link:variables_j2j.csv[] )
[width=\"95%\",format=\"csv\",cols=\"3*^2,<5\",options=\"header\"]
|===================================================
include::variables_j2j.csv[]
|===================================================
<<<

==== Job-to-job flow rates (J2JR)
( link:variables_j2jr.csv[] )

Rates are computed from published data, and are provided as a convenience. The column *Base* indicates the denominator used to compute the rate.


[width=\"95%\",format=\"csv\",cols=\"3*^2,<5,<2\",options=\"header\"]
|===================================================
include::variables_j2jr.csv[]
|===================================================


<<<

==== Job-to-job flow Origin-Destination (J2JOD)
( link:variables_j2jod.csv[] )
[width=\"95%\",format=\"csv\",cols=\"^3,^2,^3,<5\",options=\"header\"]
|===================================================
include::variables_j2jod.csv[]
|===================================================
<<<

<<<
" >> $asciifile


################################# Variability measures
for arg in   $(ls variables_*v.csv)
do
	tmpfile=tmp_$arg
	head -4 $arg  > $tmpfile
	echo "...,,," >> $tmpfile
	grep "vt_" $arg | head -3 >> $tmpfile
	echo "...,,," >> $tmpfile
	grep "vb_" $arg | head -3 >> $tmpfile
	echo "...,,," >> $tmpfile
	grep "vw_" $arg | head -3 >> $tmpfile
	echo "...,,," >> $tmpfile
	grep "df_" $arg | head -3 >> $tmpfile
	echo "...,,," >> $tmpfile
	grep "mr_" $arg | head -3 >> $tmpfile
done

echo "
<<<
=== [[vmeasures]]Variability measures
The following tables and associated mapping files
list the variability measures available on each file.  The ''Variability Measure'' is the short name of the variable on the CSV files,
suitable for machine processing in a wide variety of statistical applications. When given, the ''Alternate Name'' may appear in related documentation and articles.
The ''Variable Name'' is a more verbose description of the variability measure.

Six variability measures are published:

* Total variability, prefixed by vt_
* Standard error, prefixed by st_, and computed as the square root of Total Variability
* Between-implicate variability, prefixed by vb_
* Average within-implicate variability, prefixed by vw_
* Degrees of freedom, prefixed by df_
* Missingness ratio, prefixed by mr_

A missing variability measure indicates a structural zero in the corresponding indicator. This is currently not associated with a flag.

//Not all indicators have associated variability measures. For more details, see the following document TBD.

==== Generic structure

[width=\"30%\",format=\"csv\",cols=\"<2\",options=\"header\"]
|===================================================
Column name
[ Identifier1 ]
[ Identifier2 ]
[ Identifier3 ]
[ ... ]
[ Standard error for Indicator 1 ]
[ Standard error for Indicator 2 ]
[ Standard error for Indicator 3 ]
[ ... ]
[ Total variation for Indicator 1 ]
[ Total variation for Indicator 2 ]
[ Total variation for Indicator 3 ]
[ ... ]
[ Between-implicate variability for Indicator 1 ]
[ Between-implicate variability for Indicator 2 ]
[ Between-implicate variability for Indicator 3 ]
[ ... ]
[ Average within-implicate variability for Indicator 1 ]
[ Average within-implicate variability for Indicator 2 ]
[ Average within-implicate variability for Indicator 3 ]
[ ... ]
[ Degrees of freedom for Indicator 1 ]
[ Degrees of freedom for Indicator 2 ]
[ Degrees of freedom for Indicator 3 ]
[ ... ]
[ Missingness ratio for Indicator 1 ]
[ Missingness ratio for Indicator 2 ]
[ Missingness ratio for Indicator 3 ]
[ ... ]
|===================================================


Note: A full list of indicators for each type of file are shown  in the <<indicators,Indicators>> section. In the tables below, only a sample
of variability measures are printed, but the complete list is available in the linked CSV schema files.

<<<

==== National QWI and state-level QWI ====

( link:variables_qwiv.csv[variables_qwiv.csv] )
[width=\"95%\",format=\"csv\",cols=\"2*^2,<5,<5\",options=\"header\"]
|===================================================
include::tmp_variables_qwiv.csv[]
|===================================================

<<<
==== National QWI and state-level QWI rates ====

( link:variables_qwirv.csv[variables_qwirv.csv] )
[width=\"95%\",format=\"csv\",cols=\"2*^2,<5,<5\",options=\"header\"]
|===================================================
include::tmp_variables_qwirv.csv[]
|===================================================


<<<

==== Job-to-job flow counts (J2J)
Soon.
//( link:variables_j2j.csv[] )
//[width=\"95%\",format=\"csv\",cols=\"3*^2,<5\",options=\"header\"]
//|===================================================
//include::tmp_variables_j2jv.csv[]
//|===================================================
//<<<
//

==== Job-to-job flow rates (J2JR)
Soon.
//( link:variables_j2jr.csv[] )
//[width=\"95%\",format=\"csv\",cols=\"3*^2,<5\",options=\"header\"]
//|===================================================
//include::tmp_variables_j2jrv.csv[]
//|===================================================
//<<<

==== Job-to-job flow Origin-Destination (J2JOD)
Soon.
//( link:variables_j2jod.csv[] )
//[width=\"95%\",format=\"csv\",cols=\"^3,^2,^3,<5\",options=\"header\"]
//|===================================================
//include::tmp_variables_j2jodv.csv[]
//|===================================================

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
	#echo "geography,label" > $nsfile
	#echo '00,"National (50 States + DC)"' >> $nsfile
	#grep -h -E "^[0-9][0-9]," label_geography_??.csv | sort -n -k 1 >> $nsfile

	# construct the sample fips file
	head -8 $nsfile > tmp.csv
	echo "...,," >> tmp.csv
	head -50 $nsfile | tail -8  >> tmp.csv

	# construct the composite file from separate files
	head -1 label_geography_us.csv > label_geography.csv
	for arg in $(ls label_geography_*.csv | grep -v cbsa)
	do
	  tail -n +2 $arg >> tmp3.csv
	done
	cat tmp3.csv | sort -n -k 1 -t , >> label_geography.csv
	rm tmp3.csv

  echo "=== $name ===

  " >> $asciifile

for arg in   $(ls label_geo_level*csv)
do
  name="$(echo ${arg%*.csv}| sed 's/label_//')"
  echo "[[$name]]
==== [[geolevel]] Geographic levels
Geography labels for data files are provided in separate files, by scope. Each file 'label_geograpy_SCOPE.csv' may contain one or more types of records as flagged by <<geolevel,geo_level>>. For convenience, a composite file containing all geocodes is available as link:label_geography.csv[].
The 2015 vintage of   https://www.census.gov/geo/maps-data/data/tiger-line.html[Census TIGER/Line geography] is used for all tabulations as of the R2015Q4 release.



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
[format=\"csv\",width=\"50%\",cols=\"^1,^3,^1\",options=\"header\"]
|===================================================
Scope,Format file" >> $asciifile
	for arg in label_geography_us.csv label_geography_cbsa.csv
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

These flags will be expanded to include origin characteristics in a later release. A shortened representation of the file is provided below, the complete file is available in the link above.


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
Note: Currently, the J2J tables only contain status flags '-1'  and '1.' Status flags with values 10 or above only appear in online applications, not in CSV files.
==============================================


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
html2text $(basename $asciifile .asciidoc).html > $(basename $asciifile .asciidoc).txt
[[ -f $(basename $asciifile .asciidoc).txt  ]] && echo "$(basename $asciifile .asciidoc).txt created"
echo "Removing tmp files"
rm tmp*
