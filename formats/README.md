# LEHD Public Use Data Schemas

## Scope
The public-use data from the Longitudinal Employer-Household Dynamics Program, including the Quarterly Workforce Indicators (QWI) and Job-to-Job Flows (J2J), are available for download according to structural and file naming schema. The data themselves are available as Comma-Separated Value (CSV) files through the LEHD website’s Data page at http://lehd.ces.census.gov/data/ as well as through the [LED Extraction Tool](http://ledextract.ces.census.gov/).

For each variable, a set of allowable values is defined. Definitions of allowable values are provided as CSV files, with header variable definitions. The naming conventions of the data files is documented separately, in a similar fashion.

## History
The first published schema for the Quarterly Workforce Indicators (QWI) was [v3.5](v3.5), used for QWI files releases through R2013Q1. No formal document describing the schema was released, but a user-contributed "[Cheatsheet](v3.5/QWI-cheatsheet.txt)" was available. A restructuring of the data and file naming conventions lead to [V4.0](V4.0) for releases starting with R2013Q2. The newer schema was described in the form of a [PDF document](V4.0/QWIPU_Data_Schema.pdf) that was occassionally updated to reflect corrections and enhancements. All data releases were accompanied by a set of CSV files for allowable values of variables and flags, accompanying each collection of tabulations for each state.

Starting with release R2015Q2, a more formal and flexible structure was implemented, and published as [V4.0.1](V4.0.1). As changes occur to elements of the schema, version numbers are incremented (see [Versioning](#Versioning)). Broader changes are first published as draft schemas (typically used by draft or "beta" releases of data), before becoming finalized. All versions are retained on this server.

## Usage
Each data release is accompanied by a file specifying a compact notation for metadata. For instance, the R2014Q4 release of Missouri QWI by race and ethnicity for all firm types (archived [here](http://download.vrdc.cornell.edu/qwipu/R2014Q4/mo/rh/f/) or [here](http://lehd.ces.census.gov/pub/mo/R2014Q4/DVD-rh_f/)) would have a file called 'version_rh_f.txt' with the following content:
<pre>
QWIRH_F MO 29 1995:1-2014:1 V4.0 R2014Q4 qwipu_mo_20141116_1406
</pre>
where the fifth component (<code>V4.0</code>) identifies the schema being used. Thus, all value labels, the naming and structure of the files, the geographic and industry coding vintages, etc. can be deduced from the information available in the [V4.0](V4.0) directory.

## Versioning
Versioning rules follow [Semantic Versioning V2.0.0](http://semver.org/spec/v2.0.0.html), which states that

> Given a version number MAJOR.MINOR.PATCH, increment the:
>
> * MAJOR version when you make incompatible API changes,
> * MINOR version when you add functionality in a backwards-compatible manner, and
> * PATCH version when you make backwards-compatible bug fixes.

In practice,

* LEHD increments the major number when a new data format is used that would drop import by outside systems (variables are dropped, are in a different order, existing variables change names; file naming conventions change for existing files)
* LEHD increments the minor number when
  - variables are added, without changing order of existing variables
  - new types of data are added (e.g., J2J, LODES) without changing existing files
  - changes in values are of a "significant" nature
  - changes to the structure of the schema documentation are made
* LEHD increments the "patch" number when changes are made to existing codes that do not break import of data, or change the interpretation of the data in a significant way
  - a description is corrected
  - a set of value labels is changed in a minimal way
* LEHD does not increment the version number when corrections to the human readable schema documentation itself are made, but does indicate such changes in the CHANGE section and by dating the resulting files.

Examples of "patch"-level changes are:
* updated geography definitions (changes in state-specific geographies impacting a small set of areas, for instance a WIB or a small number of counties) (see CHANGES in [V4.0.1](V4.0.1/CHANGES.txt), [V4.0.2](V4.0.2/CHANGES.txt), [V4.0.3](V4.0.3/CHANGES.txt) for examples)
* change in NAICS coding affecting only a small number of industries (see CHANGES in [V4.0.2](V4.0.2/CHANGES.txt) for an example). Switching from SIC to NAICS would have been a 'major' version number change, changing from NAICS 1997 to 2007 - which had more significant changes, but did not fundamentally change the way the data are read in - would have been a 'minor' version number change.

## Changes
This section is reserved for documentation of changes to the versioning schema itself, as well as for description of major version changes related to the schema documentation.

* [v3.5](v3.5) First documented schema
* [V4.0](V4.0) Second documented schema, change in file naming conventions; added and dropped variables.
* [V4.0.1](V4.0.1) First formally structured schema documentation of V4 schema.
* V4.1 Additional files and variables.
