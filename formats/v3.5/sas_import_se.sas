/**************************************************************
 This file contains the SAS syntax to import all csv files into
 SAS tables.  To make these work, the directory = macro variable
 must be set to the directory location of the files and the libname= 
 macro variable should be set to the directory location where the
 SAS tables will go.  This program also assumes that the files have
 been unzipped from their state on the DVD and into the same directory.
****************************************************************/

%let directory=PUT WHERE THE CSV FILES ARE IN HERE;
%let libname=PUT WHERE YOU WANT THE SAS TABLES TO GO IN HERE;

libname csv_loc "&libname";
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_county_naics3_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_county_naics3_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_county_naics3_all.csv ";
 
data csv_loc.qwi_ak_se_county_naics3_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
county                              = 'Group: FIPS County code'
countyfm                            = 'Group: FIPS County name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics3                              = 'Group: NAICS 3-digit industry code'
naics3fm                            = 'Group: NAICS 3-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
county                              $
countyfm                            $
qwi_ind                             $
naics3                              $
naics3fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_county_naics3_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_county_naics3_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_county_naics3_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_county_naics3_pri.csv ";
 
data csv_loc.qwi_ak_se_county_naics3_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
county                              = 'Group: FIPS County code'
countyfm                            = 'Group: FIPS County name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics3                              = 'Group: NAICS 3-digit industry code'
naics3fm                            = 'Group: NAICS 3-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
county                              $
countyfm                            $
qwi_ind                             $
naics3                              $
naics3fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_county_naics3_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_county_naics4_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_county_naics4_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_county_naics4_all.csv ";
 
data csv_loc.qwi_ak_se_county_naics4_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
county                              = 'Group: FIPS County code'
countyfm                            = 'Group: FIPS County name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics4                              = 'Group: NAICS 4-digit industry code'
naics4fm                            = 'Group: NAICS 4-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
county                              $
countyfm                            $
qwi_ind                             $
naics4                              $
naics4fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_county_naics4_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_county_naics4_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_county_naics4_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_county_naics4_pri.csv ";
 
data csv_loc.qwi_ak_se_county_naics4_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
county                              = 'Group: FIPS County code'
countyfm                            = 'Group: FIPS County name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics4                              = 'Group: NAICS 4-digit industry code'
naics4fm                            = 'Group: NAICS 4-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
county                              $
countyfm                            $
qwi_ind                             $
naics4                              $
naics4fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_county_naics4_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_county_naicssec_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_county_naicssec_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_county_naicssec_all.csv ";
 
data csv_loc.qwi_ak_se_county_naicssec_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
county                              = 'Group: FIPS County code'
countyfm                            = 'Group: FIPS County name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naicssec                            = 'Group: NAICS Sector code'
naicssecfm                          = 'Group: NAICS Sector name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
county                              $
countyfm                            $
qwi_ind                             $
naicssec                            $
naicssecfm                          $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_county_naicssec_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_county_naicssec_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_county_naicssec_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_county_naicssec_pri.csv ";
 
data csv_loc.qwi_ak_se_county_naicssec_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
county                              $3.
countyfm                            $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
county                              = 'Group: FIPS County code'
countyfm                            = 'Group: FIPS County name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naicssec                            = 'Group: NAICS Sector code'
naicssecfm                          = 'Group: NAICS Sector name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
county                              $
countyfm                            $
qwi_ind                             $
naicssec                            $
naicssecfm                          $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_county_naicssec_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_metro_naics3_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_metro_naics3_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_metro_naics3_all.csv ";
 
data csv_loc.qwi_ak_se_metro_naics3_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
metro                               = 'Group: FIPS Metro Area code'
metrofm                             = 'Group: FIPS Metro Area name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics3                              = 'Group: NAICS 3-digit industry code'
naics3fm                            = 'Group: NAICS 3-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
metro                               $
metrofm                             $
qwi_ind                             $
naics3                              $
naics3fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_metro_naics3_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_metro_naics3_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_metro_naics3_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_metro_naics3_pri.csv ";
 
data csv_loc.qwi_ak_se_metro_naics3_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
metro                               = 'Group: FIPS Metro Area code'
metrofm                             = 'Group: FIPS Metro Area name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics3                              = 'Group: NAICS 3-digit industry code'
naics3fm                            = 'Group: NAICS 3-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
metro                               $
metrofm                             $
qwi_ind                             $
naics3                              $
naics3fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_metro_naics3_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_metro_naics4_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_metro_naics4_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_metro_naics4_all.csv ";
 
