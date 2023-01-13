/* final 10% to select cf */
dm "odsresult" clear;
dm "log" clear;

/* crude htnbi (e) --> caco (dz) */
title "crude";
	proc logistic data = ad5;
		class htnbi(ref = "0") / param = ref;
		model caco ( event = "1") = htnbi ;
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










