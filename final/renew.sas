/* final */ 
dm "odsresult" clear;
dm "log" clear;

libname data "\\Mac\Home\Desktop\SAS\sas data";

/* table1 */
  data ad;
 	set data.ad_dataset_new;
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

	if cvd = 0 and dm = 0 and htn = 0 and chol = 0 then deny4 = 1;
	else deny4 = 0;

	if age = . then agebi = .;
	else if age <= 74 then agebi = 0;
	else agebi = 1;

	if ex = . then exbi = .;
	else if ex = 1 then exbi = 0;
	else exbi = 1;
	 
	if corp = . then corpbi =.;
	else if corp = 1 then corpbi = 0;
	else corpbi = 1;
run; 

	proc logistic data = ad1;
		class htnbi(ref = "0") apo4car(ref = "0") cholbi(ref = "0") corpbi(ref = "0") exbi(ref = "0") sex(ref = "1")/ param = ref;
		model caco ( event = "1") = htnbi age sex apo4car eduyr cholbi corpbi exbi ;
	run;

	proc logistic data = ad1;
		class htn(ref = "0") apo4car(ref = "0") chol(ref = "0") corpbi(ref = "0") exbi(ref = "0") sex(ref = "1")/ param = ref;
		model caco ( event = "1") = htn age sex apo4car eduyr chol corpbi exbi ;
	run;

	proc freq data = ad1;
		tables htn * caco;
		tables chol * caco;
	run;

proc sort data = ad1;
	by descending deny4 descending caco;
run;

proc freq data = ad1 order = data;
	tables deny4 * caco / chisq nopercent norow;
run;

proc sort data = ad1;
	by descending agebi descending caco;
run;

proc freq data = ad1 order = data;
	tables deny4 * agebi / chisq;
run;

proc sort data = ad1;
	by descending deny4 descending sex;
run;

proc freq data = ad1 order = data;
	tables deny4 * sex / chisq;
run;

data ad1;
	set ad1;

	if deny4 = 1 and htnbi = 0 then denyhtn = 1;
	else if deny4 = 0 and htnbi = 0 then denyhtn = 0;
	else denyhtn = .;

	if deny4 = 1 and dmbi = 0 then denydm = 1;
	else if deny4 = 0 and dmbi = 0 then denydm = 0;
	else denydm = .;

	if deny4 = 1 and cholbi = 0 then denychol = 1;
	else if deny4 = 0 and cholbi = 0 then denychol = 0;
	else denychol = .;

	if deny4 = 1 and cvdbi = 0 then denycvd = 1;
	else if deny4 = 0 and cvdbi = 0 then denycvd = 0;
	else denycvd = .;
run;

proc sort data = ad1;
	by descending denyhtn descending denydm descending denychol descending denycvd descending caco;
run;

proc freq data = ad1 order = data;
	table denyhtn * caco / chisq;
	tables denychol * caco / chisq;
	tables denydm * caco / chisq;
	tables denycvd * caco / chisq;
run;

data ad1;
	set ad1;

	if htn = 0 and smk = 1 then luckyhtn = 1;
	else if htn = 0 and smk = 0 then luckyhtn = 0;
	else luckyhtn = .;

	if cvd = 0 and smk = 1 then luckycvd = 1;
	else if cvd = 0 and smk = 0 then luckycvd = 0;
	else luckycvd = .;
run;

proc sort data = ad1;
	by descending luckyhtn descending luckycvd descending caco;
run;

proc freq data = ad1 order = data;
	tables luckyhtn * caco / chisq;
	tables luckycvd * caco / chisq;
run;



/* proc sort data = ad1;
	by descending caco descending htn descending chol descending cvd descending dm;
run;
proc freq data = ad1 order = data;
	tables htn * caco;
	tables dm * caco;
	tables chol * caco;
	tables cvd * caco;
run;
