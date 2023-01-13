/* final 10% to select cf */
dm "odsresult" clear;
dm "log" clear;

data data.ad1;
	set ad1;
run;

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
run;

proc freq data = ad5;
	tables coffee * coffee2 / nopercent nocol;
	tables tea * tea2 / nopercent nocol;
	tables chol * chol2 / nopercent nocol;
	tables cvd * cvd2 / nopercent nocol;
run;
	

/* crude htnx (e) --> caco (dz) */
title "crude";
	proc logistic data = ad2;
		class htnx(ref = "0") / param = ref;
		model caco ( event = "1") = htnx ;
	run;

	/* age */
	title "age";
	proc logistic data = ad2;
		class htnx(ref = "0") / param = ref;
		model caco ( event = "1") = htnx age ;
	run;

	/* eduyr */
	title "eduyr";
	proc logistic data = ad2;
		class htnx(ref = "0") / param = ref;
		model caco ( event = "1") = htnx eduyr;
	run;

	/* bmi */
	title "bmi";
	proc logistic data = ad2;
		class htnx(ref = "0") / param = ref;
		model caco ( event = "1") = htnx bmi;
	run;

	/* sex */
	title "sex";
	proc logistic data = ad2;
		class htnx(ref = "0") sex(ref = "0")  / param = ref;
		model caco ( event = "1") = htnx sex;
	run;
	/* apo4car */
	title "apoe";
	proc logistic data = ad2;
		class htnx(ref = "0") apo4car(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx apo4car;
	run;

	/* smkbi */
	title "smkbi ";
	proc logistic data = ad2;
		class htnx(ref = "0") smkbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx smkbi;
	run;

	/* alcohol */
	title "alcohol";
	proc logistic data = ad2;
		class htnx(ref = "0") alcohol(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx alcohol;
	run;

	/* ets */
	title "est";
	proc logistic data = ad2;
		class htnx(ref = "0") ets(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx ets;
	run;
	/* coffeebi */
	title "coffee bi";
	proc logistic data = ad2;
		class htnx(ref = "0") coffeebi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx coffeebi;
	run;

	/* tea */
	title "tea";
	proc logistic data = ad2;
		class htnx(ref = "0") tea(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx tea;
	run;
	/* dm */
	title "dm";
	proc logistic data = ad2;
		class htnx(ref = "0") dmbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx dmbi;
	run;

	/* chol */
	title "cholesterol";
	proc logistic data = ad2;
		class htnx(ref = "0") cholbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx cholbi;
	run;

	/* cvd */
	title "cvd";
	proc logistic data = ad2;
		class htnx(ref = "0") cvdbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx cvdbi;
	run;
	/* ex */
	title "ex";
	proc logistic data = ad2;
		class htnx(ref = "0") ex(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx ex;
	run;

	/* lsr */
	title "lsr";
	proc logistic data = ad2;
		class htnx(ref = "0") lsr(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx lsr;
	run;

	/* corp */
	title " corp";
	proc logistic data = ad2;
		class htnx(ref = "0") corp(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx corp;
	run;

	proc iml;

	crude = 1.952;
	age = abs(2.407 - crude) / crude;
	eduyr = abs(1.984 - crude) / crude;
	bmi = abs(1.974 - crude) / crude;
	sex= abs(2.011 - crude) / crude;
	apoe = abs(1.858 - crude) / crude;
	smkbi = abs(1.933 - crude) / crude;
	alcohol = abs(1.956 - crude) / crude;
	est = abs(2.080 - crude) / crude;
	coffee = abs(1.974 - crude) / crude;
	tea = abs(1.986 - crude) / crude;
	dm = abs(2.006 - crude) / crude;
	chol = abs(1.923 - crude) / crude;
	cvd = abs(1.858 - crude) / crude;
	ex = abs(1.987 - crude) / crude;
	lsr = abs(1.955 - crude) / crude;
	corp = abs(1.986 - crude) / crude;

	print age eduyr bmi sex apoe smkbi alcohol est coffee tea dm chol cvd ex lsr corp;
	quit;











