dm "odsresult" clear;
dm "log" clear;

data ad5;
	set data.ad5;
run;
/* final selection */

		proc logistic data = ad5;
			class caco ( ref = "0")
			agebi (ref = "0")
			htn1 ( ref = "0")
			bmibi (ref = "0")
			sexbi( ref = "0")
			edubi(ref = "0")
			apo4car(ref = "0")
			smkbi(ref = "0")
			alcohol(ref = "0")
			ets(ref = "0")
			coffee2(ref = "0")
			tea2(ref = "0")
			dmbi( ref = "0")
			cholbi(ref = "0")
			cvdbi( ref = "0")
			exbi(ref = "0")
			lsrbi(ref = "0")
			corpbi(ref = "0")/ param = ref;

			model caco(event = "1")  = htn1 agebi edubi bmibi sexbi apo4car smkbi alcohol ets coffee2 tea2 dmbi cholbi cvdbi exbi lsrbi corpbi /
			selection = stepwise
			slentry = 0.15
			slstay = 0.15;
		run;
proc sort data = ad5;
by agegp;
run;
proc univariate data = ad5;
	by agegp;
	var age;
run;
proc sort data = ad5;
	by descending htn1 descending caco;
run;

proc freq data = ad5 order = data;
	tables htn1 * caco / or;
run;
