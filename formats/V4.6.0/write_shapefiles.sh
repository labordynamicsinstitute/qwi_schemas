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
	official|lehd|draft|*)
	author=ces.qwi.feedback@census.gov
	;;
esac
cwd=$(pwd)
numversion=${cwd##*/}

# create ascii doc version
basefile=lehd_shapefiles
asciifile=${basefile}.asciidoc

echo "= LEHD Public Use Shapefile Data" > $asciifile
echo "<${author}>" >> $asciifile
echo "$(date +%d\ %B\ %Y)
:ext-relative: {outfilesuffix}
( link:lehd_shapefiles.pdf[Printable version] )

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
Feedback is welcome. " >> $asciifile
	;;
	draft|*)
	echo "
[IMPORTANT]
.Important
==============================================
This specification is draft. Feedback is welcome. 	" >> $asciifile
	;;
	official)
	echo "
[IMPORTANT]
.Important
==============================================
Feedback is welcome. 	" >> $asciifile
	;;
esac
echo "Please write us at
link:mailto:${author}?subject=LEHD_Shapefiles[${author}].
==============================================

" >> $asciifile

# Extract ASCIIDOC payload from this script
function untar_payload()
{
	match=$(grep -n '^PAYLOAD:$' $0 | cut -d ':' -f 1)
	payload_start=$((match + 1))
	tail -n +$payload_start $0
}

untar_payload >> $asciifile
echo "" >> $asciifile
cat CHANGES.txt >> $asciifile

echo "

<<<
*******************
This revision: $(date)
*******************
" >> $asciifile
echo "$asciifile created"
asciidoctor -b html5 -a icons -a toc -a numbered -a linkcss -a toclevels=$toclevels -a outfilesuffix=.html $asciifile
[[ -f ${basefile}.html  ]] && echo "${basefile}.html created"
asciidoctor-pdf -a pdf-page-size=letter  -a icons -a toc -a numbered -a outfilesuffix=.pdf $asciifile
[[ -f ${basefile}.pdf  ]] && echo "${basefile}.pdf created"
#a2x -f docbook -a icons -a toc -a numbered -a outfilesuffix=.md  $asciifile
#[[ -f ${basefile}.xml  ]] || echo "Error: ${basefile}.xml not created"
# workaround for missing title
#head -4 $asciifile > ${basefile}.md
#pandoc -t markdown_strict -f docbook ${basefile}.xml >> ${basefile}.md
#[[ -f ${basefile}.md  ]] && echo "${basefile}.md created"
echo "Removing tmp files and $asciifile"
#rm tmp*
#rm $asciifile
#rm ${basefile}.xml
exit 0
#
# ==================== end of script
#
PAYLOAD:

Scope
-----

The public-use data from the Longitudinal Employer-Household Dynamics
Program, including the Quarterly Workforce Indicators (QWI) and
Job-to-Job Flows (J2J), are available for download according to
link:lehd_public_use_schema{ext-relative}[structural] and
link:lehd_csv_naming{ext-relative}[file naming] schema.
The data themselves are available as
Comma-Separated Value (CSV) files through the LEHD website's Data page
at https://lehd.ces.census.gov/data/ as well as through the
https://ledextract.ces.census.gov/[LED Extraction Tool].

Shapefiles are used to provide mapping functionality in https://qwiexplorer.ces.census.gov/[QWI Explorer] and https://j2jexplorer.ces.census.gov/[Job-to-Job Explorer].
They are created by transforming input shapefiles sourced from https://www.census.gov/geo/maps-data/data/tiger-line.html[TIGER/Line].
New TIGER/Line shapefiles are typically released by the Census Bureau's Geography Division in August of each year, which are then processed by the LEHD program as new tabulation areas for the https://lehd.ces.census.gov/data/#qwi[QWI] and https://lehd.ces.census.gov/data/#j2j[J2J] data products. The LEHD shapefiles will be made available in the data schema in coordination with the public release of QWI and J2J data products, usually in December or January of each year.

Sources
-------
Files are derived from   https://www.census.gov/geo/maps-data/data/tiger-line.html[TIGER/Line 2019 shapefiles]:

