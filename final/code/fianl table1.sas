/* final */ 
dm "odsresult" clear;
dm "log" clear;

libname data "\\Mac\Home\Desktop\SAS\sas data";

/* table1 */
 data ad;
 	set data.ad_dataset_new;
run;
proc print data = ad;
	var alcohol smk ets coffee tea htn dm chol cvd ex lsr corp;
run;

data ad1;
	set ad;

	bmi = wt40 / (ht /100) **2;
	if bmi < 60;

	if htn = . then htnbi = .;
	else if htn = 0 then htnbi = 0;
	else htnbi = 1;

	if dm = . then dmbi = .;
	else if dm = 0 then dmbi = 0;
	else dmbi = 1;
	
	if chol = . then cholbi = .;
	else if chol = 0 then cholbi = 0;
	else cholbi = 1;

	if cvd = . then cvdbi = .;
	else if cvd = 0 then cvdbi = 0;
	else cvdbi = 1;
run;

proc print data = ad1;
	var tea teabi bmi;
run;



