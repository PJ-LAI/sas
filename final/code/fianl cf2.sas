/* final 10% to select cf */
dm "odsresult" clear;
dm "log" clear;

data data.ad1;
	set ad1;
run;

data ad3;
	set ad1;
	if htn = . then htnx = .;
	else if htn = 1 then htnx = 0;
	else htnx = 1;
run;

proc sort data = ad3;
	by descending htnx descending caco;
run;

proc freq data = ad3 order = data;
	tables htnx * caco / or;
run;

/* crude htnx (e) --> caco (dz) */
title "crude";
	proc logistic data = ad3;
		class htnx(ref = "0") / param = ref;
		model caco ( event = "1") = htnx ;
	run;

	/* age */
	title "age";
	proc logistic data = ad3;
		class htnx(ref = "0") / param = ref;
		model caco ( event = "1") = htnx age ;
	run;

	/* eduyr */
	title "eduyr";
	proc logistic data = ad3;
		class htnx(ref = "0") / param = ref;
		model caco ( event = "1") = htnx eduyr;
	run;

	/* bmi */
	title "bmi";
	proc logistic data = ad3;
		class htnx(ref = "0") / param = ref;
		model caco ( event = "1") = htnx bmi;
	run;

	/* sex */
	title "sex";
	proc logistic data = ad3;
		class htnx(ref = "0") sex(ref = "1")  / param = ref;
		model caco ( event = "1") = htnx sex;
	run;
	/* apo4car */
	title "apoe";
	proc logistic data = ad3;
		class htnx(ref = "0") apo4car(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx apo4car;
	run;

	/* smkbi */
	title "smkbi ";
	proc logistic data = ad3;
		class htnx(ref = "0") smkbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx smkbi;
	run;

	/* alcohol */
	title "alcohol";
	proc logistic data = ad3;
		class htnx(ref = "0") alcohol(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx alcohol;
	run;

	/* ets */
	title "est";
	proc logistic data = ad3;
		class htnx(ref = "0") ets(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx ets;
	run;
	/* coffeebi */
	title "coffee bi";
	proc logistic data = ad3;
		class htnx(ref = "0") coffeebi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx coffeebi;
	run;

	/* tea */
	title "tea";
	proc logistic data = ad3;
		class htnx(ref = "0") tea(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx tea;
	run;
	/* dm */
	title "dm";
	proc logistic data = ad3;
		class htnx(ref = "0") dmbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx dmbi;
	run;

	/* chol */
	title "cholesterol";
	proc logistic data = ad3;
		class htnx(ref = "0") cholbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx cholbi;
	run;

	/* cvd */
	title "cvd";
	proc logistic data = ad3;
		class htnx(ref = "0") cvdbi(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx cvdbi;
	run;
	/* ex */
	title "ex";
	proc logistic data = ad3;
		class htnx(ref = "0") ex(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx ex;
	run;

	/* lsr */
	title "lsr";
	proc logistic data = ad3;
		class htnx(ref = "0") lsr(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx lsr;
	run;

	/* corp */
	title " corp";
	proc logistic data = ad3;
		class htnx(ref = "0") corp(ref = "0")/ param = ref;
		model caco ( event = "1") = htnx corp;
	run;

	proc iml;

	crude = 1.972;
	age = abs(2.361 - crude) / crude;
	eduyr = abs(2.045 - crude) / crude;
	bmi = abs(1.987 - crude) / crude;
	sex= abs(2.045 - crude) / crude;
	apoe = abs(1.936 - crude) / crude;
	smkbi = abs(1.945 - crude) / crude;
	alcohol = abs(1.972 - crude) / crude;
	est = abs(2.004 - crude) / crude;
	coffee = abs(1.977 - crude) / crude;
	tea = abs(2.002 - crude) / crude;
	dm = abs(2.026 - crude) / crude;
	chol = abs(1.943 - crude) / crude;
	cvd = abs(1.881 - crude) / crude;
	ex = abs(2.018 - crude) / crude;
	lsr = abs(1.978 - crude) / crude;
	corp = abs(1.998 - crude) / crude;

	print age eduyr bmi sex apoe smkbi alcohol est coffee tea dm chol cvd ex lsr corp;
	quit;
