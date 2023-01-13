/* final interaction */
dm "odsresult" clear;
dm "log" clear;
	/* age */
	/*proc univariate data = ad1;
		var age;
		histogram age / normal ;
	run;
	
	proc univariate data = ad1;
		var bmi;
		histogram bmi / normal;
	run;
	data ad4;
		set ad3;

		if age = . then agebi = .;
		else if age <= 74 then agebi = 0;
		else agebi = 1;

		if age = . then agegp = .;
		else if age <= 69 then agegp = 0;
		else if age <= 74 then agegp = 1;
		else if age <= 79 then agegp = 2;
		else if age <= 84 then agegp = 3;
		else agegp = 4;

		if eduyr = . then edubi = .;
		else if eduyr <= 12 then edubi = 1;
		else edubi = 0;

		if bmi = . then bmibi = .;
		else if bmi <= 24 then bmibi = 0;
		else bmibi = 1;

	run; */

data ad5;
	set ad5;

	if coffeebi = . then coffee2 = .;
	else if coffeebi = 1 then coffee2 = 0;
	else coffee2 = 1;

	if teabi = . then tea2 = .;
	else if teabi = 0 then tea2 = 1;
	else tea2 = 0;

	if cholbi = . then chol2 = .;
	else if cholbi = 0 then chol2 = 1;
	else chol2 = 0;

	if cvdbi = . then cvd2 = .;
	else if cvdbi = 1 then cvd2 = 0;
	else cvd2 = 1;

	if htn = . then htnbi = .;
	else if htn = 0 then htnbi = 1;
	else htnbi = 0;
	
run;
/* agebi */
title "agebi";
	proc sort data = ad5;
		by descending agebi  descending htn1 descending caco;
	run;

	proc freq data = ad5 order = data;
		tables agebi * htn1 * caco / or cmh;
	run;

/* agegp */
title "agegp" ;
	proc sort data = ad5;
		by agegp descending htn1 descending caco ;
	run;
	
	proc freq data = ad5 order = data;
		tables agegp * htn1 * caco / or cmh;
	run;

/* edubi */
title "edubi";
	proc sort data = ad5 ;
		by descending htn1 descending caco descending edubi;
	run;

	proc freq data = ad5 order = data;
		tables edubi * htn1 * caco / or cmh;
		tables edubi * caco / or cmh;
	run;

/* bmibi */
title "bmibi";
	proc sort data = ad5;
		by descending bmibi descending htn1 descending caco ;
	run;
	
	proc freq data = ad5 order = data;
		tables bmibi * htn1 * caco / or cmh;
		tables bmibi * caco / or;
	run;


/* sex */
title "sex";
	proc sort data = ad5;
		by sexbi descending htn1 descending caco ;
	run;
	
	proc freq data = ad5 order = data;
		tables sexbi * htn1 * caco / or cmh;
	run;
/* apo4car */
title "apo4car";
	proc sort data = ad5;
		by apo4car descending htn1 descending caco ;
	run;
	
	proc freq data = ad5 order = data;
		tables apo4car * htn1 * caco / or cmh;
	run;

/* smk */
title "smkbi";
	proc sort data = ad5;
		by descending htn1 descending caco smkbi;
	run;
	
	proc freq data = ad5 order = data;
		tables smkbi * htn1 * caco / or cmh;
	run;

/* alcohol */
title "alcohol";
	proc sort data = ad5;
		by descending htn1 descending caco alcohol;
	run;
	
	proc freq data = ad5 order = data;
		tables alcohol * htn1 * caco / or cmh;
	run;
/* ets */
title "est";
	proc sort data = ad5;
		by descending htn1 descending caco ets;
	run;
	
	proc freq data = ad5 order = data;
		tables ets * htn1 * caco / or cmh;
	run;

/* coffeebi */
title "coffee2";
	proc sort data = ad5;
		by descending htn1 descending caco coffeebi;
	run;
	
	proc freq data = ad5 order = data;
		tables coffee2 * htn1 * caco / or cmh;
	run;

/* tea */
title "tea2";
	proc sort data = ad5;
		by descending htn1 descending caco tea;
	run;
	
	proc freq data = ad5 order = data;
		tables tea2 * htn1 * caco / or cmh;
	run;

/* dmbi */
title "dmbi";
	proc sort data = ad5;
		by descending htn1 descending caco dmbi;
	run;
	
	proc freq data = ad5 order = data;
		tables dmbi* htn1 * caco / or cmh;
	run;

/* cholbi */
title "chol2";
	proc sort data = ad5;
		by descending htn1 descending caco cholbi;
	run;
	
	proc freq data = ad5 order = data;
		tables chol2 * htn1 * caco / or cmh;
	run;

/* cvdbi */
title "cvdbi";
	proc sort data = ad5;
		by descending htn1 descending caco cvdbi;
	run;
	
	proc freq data = ad5 order = data;
		tables cvdbi * htn1 * caco / or cmh;
	run;

/* ex */
title "exbi";
	proc sort data = ad5;
		by descending htn1 descending caco exbi;
	run;
	
	proc freq data = ad5 order = data;
		tables exbi * htn1 * caco / or cmh;
	run;

/* lsr */
title "lsrbi";
	proc sort data = ad5;
		by descending htn1 descending caco lsr;
	run;
	
	proc freq data = ad5 order = data;
		tables lsrbi * htn1 * caco / or cmh;
	run;

/* corp */
title "corpbi";
	proc sort data = ad5;
		by descending htn1 descending caco corp;
	run;
	
	proc freq data = ad5 order = data;
		tables corpbi * htn1 * caco / or cmh;
	run;

/* proc iml;
	age0 = 2.2300;
	age1 = 2.3525;
	agebi = (age1 - age0) / age0;

	ageg0 = 2.3333;
	ageg1 = 2.4605;
	ageg2 = 2.9677;
	ageg3 = 1.4534;
	ageg4 = 4.0714;
	agegp1 = (ageg1 - ageg0) / ageg0;
	agegp2 = (ageg2 - ageg0) / ageg0;
	agegp3 = (ageg3 - ageg0) / ageg0;
	agegp4 = (ageg4 - ageg0) / ageg0;

	bmi0 = 1.8387;
	bmi1 = 2.4490;
	bmi = (bmi1 - bmi0) / bmi0;

	edu0 = 1.7624;
	edu1 = 2.2333;
	edu = (edu1 - edu0) / edu0;

print agebi agegp1 agegp2 agegp3 agegp4 bmi edu;

quit;
 



	