data csv_loc.qwi_ak_se_metro_naics4_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
metro                               = 'Group: FIPS Metro Area code'
metrofm                             = 'Group: FIPS Metro Area name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics4                              = 'Group: NAICS 4-digit industry code'
naics4fm                            = 'Group: NAICS 4-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
metro                               $
metrofm                             $
qwi_ind                             $
naics4                              $
naics4fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_metro_naics4_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_metro_naics4_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_metro_naics4_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_metro_naics4_pri.csv ";
 
data csv_loc.qwi_ak_se_metro_naics4_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
metro                               = 'Group: FIPS Metro Area code'
metrofm                             = 'Group: FIPS Metro Area name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics4                              = 'Group: NAICS 4-digit industry code'
naics4fm                            = 'Group: NAICS 4-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
metro                               $
metrofm                             $
qwi_ind                             $
naics4                              $
naics4fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_metro_naics4_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_metro_naicssec_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_metro_naicssec_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_metro_naicssec_all.csv ";
 
data csv_loc.qwi_ak_se_metro_naicssec_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
metro                               = 'Group: FIPS Metro Area code'
metrofm                             = 'Group: FIPS Metro Area name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naicssec                            = 'Group: NAICS Sector code'
naicssecfm                          = 'Group: NAICS Sector name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
metro                               $
metrofm                             $
qwi_ind                             $
naicssec                            $
naicssecfm                          $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_metro_naicssec_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_metro_naicssec_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_metro_naicssec_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_metro_naicssec_pri.csv ";
 
data csv_loc.qwi_ak_se_metro_naicssec_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
metro                               $8.
metrofm                             $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
metro                               = 'Group: FIPS Metro Area code'
metrofm                             = 'Group: FIPS Metro Area name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naicssec                            = 'Group: NAICS Sector code'
naicssecfm                          = 'Group: NAICS Sector name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
metro                               $
metrofm                             $
qwi_ind                             $
naicssec                            $
naicssecfm                          $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_metro_naicssec_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_naics3_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_naics3_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_naics3_all.csv ";
 
data csv_loc.qwi_ak_se_naics3_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics3                              = 'Group: NAICS 3-digit industry code'
naics3fm                            = 'Group: NAICS 3-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_ind                             $
naics3                              $
naics3fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_naics3_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_naics3_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_naics3_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_naics3_pri.csv ";
 
data csv_loc.qwi_ak_se_naics3_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics3                              = 'Group: NAICS 3-digit industry code'
naics3fm                            = 'Group: NAICS 3-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_ind                             $
naics3                              $
naics3fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_naics3_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_naics4_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_naics4_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_naics4_all.csv ";
 
data csv_loc.qwi_ak_se_naics4_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics4                              = 'Group: NAICS 4-digit industry code'
naics4fm                            = 'Group: NAICS 4-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_ind                             $
naics4                              $
naics4fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_naics4_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_naics4_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_naics4_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_naics4_pri.csv ";
 
data csv_loc.qwi_ak_se_naics4_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics4                              = 'Group: NAICS 4-digit industry code'
naics4fm                            = 'Group: NAICS 4-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_ind                             $
naics4                              $
naics4fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_naics4_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_wib_naics3_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_wib_naics3_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_wib_naics3_all.csv ";
 
data csv_loc.qwi_ak_se_wib_naics3_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
wib                                 = 'Group: WIB code'
wibfm                               = 'Group: WIB name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics3                              = 'Group: NAICS 3-digit industry code'
naics3fm                            = 'Group: NAICS 3-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
wib                                 $
wibfm                               $
qwi_ind                             $
naics3                              $
naics3fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_wib_naics3_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_wib_naics3_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_wib_naics3_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_wib_naics3_pri.csv ";
 
data csv_loc.qwi_ak_se_wib_naics3_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naics3                              $3.
naics3fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
wib                                 = 'Group: WIB code'
wibfm                               = 'Group: WIB name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics3                              = 'Group: NAICS 3-digit industry code'
naics3fm                            = 'Group: NAICS 3-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
wib                                 $
wibfm                               $
qwi_ind                             $
naics3                              $
naics3fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_wib_naics3_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_wib_naics4_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_wib_naics4_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_wib_naics4_all.csv ";
 
