dm "odsresult" clear;
dm "log" clear;

libname data "\\Mac\Home\Desktop\SAS\sas data";

data ad;
	set data.ad_dataset_new;
run;

data ad1;
	set ad;
	
	if htn = . then hthbi = .;
	else if htn = 0 then htnbi = 0;
	else htnbi = 1;

	if cvd = . then cvdbi = .;
	else if cvd = 0 then cvdbi = 0;
	else cvdbi = 1;

	if age = . then agebi = .;
	else if age < 75 then agebi = 0;
	else agebi = 1;

	if eduyr = . then edubi = .;
	else if eduyr <12 then edubi = 1;
	else edubi = 0;

	if smk = . then smkbi = .;
	else if smk = 0 then smkbi = 0;
	else smk = 1;
run;

proc sort data = ad1;
	by descending htn descending caco;
run;

/* htn (e) --> caco (dz) */
proc freq data = ad1 order = data;
	tables htn * caco;
	tables htnbi * caco / or;
run;

proc freq data = ad1 order = data;
	tables sex * htnbi * caco / or cmh;
	tables agebi * htnbi * caco / or cmh;
	tables edubi * htnbi * caco / or cmh;
	tables apo4car * htnbi * caco / or cmh;
	tables smkbi * htnbi * caco / or cmh;
	tables cvdbi * htnbi * caco / or cmh;
run;

proc iml ;
	crude_htn = 0.5089;
	pool_sex = 0.4938;
	pool_age = 0.4257;
	pool_edu = 0.4861;
	pool_apoe = 0.5336;
	pool_smk = 0.5153;
	pool_cvd = 0.4257;

	cf_sex = abs(pool_sex - crude_htn ) / crude_htn;
	cf_age = abs(pool_age - crude_htn ) / crude_htn;
	cf_edu = abs(pool_edu - crude_htn ) / crude_htn;
	cf_apoe = abs(pool_apoe - crude_htn ) / crude_htn;
	cf_smk = abs(pool_smk - crude_htn ) / crude_htn;
	cf_cvd = abs(pool_cvd - crude_htn ) / crude_htn; 

	print cf_sex cf_age cf_edu cf_apoe cf_smk cf_cvd;

quit;

proc logistic data = ad1;
		class edubi (ref = "0")  sex (ref = "0") apo4car (ref = "0") htnbi(ref = "0") smkbi(ref = "0")  cvdbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnbi age sex apo4car edubi cvdbi smkbi;
	run;

proc logistic data = ad1;
		class edubi (ref = "0") agebi(ref = "0") sex (ref = "0") apo4car (ref = "0") htnbi(ref = "0") smkbi(ref = "0")  cvdbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnbi agebi sex apo4car edubi cvdbi smkbi;
	run;

/* htnbi --> caco, stratified by agegp */

proc univariate data = ad;
		var age ;
		histogram age / normal;
		qqplot age / normal ( mu = est sigma = est);
	run;

	data ad2;
		set ad1;

		if age = . then agegp = .;
		else if age < 70 then agegp = 1;
		else if age < 75 then agegp = 2;
		else if age < 80 then agegp = 3;
		else if age < 85 then agegp = 4;
		else agegp = 5;

	run;

	proc freq data = ad2;
		tables agegp;
	run;
	
	proc sort data = ad2;
		by descending htnbi descending caco agegp;
	run;
	proc freq data = ad2 order = data;
		tables agegp * htnbi * caco / or cmh;
	run;

/* htnbi --> caco stratified by edugp */

	proc univariate data = ad1;
		var eduyr;
		histogram eduyr / normal;
		qqplot eduyr / normal ( mu = est sigma = est);
	run;

	data ad3;
		set ad1;

		if eduyr = . then edugp = .;
		else if eduyr < 6 then edugp = 1;
		else if eduyr < 12 then edugp = 2;
		else if eduyr < 18 then edugp = 3;
		else edugp = 4;
	run;

	proc freq data = ad3;
		tables edugp;
	run;

	proc sort data = ad3;
		by descending htnbi descending caco desending edugp;
	run;

	proc freq data = ad3;
		tables edugp * caco / or;
	run;

	proc freq data = ad3 order = data;
		tables edugp * htnbi * caco / or cmh;
	run;
