/* final */ 
dm "odsresult" clear;
dm "log" clear;

libname data "\\Mac\Home\Desktop\SAS\sas data";

/* table1 */
  data ad;
 	set data.ad_dataset_new;
run;

data ad5;
	set data.ad5;
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

	if tea = . then teabi = .;
	else if tea = 0 then teabi = 0;
	else teabi = 1;

	if coffee = .  then coffeebi = .;
	else if coffee = 0 then coffeebi = 0;
	else coffeebi = 1;

	if ex
run; 

 
	
data ad5;
	set ad5;
	
	if tea = . then teabi = .;
	else if tea = 0 then teabi = 0;
	else teabi = 1;
run;

data ad5;
	set ad5;
	if htn = . then htn1 = .;
	else if htn = 0 then htn1 = 0;
	else htn1 = 1;
run; */
/* grouped by caco */
/* continuous : age eduyr bmi*/
title "continous in caco";
proc univariate data = ad1;
	var bmi;
	histogram bmi / normal ;
run;
proc ttest data = ad1;
	class caco;
	var bmi;
run;
proc means data = ad5;
	class caco;
	var age eduyr bmi;
run;

proc ttest data = ad5;
	class caco;
	var age eduyr bmi;
run;

/* category : sex apo4car ( alchhol smk est ) ( coffee tea ) ( chol dmbi cvdbi ) ( ex lsr corp) */
title "basic in caco";
	proc sort data = ad5;
		by descending sexbi descending apo4car descending caco;
	run;
	proc freq data = ad5 order = data;
		tables sexbi * caco / nopercent nocol chisq or;
		tables apo4car * caco / nopercent nocol chisq or;
	run;
title "abc in caco";
	proc sort data = ad5;
		by descending alcohol descending smkbi descending ets descending caco;
	run;
	proc freq data = ad5 order = data;
		tables alcohol * caco / nopercent nocol chisq or;
		tables smkbi * caco / nopercent nocol chisq or;
		tables ets * caco / nopercent nocol chisq or;
	run;
title "drink in caco";
	proc sort data = ad5;
		by descending coffeebi descending teabi descending caco;
	run;

	proc freq data = ad5 order = data;
		tables coffeebi * caco / nopercent nocol chisq or;
		tables teabi * caco / nopercent nocol chisq or;
	run;

title "disease";
	proc sort data = ad5;
		by descending dmbi descending cholbi descending cvdbi descending caco;
	run;

	proc freq data = ad5 order = data;
		tables dmbi * caco / nopercent nocol chisq or;
		tables cholbi * caco / nopercent nocol chisq or;
		tables cvdbi * caco / nopercent nocol chisq or;
	run;

	title "drink in caco";
	proc sort data = ad5;
		by descending coffee2 descending tea2 descending caco;
	run;

	proc freq data = ad5 order = data;
		tables coffee2 * caco / nopercent nocol chisq or;
		tables tea2 * caco / nopercent nocol chisq or;
	run;

title "disease";
	proc sort data = ad5;
		by descending dmbi descending chol2 descending cvd2 descending caco;
	run;

	proc freq data = ad5 order = data;
		/*tables dmbi * caco / nopercent nocol chisq or;*/
		tables chol2 * caco / nopercent nocol chisq or;
		tables cvd2 * caco / nopercent nocol chisq or;
	run;

	proc sort data = ad5;
		by descending htn1 descending caco;
	run;

	proc freq data = ad5 order = data;
		tables htn1 * caco / nopercent nocol chisq or;
	run;

title "habbit in caco";
	proc sort data = ad5;
		by descending exbi descending lsrbi descending corpbi descending caco;
	run;

	proc freq data = ad5 order = data;
		tables exbi * caco / nopercent nocol chisq or;
		tables lsrbi * caco / nopercent nocol chisq or;
		tables corpbi * caco / nopercent nocol chisq or;
	run;

proc freq data = ad5;
	tables caco;
run;
proc sort data = ad5;
	by descending edubi descending cacol ;
run;

proc freq data = ad5 order = data;
	tables edubi * caco / or chisq;
run;
proc sort data = ad5;
	by descending agebi descending htnbi descending caco;
run;


proc freq data = ad5 order = data;
	tables agebi * caco / chisq or;
	tables agebi * htnbi * caco / or cmh;
run;