data csv_loc.qwi_ak_se_wib_naics4_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
wib                                 = 'Group: WIB code'
wibfm                               = 'Group: WIB name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics4                              = 'Group: NAICS 4-digit industry code'
naics4fm                            = 'Group: NAICS 4-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
wib                                 $
wibfm                               $
qwi_ind                             $
naics4                              $
naics4fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_wib_naics4_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_wib_naics4_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_wib_naics4_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_wib_naics4_pri.csv ";
 
data csv_loc.qwi_ak_se_wib_naics4_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naics4                              $4.
naics4fm                            $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
wib                                 = 'Group: WIB code'
wibfm                               = 'Group: WIB name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naics4                              = 'Group: NAICS 4-digit industry code'
naics4fm                            = 'Group: NAICS 4-digit industry name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
wib                                 $
wibfm                               $
qwi_ind                             $
naics4                              $
naics4fm                            $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_wib_naics4_pri.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_wib_naicssec_all.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_wib_naicssec_all.csv.gz ";
filename csvfile "&directory/qwi_ak_se_wib_naicssec_all.csv ";
 
data csv_loc.qwi_ak_se_wib_naicssec_all;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
wib                                 = 'Group: WIB code'
wibfm                               = 'Group: WIB name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naicssec                            = 'Group: NAICS Sector code'
naicssecfm                          = 'Group: NAICS Sector name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
wib                                 $
wibfm                               $
qwi_ind                             $
naicssec                            $
naicssecfm                          $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_wib_naicssec_all.csv
******************************************************************/
 
 
/*****************************************************************
SAS import code for CSV file qwi_ak_se_wib_naicssec_pri.csv
Code will need the assignment of the &directory and &libname
location to work
 
For UNIX, you can also uncomment the second filename statement
and comment out the first filename statement.
******************************************************************/
 
* filename csvfile pipe "gunzip -c &directory/qwi_ak_se_wib_naicssec_pri.csv.gz ";
filename csvfile "&directory/qwi_ak_se_wib_naicssec_pri.csv ";
 
