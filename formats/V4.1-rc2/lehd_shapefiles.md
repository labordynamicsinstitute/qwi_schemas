= LEHD Public Use Shapefile Data
Heath Hayward, Matthew Graham, Lars Vilhuber <Patrick.Hayward@census.gov>
12 August 2016
// a2x: --dblatex-opts "-P latex.output.revhistory=0 --param toc.section.depth=3"
( [Printable version](lehd_shapefiles.pdf) )

> **Important**
>
> This specification is draft. Feedback is welcome. Please write us at
> [Patrick.Hayward@census.gov](mailto:Patrick.Hayward@census.gov?subject=LEHD_Shapefiles).

Scope
=====

The public-use data from the Longitudinal Employer-Household Dynamics
Program, including the Quarterly Workforce Indicators (QWI) and
Job-to-Job Flows (J2J), are available for download according to
[structural](lehd_public_use_schema.md) and [file
naming](lehd_csv_naming.md) schema. The data themselves are available as
Comma-Separated Value (CSV) files through the LEHD website’s Data page
at <http://lehd.ces.census.gov/data/> as well as through the [LED
Extraction Tool](http://ledextract.ces.census.gov/).

Shapefiles are used to provide mapping functionality in [QWI
Explorer](http://qwiexplorer.ces.census.gov/) and Job-to-Job Explorer
(coming soon). They are created by transforming input shapefiles sourced
from
[TIGER/Line](https://www.census.gov/geo/maps-data/data/tiger-line.html).

Sources
=======

Files are derived from  [TIGER/Line 2015
shapefiles](https://www.census.gov/geo/maps-data/data/tiger-line.html):

-   [tl\_2015\_us\_state](http://www2.census.gov/geo/tiger/TIGER2015/STATE/)

-   [tl\_2015\_us\_county](http://www2.census.gov/geo/tiger/TIGER2015/COUNTY/)

-   [tl\_2015\_us\_cbsa](http://www2.census.gov/geo/tiger/TIGER2015/CBSA/)

-   [tl\_2015\_(ST)\_place](http://www2.census.gov/geo/tiger/TIGER2015/PLACE/)
    (for creation of WIA/WIB shapefile)

-   [tl\_2015\_(ST)\_cousub](http://www2.census.gov/geo/tiger/TIGER2015/COUSUB/)
    (for creation of WIA/WIB shapefile)

Transformations
===============

The following major transformations are applied to the input files:

-   All geographies are reprojected to [WGS-1984 Geographic Coordinate
    System](http://spatialreference.org/ref/epsg/wgs-84/)

-   Shoreline water has been clipped out to provide a more recognizable
    depiction of the coastlines.

-   Each layer is given internal point coordinates (stored as double)
    based on the WGS-1984 projection (decimal degrees).

-   Each layer is run through a "simplify polygon" procedure to remove
    unnecessary complexity from the features.

-   Features from Guam, American Samoa, and the Northern Mariana Islands
    have been removed because they are not used in current
    LEHD tabulations.

-   Each shapefile’s attribute table has been updated to conform to the
    standard LEHD output format, defined in [Format](#format) section

Outputs
=======

Output shapefiles – grouped by paired products – are listed below. Each
shapefile includes specific notes on its preparation.

Basic Naming Schema
===================

All files follow the following naming convention:

    [type]]_[geocat].zip

where \[type\] = lehd\_shp and [geocat](naming_geocat.csv) contains

<table>
<colgroup>
<col width="20%" />
<col width="80%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">type</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>gb</p></td>
<td align="left"><p>Metropolitan/Micropolitan (complete)</p></td>
</tr>
<tr class="even">
<td align="left"><p>gc</p></td>
<td align="left"><p>Counties</p></td>
</tr>
<tr class="odd">
<td align="left"><p>gm</p></td>
<td align="left"><p>Metropolitan/Micropolitan</p></td>
</tr>
<tr class="even">
<td align="left"><p>gn</p></td>
<td align="left"><p>National (50 States + DC)</p></td>
</tr>
<tr class="odd">
<td align="left"><p>gs</p></td>
<td align="left"><p>States</p></td>
</tr>
<tr class="even">
<td align="left"><p>gw</p></td>
<td align="left"><p>Workforce Investment Areas</p></td>
</tr>
</tbody>
</table>

FORMAT
------

( [variables\_shp.csv](variables_shp.csv) )

Files are distributed as [ESRI
Shapefiles](http://www.digitalpreservation.gov/formats/fdd/fdd000280.shtml),
packaged as [ZIP](https://en.wikipedia.org/wiki/Zip_(file_format))
files. The SHP component of these archives is described here. Other
components (dbf, prj, shx) files are not documented here, we refer users
to <http://www.digitalpreservation.gov/formats/fdd/fdd000280.shtml> .

<table>
<colgroup>
<col width="14%" />
<col width="14%" />
<col width="35%" />
<col width="35%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">column</th>
<th align="left">label</th>
<th align="left">description</th>
<th align="left">type</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>STUSPS</p></td>
<td align="left"><p>State USPS code</p></td>
<td align="left"><p>FIPS State Postal Code as per <a href="https://www.census.gov/geo/reference/codes/cou.html" class="uri">https://www.census.gov/geo/reference/codes/cou.html</a></p></td>
<td align="left"><p>string</p></td>
</tr>
<tr class="even">
<td align="left"><p>GEOGRAPHY</p></td>
<td align="left"><p>Nationally unique identifier</p></td>
<td align="left"><p>Derived from Nationally Unique Federal Information Processing Series (FIPS) Code as per <a href="https://www.census.gov/geo/reference/ansi.html" class="uri">https://www.census.gov/geo/reference/ansi.html</a> (see notes)</p></td>
<td align="left"><p>string</p></td>
</tr>
<tr class="odd">
<td align="left"><p>NAME</p></td>
<td align="left"><p>Feature Name</p></td>
<td align="left"><p>Full Census Name of Geography Feature</p></td>
<td align="left"><p>string</p></td>
</tr>
<tr class="even">
<td align="left"><p>LABEL</p></td>
<td align="left"><p>Feature Label</p></td>
<td align="left"><p>Shorter Census Name of Geography Feature for Thematic Mapping</p></td>
<td align="left"><p>string</p></td>
</tr>
<tr class="odd">
<td align="left"><p>INTPTLAT</p></td>
<td align="left"><p>Internal Point Latitude</p></td>
<td align="left"><p>Internal Point Latitude in WGS-1984 Decimal Degrees as per <a href="http://spatialreference.org/ref/epsg/wgs-84/" class="uri">http://spatialreference.org/ref/epsg/wgs-84/</a></p></td>
<td align="left"><p>double</p></td>
</tr>
<tr class="even">
<td align="left"><p>INTPTLON</p></td>
<td align="left"><p>Internal Point Longitude</p></td>
<td align="left"><p>Internal Point Longitude in WGS-1984 Decimal Degrees as per <a href="http://spatialreference.org/ref/epsg/wgs-84/" class="uri">http://spatialreference.org/ref/epsg/wgs-84/</a></p></td>
<td align="left"><p>double</p></td>
</tr>
</tbody>
</table>

Values
------

### STUSPS

( [label\_stusps.csv](label_stusps.csv) )

FIPS State Postal Code as per
<https://www.census.gov/geo/reference/codes/cou.html>

### GEOGRAPHY

( [label\_geography.csv](label_geography.csv) ) The valid codes
correspond to those listed on
[label\_geography.csv](label_geography.csv).

### NAME

This is a string that corresponds in general to the *label* field on
[label\_geography.csv](label_geography.csv). Minor deviations for ease
of exposition are possible.

Common files
------------

### State

( [lehd\_shp\_gs.zip](lehd_shp_gs.zip) )

No transformations occur to this layer other than those listed above.

QWI Geographies
---------------

### County

( [lehd\_shp\_gc.zip](lehd_shp_gc.zip) )

-   STUSPS is appended to the NAME field so that county names are
    nationally unique. Example: "Cook, IL"

### CBSA - within State

( [lehd\_shp\_gm.zip](lehd_shp_gm.zip) )

-   All features are split into state-specific CBSA features by
    intersecting each feature with the state shapefile features.

-   The STUSPS field is added during the intersect with the
    state shapefile.

-   STFIPS (i.e. FIPS State Code as per
    <https://www.census.gov/geo/reference/ansi_statetables.html>) is
    prepended to the CBSA code
    (<https://www.census.gov/population/metro/data/def.html>) to create
    the GEOGRAPHY field to distinguish state-parts of the same
    CBSA (i.e. make them nationally unique).

-   The text "(\[STUSPS\] part)" is appended to the NAME field only for
    those CBSA features that are split by state lines.

### Workforce Investment Board Areas

( [lehd\_shp\_gw.zip](lehd_shp_gw.zip) )

The WIA/WIB shapefiles are built from the Place, County Subdivision, and
County shapefiles from TIGER/Line based on definitions provided by the
LED state partners.

Job-to-Job Flow Geographies
---------------------------

### CBSA - National

( [lehd\_shp\_gb.zip](lehd_shp_gb.zip) )

-   The state remainder areas are added to the shapefile as
    new features. They are assigned unique codes (\[STUSPS\]+999) and
    names (“Not in metro/micro area, \[STUSPS\]”).

Versioning
==========

Versioning rules follow [Semantic Versioning
V2.0.0](http://semver.org/spec/v2.0.0.html), which states that

> Given a version number MAJOR.MINOR.PATCH, increment the:
>
> -   MAJOR version when you make incompatible API changes,
>
> -   MINOR version when you add functionality in a backwards-compatible
>     manner, and
>
> -   PATCH version when you make backwards-compatible bug fixes.
>
Changes
=======

This revision: Fri Aug 12 14:05:40 EDT 2016
