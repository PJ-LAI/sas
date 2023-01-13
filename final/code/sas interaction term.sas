dm "odsresult" clear;
dm "log" clear;
/*title "age in continuous";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi age edubi sexbi apo4car exbi corpbi;
	run;
	title "agegp * htnbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi edubi sexbi apo4car exbi corpbi htnbi * agegp;
	run;
	title "stratified by agegp";
	proc sort data = ad5;
		by agegp;
	run;
	proc logistic data = ad5;
		by agegp;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi edubi sexbi apo4car exbi corpbi;
	run; 

	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi age edubi sexbi apo4car exbi corpbi  htnbi * age ;
	run; */

	title "htnbi * edubi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi htnbi * edubi;
	run;

title "htnbi * sexbi ";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi htnbi * sexbi;
	run;

title "htnbi * apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi htnbi * apo4car;
	run;

title "htnbi * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi htnbi * exbi;
	run;

title "htnbi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi htnbi * corpbi;
	run;

title "agegp * edubi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi agegp * edubi;
	run;

title "agegp * sexbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi agegp * sexbi;
	run;

title " agegp * apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi agegp * apo4car;
	run;

title "agegp * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi agegp * exbi;
	run;

title "agegp * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi agegp * corpbi;
	run;

title "edubi * sexbi ";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi edubi * sexbi;
	run;

title "edubi * apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi edubi * apo4car;
	run;
 
title "edubi * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi edubi * exbi;
	run;

title "edubi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi edubi * corpbi;
	run;

title "sexbi * apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi sexbi * apo4car;
	run;

title "sexbi * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi sexbi * exbi;
	run;

title "sexbi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi sexbi * corpbi;
	run;

title "apo4car * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi apo4car * exbi;
	run;

title "apo4car * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi apo4car * corpbi;
	run;

title " exbi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agegp(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi agegp edubi sexbi apo4car exbi corpbi exbi * corpbi;
	run;
	

	

title "edubi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi edubi sexbi apo4car exbi corpbi htnbi * edubi;
	run;

title "sexbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi edubi sexbi apo4car exbi corpbi htnbi * sexbi;
	run;

title "apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi edubi sexbi apo4car exbi corpbi htnbi * apo4car;
	run;

title "exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi edubi sexbi apo4car exbi corpbi htnbi * exbi;
	run;

title "corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi edubi sexbi apo4car exbi corpbi htnbi * corpbi;
	run; 
