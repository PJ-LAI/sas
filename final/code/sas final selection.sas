dm "odsresult" clear;
dm "log" clear;
/* final selection */

data ad5;
	set ad4;
	if sex = . then sexbi = .;
	else if sex = 1 then sexbi = 0;
	else sexbi = 1;

	if ex = . then exbi = .;
	else if ex = 1 then exbi = 0;
	else exbi = 1;

	if lsr = . then lsrbi = .;
	else if lsr = 1 then lsrbi = 0;
	else lsrbi = 1;

	if corp = . then corpbi = .;
	else if corp = 1 then corpbi = 0;
	else corpbi = 1;
run;
proc sort data = ad5;
	by agegp;
run;

	proc logistic data = ad5;
			by agegp;
			class caco ( ref = "0")
			htnx ( ref = "0")
			sexbi( ref = "0")
			apo4car(ref = "0")
			smkbi(ref = "0")
			alcohol(ref = "0")
			ets(ref = "0")
			coffeebi(ref = "0")
			tea(ref = "0")
			dmbi( ref = "0")
			cholbi(ref = "0")
			cvdbi( ref = "0")
			exbi(ref = "0")
			lsrbi(ref = "0")
			corpbi(ref = "0")/ param = ref;

			model caco(event = "1")  = htnx eduyr bmi sexbi apo4car smkbi alcohol ets coffeebi tea dmbi cholbi cvdbi exbi lsrbi corpbi /
			selection = stepwise
			slentry = 0.15
			slstay = 0.15;
		run;

		proc logistic data = ad5;
			class caco ( ref = "0")
			htnx ( ref = "0")
			agebi( ref = "0")
			sexbi( ref = "0")
			apo4car(ref = "0")
			smkbi(ref = "0")
			alcohol(ref = "0")
			ets(ref = "0")
			coffeebi(ref = "0")
			tea(ref = "0")
			dmbi( ref = "0")
			cholbi(ref = "0")
			cvdbi( ref = "0")
			exbi(ref = "0")
			lsrbi(ref = "0")
			corpbi(ref = "0")/ param = ref;

			model caco(event = "1")  = htnx agebi eduyr bmi sex apo4car smkbi alcohol ets coffeebi tea dmbi cholbi cvdbi exbi lsrbi corpbi /
			selection = stepwise
			slentry = 0.15
			slstay = 0.15;
		run;

		proc logistic data = ad5;
			class caco ( ref = "0")
			htnbi ( ref = "0")
			sexbi( ref = "0")
			edubi(ref = "0")
			apo4car(ref = "0")
			smkbi(ref = "0")
			alcohol(ref = "0")
			ets(ref = "0")
			coffee2(ref = "0")
			tea2(ref = "0")
			dmbi( ref = "0")
			chol2(ref = "0")
			cvd2( ref = "0")
			exbi(ref = "0")
			lsrbi(ref = "0")
			corpbi(ref = "0")/ param = ref;

			model caco(event = "1")  = htnbi age edubi bmi sexbi apo4car smkbi alcohol ets coffee2 tea2 dmbi chol2 cvd2 exbi lsrbi corpbi /
			selection = stepwise
			slentry = 0.15
			slstay = 0.15;
		run;
