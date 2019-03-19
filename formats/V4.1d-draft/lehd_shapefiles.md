= LEHD Public Use Shapefile Data
Heath Hayward, Matthew Graham, Lars Vilhuber <lars.vilhuber@cornell.edu>
14 April 2016
// a2x: --dblatex-opts "-P latex.output.revhistory=0 --param toc.section.depth=3"
( [Printable version](lehd_shapefiles.pdf) )

> **Important**
>
> This document is not an official Census Bureau publication. It is
> compiled from publicly accessible information by Lars Vilhuber ([Labor
> Dynamics Institute, Cornell
> University](http://www.ilr.cornell.edu/ldi/)). Feedback is welcome.
> Please write us at
> [lars.vilhuber@cornell.edu](mailto:lars.vilhuber@cornell.edu?subject=LEHD_Shapefiles).

Scope
=====

The public-use data from the Longitudinal Employer-Household Dynamics
Program, including the Quarterly Workforce Indicators (QWI) and
Job-to-Job Flows (J2J), are available for download according to
[structural](lehd_public_use_schema) and [file naming](lehd_csv_naming)
schema. The data themselves are available as Comma-Separated Value (CSV)
files through the LEHD website’s Data page at
<http://lehd.ces.census.gov/data/> as well as through the [LED
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
    have been removed because they are not used in current LEHD
    tabulations.

-   Each shapefile’s attribute table has been updated to conform to the
    standard LEHD output format, defined in [Format](#format) section

Outputs
=======

Output shapefiles – grouped by paired products – are listed below. Each
shapefile includes specific notes on its preparation.

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
<col width="14%" />
<col width="14%" />
<col width="35%" />
<col width="35%" />
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
<td align="left"><p>FIPS State Postal Code as per <a href="https://www.census.gov/geo/reference/codes/cou.html">https://www.census.gov/geo/reference/codes/cou.html</a></p></td>
<td align="left"><p>string</p></td>
</tr>
<tr class="even">
<td align="left"><p>GEOGRAPHY</p></td>
<td align="left"><p>Nationally unique identifier</p></td>
<td align="left"><p>Derived from Nationally Unique Federal Information Processing Series (FIPS) Code as per <a href="https://www.census.gov/geo/reference/ansi.html">https://www.census.gov/geo/reference/ansi.html</a> (see notes)</p></td>
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
<td align="left"><p>Internal Point Latitude in WGS-1984 Decimal Degrees as per <a href="http://spatialreference.org/ref/epsg/wgs-84/">http://spatialreference.org/ref/epsg/wgs-84/</a></p></td>
<td align="left"><p>double</p></td>
</tr>
<tr class="even">
<td align="left"><p>INTPTLON</p></td>
<td align="left"><p>Internal Point Longitude</p></td>
<td align="left"><p>Internal Point Longitude in WGS-1984 Decimal Degrees as per <a href="http://spatialreference.org/ref/epsg/wgs-84/">http://spatialreference.org/ref/epsg/wgs-84/</a></p></td>
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

( [lehd\_state.zip](lehd_state.zip) )

No transformations occur to this layer other than those listed above.

QWI Geographies
---------------

### County

( [lehd\_county.zip](lehd_county.zip) )

-   STUSPS is appended to the NAME field so that county names are
    nationally unique. Example: "Cook, IL"

### CBSA - within State

( [lehd\_stcbsa.zip](lehd_stcbsa.zip) )

-   All features are split into state-specific CBSA features by
    intersecting each feature with the state shapefile features.

-   The STUSPS field is added during the intersect with the state
    shapefile.

-   STFIPS (i.e. FIPS State Code as per
    <https://www.census.gov/geo/reference/ansi_statetables.html>) is
    prepended to the CBSA code
    (<https://www.census.gov/population/metro/data/def.html>) to create
    the GEOGRAPHY field to distinguish state-parts of the same CBSA
    (i.e. make them nationally unique).

-   The text "([STUSPS] part)" is appended to the NAME field only for
    those CBSA features that are split by state lines.

### Workforce Investment Board Areas

( [lehd\_wib.zip](lehd_wib.zip) )

The WIA/WIB shapefiles are built from the Place, County Subdivision, and
County shapefiles from TIGER/Line based on definitions provided by the
LED state partners.

Job-to-Job Flow Geographies
---------------------------

### CBSA - National

( [lehd\_cbsa.zip](lehd_cbsa.zip) )

-   The state remainder areas are added to the shapefile as new
    features. They are assigned unique codes ([STUSPS]+999) and names
    (“Not in metro/micro area, [STUSPS]”).

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

This revision: Thu Apr 14 13:12:22 EDT 2016