* https://www2.census.gov/geo/tiger/TIGER2019/STATE/[tl_2019_us_state]
* https://www2.census.gov/geo/tiger/TIGER2019/COUNTY/[tl_2019_us_county]
* https://www2.census.gov/geo/tiger/TIGER2019/CBSA/[tl_2019_us_cbsa]
* https://www2.census.gov/geo/tiger/TIGER2019/PLACE/[tl_2019_(ST)_place]  (for creation of WIA/WIB shapefile)
* https://www2.census.gov/geo/tiger/TIGER2019/COUSUB/[tl_2019_(ST)_cousub] (for creation of WIA/WIB shapefile)

Transformations
---------------
The following major transformations are applied to the input files:

* All geographies are reprojected to https://spatialreference.org/ref/epsg/wgs-84/[WGS-1984 Geographic Coordinate System]
* Shoreline water has been clipped out to provide a more recognizable depiction of the coastlines.
* Each layer is given internal point coordinates (stored as double) based on the WGS-1984 projection (decimal degrees).
* Features from Guam, American Samoa, and the Northern Mariana Islands have been removed because they are not used in current LEHD tabulations.
* Each shapefile's attribute table has been updated to conform to the standard LEHD output format, defined in <<format,Format>> section

Outputs
-------
Output shapefiles – grouped by paired products – are listed below. Each shapefile includes specific notes on its preparation.

Basic Naming Schema
-------------------

All files follow the following naming convention:

--------------------------------
[type]_[geocat].zip
--------------------------------

where [type] = lehd_shp and link:naming_geocat.csv[geocat] contains

[width="60%",format="csv",cols="^1,<4",options="header"]
|===================================================
include::naming_geocat.csv[]
|===================================================


=== [[format]] FORMAT
( link:variables_shp.csv[variables_shp.csv] )

Files are distributed as https://www.digitalpreservation.gov/formats/fdd/fdd000280.shtml[ESRI Shapefiles], packaged as https://en.wikipedia.org/wiki/Zip_(file_format)[ZIP] files. The SHP component of these archives is described here. Other components (dbf, prj, shx) files are not documented here, we refer users to https://www.digitalpreservation.gov/formats/fdd/fdd000280.shtml .

[width="60%",format="csv",cols="<2,<2,<5,<5",options="header"]
|===================================================
include::variables_shp.csv[]
|===================================================

=== Values
==== STUSPS
( link:label_stusps.csv[] )

FIPS State Postal Code as per https://www.census.gov/geo/reference/codes/cou.html

==== GEOGRAPHY
( link:label_geography.csv[] )

The valid codes correspond to those listed on link:label_geography.csv[].

==== NAME
( link:label_geography.csv[] )

This is a string that corresponds in general to the 'label' field on link:label_geography.csv[]. Minor deviations for ease of exposition are possible.

=== Common files
==== State
( link:lehd_shp_gs.zip[] )

No transformations occur to this layer other than those listed above.

===  QWI Geographies

==== County
( link:lehd_shp_gc.zip[] )

* STUSPS is appended to the NAME field so that county names are nationally unique. Example: "Cook, IL"

==== CBSA - within State
( link:lehd_shp_gm.zip[] )

* All features are split into state-specific CBSA features by intersecting each feature with the state shapefile features.
* The STUSPS field is added during the intersect with the state shapefile.
* STFIPS (i.e. FIPS State Code as per https://www.census.gov/geo/reference/ansi_statetables.html) is prepended to the CBSA code (https://www.census.gov/population/metro/data/def.html) to create the GEOGRAPHY field to distinguish state-parts of the same CBSA (i.e. make them nationally unique).
* The text "([STUSPS] part)" is appended to the NAME field only for those CBSA features that are split by state lines.

==== Workforce Investment Board Areas
( link:lehd_shp_gw.zip[] )

The WIA/WIB shapefiles are built from the Place, County Subdivision, and County shapefiles from TIGER/Line based on definitions provided by the LED state partners.

=== Job-to-Job Flow Geographies
==== Metropolitan (complete)
( link:lehd_shp_gb.zip[] )

* Micropolitan areas are removed and state remainder areas are added as new features. State remainders are assigned unique codes ([STUSPS]+999) and names ("Not in metropolitan area, [STUSPS]").

[[versioning]]
Versioning
----------

Versioning rules follow https://semver.org/spec/v2.0.0.html[Semantic
Versioning V2.0.0], which states that

________________________________________________________________________________
Given a version number MAJOR.MINOR.PATCH, increment the:

* MAJOR version when you make incompatible API changes,
* MINOR version when you add functionality in a backwards-compatible
manner, and
* PATCH version when you make backwards-compatible bug fixes.
________________________________________________________________________________
