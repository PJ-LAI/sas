dm "odsresult" clear;
dm "log" clear;
	data ad5;
		set ad5;

		if agegp = . then agegp1 = .;
		else if agegp = 0 then agegp1 = 0;
		else if agegp = 1 then agegp1 = 1;
		else if agegp = 2 then agegp1 = 2;
		else agegp1 = 3;
	run;
	title "stratified by agegp";
	proc sort data = ad5;
		by agegp1 descending htn1 descending caco;
	run;
	proc freq data = ad5 order = data;
		tables agegp1 * htn1 * caco / or cmh;
	run;
	proc logistic data = ad5;
		by agegp1;
		class 	htn1(ref = "0")
				    edubi(ref = "0") cholbi (ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htn1 edubi sexbi apo4car exbi corpbi cholbi sexbi * exbi;
	run; 

	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi age edubi sexbi apo4car exbi corpbi  htnbi * age ;
	run; 
	title "htnbi * agebi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi htnbi * agebi;
	run;
	title "htnbi * edubi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi htnbi * edubi;
	run;

title "htnbi * sexbi ";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi htnbi * sexbi;
	run;

title "htnbi * apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi htnbi * apo4car;
	run;

title "htnbi * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi htnbi * exbi;
	run;

title "htnbi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi htnbi * corpbi;
	run;

title "agebi * edubi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi agebi * edubi;
	run;

title "agebi * sexbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi agebi * sexbi ;
	run;

title " agebi * apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi agebi * apo4car;
	run;

title "agebi * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi agebi * exbi;
	run;

title "agebi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi agebi * corpbi;
	run;

title "edubi * sexbi ";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi edubi * sexbi;
	run;

title "edubi * apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi edubi * apo4car;
	run;
 
title "edubi * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi edubi * exbi;
	run;

title "edubi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi edubi * corpbi;
	run;

title "sexbi * apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi sexbi * apo4car;
	run;

title "sexbi * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi sexbi * exbi;
	run;

title "sexbi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi sexbi * corpbi;
	run;

title "apo4car * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi apo4car * exbi;
	run;

title "apo4car * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi apo4car * corpbi;
	run;

title " exbi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi exbi * corpbi;
	run;
	

	



	title "cholbi * agebi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi cholbi * agebi;
	run;
	title "cholbi * edubi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi cholbi * edubi;
	run;

title "cholbi* sexbi ";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi cholbi * sexbi;
	run;

title "cholbi* apo4car";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi cholbi * apo4car;
	run;

title "cholbi * exbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi cholbi* exbi;
	run;

title "cholbi * corpbi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi cholbi* corpbi;
	run;

	title "cholbi * htnbibi";
	proc logistic data = ad5;
		class 	htnbi(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htnbi cholbi agebi edubi sexbi apo4car exbi corpbi cholbi* htnbi;
	run;

	proc logistic data = ad5;
		class 	htn1(ref = "0") cholbi(ref = "0")
				    agebi(ref = "0") edubi(ref = "0")
					sexbi(ref = "0") apo4car(ref = "0")
					exbi(ref = "0") corpbi(ref = "0")/ param = ref;
		model caco (event =  "1") = htn1 cholbi agebi edubi sexbi apo4car exbi corpbi sexbi* agebi sexbi * exbi;
	run; */

