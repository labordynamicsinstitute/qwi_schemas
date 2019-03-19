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

# create ascii doc version
basefile=VERSIONING
asciifile=${basefile}.asciidoc

echo "LEHD Public Use Data Schema Versioning" > $asciifile
echo "======================================" >> $asciifile
echo "Lars Vilhuber <${author}>" >> $asciifile
echo "$(date +%d\ %B\ %Y)
// a2x: --dblatex-opts \"-P latex.output.revhistory=0 --param toc.section.depth=${toclevels}\"
:ext-relative: {outfilesuffix}
( link:VERSIONING.pdf[Printable version] )

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
Feedback is welcome. Please write us at link:mailto:ces.qwi.feedback@census.gov?subject=LEHD_Schema_4.0.1[ces.qwi.feedback@census.gov].
.
==============================================
	" >> $asciifile
	;;
esac

# Extract ASCIIDOC payload from this script
function untar_payload()
{
	match=$(grep --text --line-number '^PAYLOAD:$' $0 | cut -d ':' -f 1)
	payload_start=$((match + 1))
	tail -n +$payload_start $0
}

untar_payload >> $asciifile

echo "

<<<
*******************
This revision: $(date)
*******************
" >> $asciifile
echo "$asciifile created"
asciidoc -a icons -a toc -a numbered -a linkcss -a toclevels=$toclevels -a outfilesuffix=.html $asciifile
[[ -f ${basefile}.html  ]] && echo "${basefile}.html created"
a2x -f pdf -a icons -a toc -a numbered -a outfilesuffix=.pdf $asciifile
[[ -f ${basefile}.pdf  ]] && echo "${basefile}.pdf created"
a2x -f docbook -a icons -a toc -a numbered  $asciifile
[[ -f ${basefile}.xml  ]] || echo "Error: ${basefile}.xml not created"
# workaround for missing title
head -4 $asciifile > ${basefile}.md
pandoc -t markdown_strict -f docbook ${basefile}.xml >> ${basefile}.md
[[ -f ${basefile}.md  ]] && echo "${basefile}.md created"
echo "Removing tmp files and $asciifile"
rm tmp*
rm $asciifile
rm ${basefile}.xml
exit 0
#
# ==================== end of script
#
PAYLOAD:
[[scope]]
Scope
-----

The public-use data from the Longitudinal Employer-Household Dynamics
Program, including the Quarterly Workforce Indicators (QWI) and
Job-to-Job Flows (J2J), are available for download according to
structural and file naming schema. The data themselves are available as
Comma-Separated Value (CSV) files through the LEHD website’s Data page
at http://lehd.ces.census.gov/data/ as well as through the
http://ledextract.ces.census.gov/[LED Extraction Tool].

[[history]]
History
-------

The first published schema for the Quarterly Workforce Indicators (QWI)
was v3.5, used for QWI files releases through R2013Q1. No formal
document describing the schema was released, but a user-contributed
"link:v3.5/QWI-cheatsheet.txt[Cheatsheet]" was available. A
restructuring of the data and file naming conventions lead to V4.0 for
releases starting with R2013Q2. The newer schema was described in the
form of a link:V4.0/QWIPU_Data_Schema.pdf[PDF document] that was
occassionally updated to reflect corrections and enhancements. All data
releases were accompanied by a set of CSV files for allowable values of
variables and flags, accompanying each collection of tabulations for
each state.

