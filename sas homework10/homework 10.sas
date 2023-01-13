/* homework 10 */
dm "odsresult" clear;
dm "log" clear;
/* import data of sasdataset*/
libname data "\\Mac\Home\Desktop\";

/* q1 : effect-measure modification ,  E1 ( women),  DZ( AD) , stratified by APOE status*/
title "q1";
	data ad;
		set data.ad_dataset_new;
	run;
	/* Risk difference */
	proc sort data = ad;
		by apo4car sex descending caco;
	run;

	proc freq data = ad order = data;
		tables apo4car * sex * caco / or nocol nopercent cmh;
	run;

	proc iml;
		rr_nonAPOEe4 = 1.3265;
		rr_APOEe4 = 1.2929;
		rr_diff = rr_APOEe4 - rr_nonAPOEe4;
		
		print rr_nonAPOEe4 rr_APOEe4 rr_diff;
	run;
	/* Rate difference */
		proc iml;
		rr_nonAPOEe4 = 1.3265;
		rr_APOEe4 = 1.2929;
		rr_ratio = rr_APOEe4 / rr_nonAPOEe4;
		
		print rr_nonAPOEe4 rr_APOEe4 rr_ratio;
	quit;

/* q2 : statistical interaction, Logistic regression */
	title "q2";
	data q2;
		set ad;
		if apo4car = 1 and sex = 0 then group = "AB";
		else if apo4car = 1 and sex = 1 then group = "B";
		else if apo4car = 0 and sex = 0 then group = "A" ;
		else if apo4car = 0 and sex = 1 then group = "U";
	run;
	proc print data = q2;
		var apo4car sex group;
	run;

	proc logistic data = q2;
		class group (ref = "U") / param = ref;
		model caco (event = "1") = group;
	run;

	proc iml;
		rr_a = 1.326;
		rr_b = 3.495;
		rr_ab = 4.518;
		diff = rr_ab - (rr_a * rr_b);
		percent_diff = abs(diff) / rr_ab;

		print rr_a rr_b rr_ab diff percent_diff;
	quit;

	/* unadjusted model */
	proc logistic data = q2;
		class group (ref = "U") / param = ref;
		model caco ( event = "1") = apo4car sex apo4car * sex;
	run;

	/* adjusted model */
	proc logistic data = q2;
		class apo4car (ref = "0") sex ( ref = "1") / param = ref;
		model caco (event =  "1") = apo4car sex apo4car * sex age eduyr;
	run;

	proc logistic data = q2;
		class apo4car (ref = "0") sex ( ref = "1") / param = glm;
		model caco (event =  "1") = apo4car sex apo4car * sex;
		lsmeans apo4car * sex / diff oddsratio;
	run;

/* q3 : biological interaction */
title "q3" ;
proc iml;
	rr_a = 1.326;
	rr_b = 3.495;
	rr_ab = 4.518;
	diff = (rr_ab - 1) - ((rr_a - 1) + (rr_b - 1));
	percent_diff = abs(diff) / rr_ab;
	
	print rr_a rr_b rr_ab diff percent_diff;
quit;

		
