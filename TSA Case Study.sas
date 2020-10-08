%let statename=Arizona;
%let path=/home/u49347396/ECRB94/data;
libname tsa "&path";
options validvarname=v7;

proc import datafile="&path/TSAClaims2002_2017.csv" dbms=csv 
		out=tsa.ClaimsImport replace;
	guessingrows=max;
run;

/*Explore Data*/
proc print data=tsa.claimsimport (obs=20);
run;

proc contents data=tsa.claimsimport varnum;
run;

proc freq data=tsa.claimsimport;
	tables Claim_Type Claim_Site Disposition Incident_Date Date_Received / nocum 
		nopercent;
	format Incident_Date Date_Received year4.;
run;

proc print data=tsa.claimsimport;
	where Date_Received < Incident_Date;
	format Date_Received Incident_Date date9.;
run;

proc sort data=tsa.claimsimport out=tsa.claims_Nodups nodup;
	by _all_;
run;

proc sort data=tsa.claims_nodups;
	by Incident_Date;
run;

data tsa.claims_cleaned;
	set tsa.claims_nodups;

	if Claim_Type in ('-', '') then
		Claim_Type='Unknown';
	else if Claim_Type='Passenger Property Loss/Personal Injur' then
		Claim_Type='Passenger Property Loss';
	else if Claim_Type='Passenger Property Loss/Personal Injury' then
		Claim_Type='Passenger Property Loss';
	else if Claim_Type='Property Damage/Personal Injury' then
		Claim_Type='Property Damage';

	if Claim_Site in ('-', '') then
		Claim_Site='Unknown';

	if Disposition in ('-', '') then
		Disposition='Unknown';
	else if Disposition='losed: Contractor Claim' then
		Disposition='Closed:Contractor Claim';
	else if Disposition='Closed: Canceled' then
		Disposition='Closed:Canceled';
	StateName=propcase(StateName);
	State=upcase(State);

	if (Incident_Date=. or Date_Received=. or year(Incident_Date)<2002 or 
		Year(Incident_Date)>2017 or year(Date_Received)<2002 or 
		year(Date_Received)>2017 or Incident_Date > Date_Received) then
			Date_Issues='Needs Review';
	drop County City;
	format Close_Amount dollar10.2 Incident_Date Date_Received date9.;
	label Claim_Type='Claim Type' Claim_Site='Claim Site' 
		Incident_Date='Incident Date' Date_Received='Date Received' 
		Close_Amount='Close Amount' Date_Issues='Date Issues' 
		Airport_Code='Airport Code' Airport_Name='Airport Name' 
		Item_Category='Item Category';
run;

proc sort data=tsa.claims_cleaned;
	by Incident_Date;
run;

proc freq data=tsa.claims_cleaned order=freq;
	tables Claim_Site Disposition Claim_Type Date_Issues/ nopercent nocum;
run;





%let outpath=/home/u49347396/ECRB94/output;
ods pdf file="&outpath/claimsreport.pdf" style=sapphire pdftoc=1 startpage=no;
ods noproctitle;
ods proclabel "Overall Date Issues";
ods text='TSA Case Study Results';
ods text='Here are the results for the overall analysis and a report with the selected state of Arizona.';

ods text="1. How many date issues are in the overall data?";
proc freq data=tsa.claims_cleaned order=freq;
	tables Date_Issues/ nopercent nocum;
run;
ods text="2. How many claims per year of Incident_Date are in the overall data? Be sure to include a plot.";
ods proclabel "Overall Claims by Year";
ods graphics on;

proc freq data=tsa.claims_cleaned;
	tables Incident_Date /nocum nopercent plots=freqplot;
	format Incident_Date year4.;
	where Date_Issues is null;
run;

ods noproctitle;
ods text="3. Analysis for Arizona" ;
ods text="a. What are the frequency values for Claim_Site for Arizona?";
ods proclabel "&statename Claims Overview";
proc freq data=tsa.claims_cleaned order=freq;
	tables Claim_Site / nopercent nocum;
	where StateName="&STATENAME" and Date_Issues is null;
run;

ods noproctitle;
ods text="b. What are the frequency values for Claim_Type for Arizona?";
ods proclabel "&statename Claims Overview";
proc freq data=tsa.claims_cleaned order=freq;
	tables Claim_Type / nopercent nocum;
	where StateName="&STATENAME" and Date_Issues is null;
run;

ods noproctitle;
ods text="c. What are the frequency values for Disposition for Arizona?";
ods proclabel "&statename Claims Overview";
proc freq data=tsa.claims_cleaned order=freq;
	tables  Disposition/ nopercent nocum;
	where StateName="&STATENAME" and Date_Issues is null;
run;


ods proclabel "&statename Close Amount Statistics";
ods text="d. What is the mean, minimum, maximum, and sum of Close_Amount for Arizona? Round to
the nearest integer.";
proc means data=tsa.claims_cleaned mean min max sum maxdec=0;
	var Close_Amount;
	where StateName="&Statename" and Date_Issues is null;
run;

ods pdf close;