data csv_loc.qwi_ak_se_wib_naicssec_pri;
infile csvfile delimiter = "," missover dsd lrecl=32767 firstobs=2;
informat
CreateDate                          DATE9.
state                               $2.
year                                best32.
quarter                             best32.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                best32.
Emp                                 best32.
EmpEnd                              best32.
EmpS                                best32.
TurnOvrS                            best32.
HirAS                               best32.
FrmJbGnS                            best32.
FrmJbLsS                            best32.
FrmJbCS                             best32.
SepS                                best32.
HirN                                best32.
HirNS                               best32.
FrmJbGn                             best32.
FrmJbLs                             best32.
FrmJbC                              best32.
HirR                                best32.
Sep                                 best32.
EmpTotal                            best32.
Payroll                             best32.
NEmpHirA                            best32.
NEmpHirN                            best32.
NEmpHirR                            best32.
NEmpSep                             best32.
EarnEnd                             best32.
EarnS                               best32.
EarnHirAS                           best32.
EarnSepS                            best32.
EarnHirNS                           best32.
EarnHirAC                           best32.
EarnSepC                            best32.
sHirA                               best32.
sEmp                                best32.
sEmpEnd                             best32.
sEmpS                               best32.
sTurnOvrS                           best32.
sHirAS                              best32.
sFrmJbGnS                           best32.
sFrmJbLsS                           best32.
sFrmJbCS                            best32.
sSepS                               best32.
sHirN                               best32.
sHirNS                              best32.
sFrmJbGn                            best32.
sFrmJbLs                            best32.
sFrmJbC                             best32.
sHirR                               best32.
sSep                                best32.
sEmpTotal                           best32.
sPayroll                            best32.
sNEmpHirA                           best32.
sNEmpHirN                           best32.
sNEmpHirR                           best32.
sNEmpSep                            best32.
sEarnEnd                            best32.
sEarnS                              best32.
sEarnHirAS                          best32.
sEarnSepS                           best32.
sEarnHirNS                          best32.
sEarnHirAC                          best32.
sEarnSepC                           best32.
;
format
CreateDate                          DATE9.
state                               $2.
year                                BEST12.
quarter                             BEST12.
qwi_geo                             $11.
wib                                 $8.
wibfm                               $64.
qwi_ind                             $7.
naicssec                            $5.
naicssecfm                          $113.
ownercode                           $3.
ownerfm                             $15.
sex                                 $1.
sexfm                               $15.
education                           $2.
educationfm                         $32.
HirA                                BEST20.
Emp                                 BEST20.
EmpEnd                              BEST20.
EmpS                                BEST20.
TurnOvrS                            BEST20.3
HirAS                               BEST20.
FrmJbGnS                            BEST20.
FrmJbLsS                            BEST20.
FrmJbCS                             BEST20.
SepS                                BEST20.
HirN                                BEST20.
HirNS                               BEST20.
FrmJbGn                             BEST20.
FrmJbLs                             BEST20.
FrmJbC                              BEST20.
HirR                                BEST20.
Sep                                 BEST20.
EmpTotal                            BEST20.
Payroll                             BEST25.
NEmpHirA                            BEST20.1
NEmpHirN                            BEST20.1
NEmpHirR                            BEST20.1
NEmpSep                             BEST20.1
EarnEnd                             BEST20.
EarnS                               BEST20.
EarnHirAS                           BEST20.
EarnSepS                            BEST20.
EarnHirNS                           BEST20.
EarnHirAC                           BEST20.
EarnSepC                            BEST20.
sHirA                               best12.
sEmp                                best12.
sEmpEnd                             best12.
sEmpS                               best12.
sTurnOvrS                           best12.
sHirAS                              best12.
sFrmJbGnS                           best12.
sFrmJbLsS                           best12.
sFrmJbCS                            best12.
sSepS                               best12.
sHirN                               best12.
sHirNS                              best12.
sFrmJbGn                            best12.
sFrmJbLs                            best12.
sFrmJbC                             best12.
sHirR                               best12.
sSep                                best12.
sEmpTotal                           best12.
sPayroll                            best12.
sNEmpHirA                           best12.
sNEmpHirN                           best12.
sNEmpHirR                           best12.
sNEmpSep                            best12.
sEarnEnd                            best12.
sEarnS                              best12.
sEarnHirAS                          best12.
sEarnSepS                           best12.
sEarnHirNS                          best12.
sEarnHirAC                          best12.
sEarnSepC                           best12.
;
label
CreateDate                          = 'File Creation Date'
state                               = 'Group: FIPS state numeric code'
year                                = 'Time: Year'
quarter                             = 'Time: Quarter'
qwi_geo                             = 'Group: QWI Geocode'
wib                                 = 'Group: WIB code'
wibfm                               = 'Group: WIB name'
qwi_ind                             = 'Group: QWI NAICS Industry Code'
naicssec                            = 'Group: NAICS Sector code'
naicssecfm                          = 'Group: NAICS Sector name'
ownercode                           = 'Group: Ownership group code'
ownerfm                             = 'Group: Ownership group name'
sex                                 = 'Group: Gender code'
sexfm                               = 'Group: Gender name'
education                           = 'Group: education code'
educationfm                         = 'Group: education name'
HirA                                = 'Hires All: Counts'
Emp                                 = 'Employment: Counts'
EmpEnd                              = 'Employment end-of-quarter: Counts'
EmpS                                = 'Employment stable jobs: Counts'
TurnOvrS                            = 'Turnover stable jobs: Ratio'
HirAS                               = 'Hires All stable jobs: Counts'
FrmJbGnS                            = 'Firm Gain stable jobs: Counts'
FrmJbLsS                            = 'Firm Loss stable jobs: Counts'
FrmJbCS                             = 'Firm stable jobs change: Net Change'
SepS                                = 'Separations stable jobs: Counts'
HirN                                = 'Hires New: Counts'
HirNS                               = 'Hires New stable jobs: Counts'
FrmJbGn                             = 'Firm Job Gains: Counts'
FrmJbLs                             = 'Firm Job Loss: Counts'
FrmJbC                              = 'Firm jobs change: Net Change'
HirR                                = 'Hires Recalls: Counts'
Sep                                 = 'Separations: Counts'
EmpTotal                            = 'Employment reference quarter: Counts'
Payroll                             = 'Total quarterly payroll: Sum'
NEmpHirA                            = 'Hires All: Average quarters of non-employment'
NEmpHirN                            = 'Hires New: Average quarters of non-employment'
NEmpHirR                            = 'Hire Recalls: Average quarters of non-employment'
NEmpSep                             = 'Separations: Average periods of non-employment'
EarnEnd                             = 'Employees end-of-quarter : Average monthly earnings'
EarnS                               = 'Employees stable jobs: Average monthly earnings'
EarnHirAS                           = 'Hires All stable jobs: Average monthly earnings'
EarnSepS                            = 'Separations stable jobs: Average monthly earnings'
EarnHirNS                           = 'Hires New stable jobs: Average monthly earnings'
EarnHirAC                           = 'Hires All: Average change in monthly earnings'
EarnSepC                            = 'Separations: Average change in monthly earnings'
sHirA                               = 'Status: Hires All: Counts'
sEmp                                = 'Status: Employment: Counts'
sEmpEnd                             = 'Status: Employment end-of-quarter: Counts'
sEmpS                               = 'Status: Employment stable jobs: Counts'
sTurnOvrS                           = 'Status: Turnover stable jobs: Ratio'
sHirAS                              = 'Status: Hires All stable jobs: Counts'
sFrmJbGnS                           = 'Status: Firm Gain stable jobs: Counts'
sFrmJbLsS                           = 'Status: Firm Loss stable jobs: Counts'
sFrmJbCS                            = 'Status: Firm stable jobs change: Net Change'
sSepS                               = 'Status: Separations stable jobs: Counts'
sHirN                               = 'Status: Hires New: Counts'
sHirNS                              = 'Status: Hires New stable jobs: Counts'
sFrmJbGn                            = 'Status: Firm Job Gains: Counts'
sFrmJbLs                            = 'Status: Firm Job Loss: Counts'
sFrmJbC                             = 'Status: Firm jobs change: Net Change'
sHirR                               = 'Status: Hires Recalls: Counts'
sSep                                = 'Status: Separations: Counts'
sEmpTotal                           = 'Status: Employment reference quarter: Counts'
sPayroll                            = 'Status: Total quarterly payroll: Sum'
sNEmpHirA                           = 'Status: Hires All: Average quarters of non-employment'
sNEmpHirN                           = 'Status: Hires New: Average quarters of non-employment'
sNEmpHirR                           = 'Status: Hire Recalls: Average quarters of non-employment'
sNEmpSep                            = 'Status: Separations: Average periods of non-employment'
sEarnEnd                            = 'Status: Employees end-of-quarter : Average monthly earnings'
sEarnS                              = 'Status: Employees stable jobs: Average monthly earnings'
sEarnHirAS                          = 'Status: Hires All stable jobs: Average monthly earnings'
sEarnSepS                           = 'Status: Separations stable jobs: Average monthly earnings'
sEarnHirNS                          = 'Status: Hires New stable jobs: Average monthly earnings'
sEarnHirAC                          = 'Status: Hires All: Average change in monthly earnings'
sEarnSepC                           = 'Status: Separations: Average change in monthly earnings'
;
input
CreateDate
state                               $
year
quarter
qwi_geo                             $
wib                                 $
wibfm                               $
qwi_ind                             $
naicssec                            $
naicssecfm                          $
ownercode                           $
ownerfm                             $
sex                                 $
sexfm                               $
education                           $
educationfm                         $
HirA
Emp
EmpEnd
EmpS
TurnOvrS
HirAS
FrmJbGnS
FrmJbLsS
FrmJbCS
SepS
HirN
HirNS
FrmJbGn
FrmJbLs
FrmJbC
HirR
Sep
EmpTotal
Payroll
NEmpHirA
NEmpHirN
NEmpHirR
NEmpSep
EarnEnd
EarnS
EarnHirAS
EarnSepS
EarnHirNS
EarnHirAC
EarnSepC
sHirA
sEmp
sEmpEnd
sEmpS
sTurnOvrS
sHirAS
sFrmJbGnS
sFrmJbLsS
sFrmJbCS
sSepS
sHirN
sHirNS
sFrmJbGn
sFrmJbLs
sFrmJbC
sHirR
sSep
sEmpTotal
sPayroll
sNEmpHirA
sNEmpHirN
sNEmpHirR
sNEmpSep
sEarnEnd
sEarnS
sEarnHirAS
sEarnSepS
sEarnHirNS
sEarnHirAC
sEarnSepC
;
run;
 
/*****************************************************************
End of SAS syntax to import csv file: &directory/qwi_ak_se_wib_naicssec_pri.csv
******************************************************************/
 
