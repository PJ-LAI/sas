/* hw7 bias (systemic error) */
dm "odsresult" clear;
dm "log" clear;
/* creating data */
data crude;
	input oc$ group$ count;
	datalines;
		user case 12
		user control 53
		non_user case 30
		non_user control 347
	;
run;

proc print data = crude;
run;

/* q1 : crude analysis */
title "q1 crude analysis";

proc freq data = crude order = data;
	tables oc * group / chisq or;
	weight count;
run;

/* q2 : stratified analysis */
title "q2 stratified analysis";
/* creating data */
data stratified;
	input age$ oc$ group$ count;
	datalines;
		20_29 user case 10
		20_29 user control 39
		20_29 non_user case 18
		20_29 non_user control 158
		30_39 user case 2
		30_39 user control 14
		30_39 non_user case 12
		30_39 non_user control 189
	;
run;

proc print data = stratified;
run;

proc sort data = stratified;
	by age;
run;

	/* stratum-specific odd ratio */
	title "q2-a";

	proc freq data = stratified order = data;
		tables oc * group / chisq or cmh;
		weight count;
		by age;
	run;

	proc freq data = stratified order = data;
		tables age * oc * group / chisq or cmh ;
		weight count;
	run;
	/* (b) compare the result with that of crude analysis */
	/* (c) is age a confounder ? */
		/* 10% rule :  (cOR - aOR) / cOR > 10%? aOR = adjusted OR or stratified OR
/* q3 : CF --> E  */
title "q3 cf --> e";

	/* creating data */
	data cf_e;
		input age$ oc$ count;
		datalines;
			20_29 user 39
			20_29 non_user 158
			30_39 user 14
			30_30 non_user 189
		;
	run;

	proc print data = cf_e;
	run;

	/*q3 (a) odd ratio */
	proc freq data = cf_e order = data;
		tables age * oc / chisq or;
		weight count;
	run;
	
/* q4 : cf_dz*/
title "q4 cf_dz ";
	
	/* creating data */ 
	data cf_dz;
		input age$ group$ count;
		datalines;
			20_29 case 28
			20_29 control 197
			30_39 case 14
			30_39 control 203
		;
	run;

	proc print data = cf_dz;
	run;

	/* odd ratio */
	proc freq data = cf_dz order = data;
		tables age * group / chisq or;
		weight count;
	run;

	