Starting with release R2015Q2, a more formal and flexible structure was
implemented, and published as V4.0.1. As changes occur to elements of
the schema, version numbers are incremented (see
link:#Versioning[Versioning]). Broader changes are first published as
draft schemas (typically used by draft or "beta" releases of data),
before becoming finalized. All versions are retained on this server.

* link:v3.5[] First documented schema
* link:V4.0[] Second documented schema, change in file naming conventions;
added and dropped variables.
* link:V4.0.1[] First formally structured schema documentation of V4 schema.
* V4.1 Additional files and variables (not finalized yet)


[[usage]]
Usage
-----

Each data release is accompanied by a file specifying a compact notation
for metadata. For instance, the R2015Q2 release of Missouri QWI by race
and ethnicity for all firm types (archived
http://download.vrdc.cornell.edu/qwipu/R2015Q2/mo/rh/f/[here] or
http://lehd.ces.census.gov/pub/mo/R2015Q2/DVD-rh_f/[here]) would have a
file called 'version_rh_f.txt' with the following content:
...............................................................
QWIRH_F MO 29 1995:1-2014:3 V4.0.1 R2015Q2 qwipu_mo_20150601_1902
...............................................................
where the fifth component (V4.0.1) identifies the schema being used. Thus,
all value labels, the naming and structure of the files, the geographic
and industry coding vintages, etc. can be deduced from the information
available in the link:V4.0.1[] directory.

Names of data files follow certain rules, which are documented in the file "lehd_csv_naming".

* In the example above, the file can be found at link:V4.0.1/lehd_csv_naming.html[].
* The latest version of "lehd_csv_naming" can be found at link:latest/lehd_csv_naming.html[].

For each *identifier variable* on the data file, a set of allowable values is defined. Definitions of allowable values are provided as CSV files, with headers. Available *indicator variables* are defined, and labels provided. These definitions are summarized in the file "lehd_public_use_schema" (formerly named "QWIPU_Data_Schema.pdf").

* For instance, in the example above, the file can be found at link:V4.0.1/lehd_public_use_schema.html
* (QWI) *indicators* are named and listed in the section "link:V4.0.1/lehd_public_use_schema.html#_a_id_indicators_a_indicators[Indicators]" in link:V4.0.1/lehd_public_use_schema.html[] in human-readable form, and as machine-readable CSV files at link:V4.0.1/variables_qwipu.csv[] .
* *Identifiers* for the QWI files are listed in the section "link:V4.0.1/lehd_public_use_schema.html#_a_id_identifiers_a_identifiers[Identifiers]" in machine-readable form, and as CSV files at link:V4.0.1/lehd_identifiers_qwi.csv[] (note: different files may have different identifiers).
* One of the available *identifiers* is "agegrp", for which the allowable values are listed at "link:V4.0.1/lehd_public_use_schema.html#_agegrp[agegrp]" and provided in machine-readable form at link:V4.0.1/label_agegrp.csv[]
* The latest version of "lehd_public_use_schema" can be found at link:latest/lehd_public_use_schema.html[]


[[versioning]]
Versioning
----------

Versioning rules follow http://semver.org/spec/v2.0.0.html[Semantic
Versioning V2.0.0], which states that

________________________________________________________________________________
Given a version number MAJOR.MINOR.PATCH, increment the:

* MAJOR version when you make incompatible API changes,
* MINOR version when you add functionality in a backwards-compatible
manner, and
* PATCH version when you make backwards-compatible bug fixes.
________________________________________________________________________________

In practice,

* LEHD increments the major number when a new data format is used that
would break import procedures by outside systems (variables are dropped, are in a
different order, existing variables change names; file naming
conventions change for existing files)
* LEHD increments the minor number when
** variables are added, without changing order of existing variables
** new types of data are added (e.g., J2J, LODES) without changing
existing files
** changes in values are of a "significant" nature
** changes to the structure of the schema documentation are made
* LEHD increments the "patch" number when changes are made to existing
codes that do not break import of data, or change the interpretation of
the data in a significant way
** a description is corrected
** a set of value labels is changed in a minimal way
* LEHD does not increment the version number when corrections to the
human readable schema documentation itself are made, but does indicate
such changes in the CHANGE section with the calendar date of the
revision.

Examples of "patch"-level changes are:

* updated geography definitions
(changes in state-specific geographies impacting a small set of areas,
for instance a WIB or a small number of counties) (see CHANGES in
link:V4.0.1/CHANGES.txt[V4.0.1], link:V4.0.2/CHANGES.txt[V4.0.2],
link:V4.0.3/CHANGES.txt[V4.0.3] for examples)
* change in NAICS coding
affecting only a small number of industries (see CHANGES in
link:V4.0.2/CHANGES.txt[V4.0.2] for an example).

Switching from SIC to
NAICS would have been a 'major' version number change, changing from
NAICS 1997 to 2007 - which had more significant changes, but did not
fundamentally change the way the data are read in - would have been a
'minor' version number change.

Additional revisions within a "patch"-level schema will be identified in
the CHANGES.txt by date, but will not otherwise carry a different
version number. Revisions are only used to correct for bugs, and to
improve documentation of the schema itself, but not to change the
schema.

[[draft-versions]]
Draft Versions
--------------

LEHD will publish a draft version of minor or major schema changes, in
order to be able to allow for comments by the community. A draft schema
may also accompany 'beta' data products, where both schema and data are
published to elicit comments from the public. Draft versions do not
necessarily lead to a final specification, and should be treated as work
in progress.

[[most-current-version]]
Most Current Version
--------------------

For convenience, the latest non-draft version is accessible at
http://lehd.ces.census.gov/data/schema/latest/. However, users should
note that at any point in time, data published by LEHD may reference an
older schema, as noted in the Usage section above. Users are strongly
encouraged to reference a well-specified revision number in their
programs, derived from the "version*txt" file provided with each data
release.

[[curation]]
Curation
--------

LEHD commits to keeping a public record of all major, minor, and patch
versions of the schema in an accessible, public location (currently, at
http://lehd.ces.census.gov/data/schema/). Additional revisions are
stored internally in code versioning systems, and can be provided upon
request.


[[changes]]
Changes
-------

This section is reserved for documentation of changes to this document. For documentation of changes to the schema, see the "CHANGES.txt" file in each versioned schema directory.

* V1.0 2016-03-15: First release.
