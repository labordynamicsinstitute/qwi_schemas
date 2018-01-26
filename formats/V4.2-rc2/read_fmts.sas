/*
   Author: Lars Vilhuber
   Based on code by Stephen Tibbets

   this program is designed to read the CSV files for the SAS formats
   into a SAS formats library.
*/

%let schemaver=V4.1-rc1;
%let baseurl=http://lehd.ces.census.gov/data/schema/&schemaver.;


data fmtnames;
	length myinfile $300;
	input myinfile;
datalines;
label_periodicity.csv
label_seasonadj.csv
label_geo_level.csv
label_ind_level.csv
label_industry.csv
label_ownercode.csv
label_sex.csv
label_agegrp.csv
label_race.csv
label_ethnicity.csv
label_education.csv
label_firmage.csv
label_firmsize.csv
label_flags.csv
;;
run;

%macro readinfmts(baseurl=,fmtnames=WORK.fmtnames);

%let dsid = %sysfunc(open(&fmtnames.));
%let nobs=%sysfunc(attrn(&dsid,nobs));
%let rc = %sysfunc(close(&dsid));

libname LIBRARY (work);

%do counter=1 %to &nobs.;
data _null_;
set fmtnames;
if _n_=&counter then
call symput('myinfile',trim(left(myinfile)));
run;


%put INFO: reading in &myinfile.;

/* now read it in */
filename stuff url "&baseurl./&myinfile.";

data fmt;
length start $20 label $300 fmtname $8;
infile stuff firstobs=2 dsd dlm=',' end=done ;
	do while (not done);
		input start label;
		** the format name is the first seven characters of the file name **;
		fmtname='$'||substr(scan("&myinfile",2,"_."),1,7);
		output;
	end;
	run;

proc append base=fmts data=fmt;
run;

/* check for dups */
	proc sort data=fmts nodups;
	by fmtname start;
run;
%end; /* end counter */
%mend;

/* run it */
%readinfmts(baseurl=&baseurl.,fmtnames=WORK.fmtnames);

proc format cntlin=fmts library=LIBRARY;
proc format fmtlib library=LIBRARY;
	select :;
quit;
