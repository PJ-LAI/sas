/*homework 9*/
dm "odsresult" clear;
dm "log"clear;
	/* import data of sasdataset*/
	libname data "\\Mac\Home\Desktop\";
/* q1 */
title "q1";
	/* univariable analysis (age, bmi)*/
	data ad;
		set data.ad_dataset_new;
		bmi = wt40 / (ht / 100)  ** 2;
	run;

	proc univariate data = ad ;
		var age bmi;
		histogram age bmi / normal;
		qqplot age bmi / normal ( mu = est sigma = est);
	run;
/* excluding unsuitable data */
	proc print data = ad;
		where bmi > 60;
		var ht wt40 bmi age;
	run;

	data ad;
		set data.ad_dataset_new;
		bmi = wt40 / (ht / 100)  ** 2;
		if bmi < 60;
	run;

	proc univariate data = ad ;
		var age bmi;
		histogram age bmi / normal;
		qqplot age bmi / normal ( mu = est sigma = est);
	run;

/* q2 educational status (E) --> AD (DZ),  stratified by APOE status */
	title "q2";
	/* grouping educational status , <12 and  >=12*/
	proc univariate data = ad;
		var eduyr;
		histogram eduyr / normal;
	run;
	
	data ad2;
		set ad;
		if eduyr = . then edugp = .;
		else if eduyr < 12 then edugp = 1;
		else edugp = 0;
	run;

	proc print data = ad2;
		var eduyr edugp;
	run;

	/* crude OR */
	proc freq data = ad2;
		tables edugp * caco / or;
	run;

	/* stratum specific OR */
	proc freq data = ad2;
		tables apo4car * edugp * caco / cmh or ;
	run;

/* logistic regression educational status (E) --> AD(DZ) */
title "q3" ;
	/* unadjusted */
	proc logistic data = ad2;
		class edugp (ref = "0") /param = ref;
		model caco (event = "1") = edugp;
	run;

	proc logistic data = ad2;
		class edugp (ref = "0") sex (ref = "0") apo4car (ref = "0") / param = ref;
		model caco ( event = "1") = edugp age sex bmi apo4car ;
	run;

	proc logistic data = ad2;
		model caco(event = "1") = eduyr;
	run;









