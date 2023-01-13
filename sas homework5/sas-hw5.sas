
/* hw5 cohort study */
dm "odsresult" clear;
dm "log" clear;
proc import datafile = "C:\Users\Raymond\Desktop\sas data\Dataset 3.xlsx"
	dbms = xlsx
	out = work.dataset3
	replace;
run;
/* Q1 risk ratio of two groups*/
title "Q1";
/* create legal dataset */
	data q1;
		set dataset3;
		if day30 <= 1 then delete;
	run;

/* sort data */
	proc sort data = q1;
		by descending tx48 descending dead30; /* descendingly sort, first sort tx48, then sort dead30 */ 
	run;

/* calculate relrisk */

	proc freq data = q1 order= data; /* to sort in order of data */
		tables tx48*dead30/ nopercent nocol chisq relrisk (equal cl = wald);
	run;

/* Q2 induction time , rate ratio */

	/* induction time = 1 */
	title "q2-1" ;
	ods trace on;
	ods output  ParameterEstimates = para_induct1;
	data induct1;
		set q1;
		if tx48 = 1 and day30 = 2 then delete;

		if tx48 = 1 then pt = day30 - 2;
		else if tx48 = 0 then pt = day30 - 1;

		logpt = log(pt);

		keep id tx48 day30 dead30 pt logpt;
	run;
 
	proc genmod data = induct1;
		class dead30(ref = "0") tx48 (ref = "0"); 
		model dead30 = tx48 / dist = poisson link = log offset = logpt;
		
		estimate "incident rate for tx48= 1" intercept 1 tx48 1 0;
		estimate "incident rate for tx48 = 0" intercept 1 tx48 0 1;

	run;
	ods trace off;

	data rr_induct1;
		set para_induct1;

		if parameter = "Tx48" and level1 = "1";

		rr = exp(estimate);
		rr_lower = exp(lowerwaldcl);
		rr_upper = exp(upperwaldcl);
		
		keep rr rr_lower rr_upper;
	run;

	proc print
		data = rr_induct1;
	run;

	/* induction time = 2 */
	title "q2-2" ;
	ods trace on;
	ods output  ParameterEstimates = para_induct2;
	data induct2;
		set q1;
		if tx48 = 1 and day30 <= 3 then delete;

		if tx48 = 1 then pt = day30 - 3;
		else if tx48 = 0 then pt = day30 - 1;

		logpt = log(pt);

		keep id tx48 day30 dead30 pt logpt;
	run;
 
	proc genmod data = induct2;
		class dead30(ref = "0") tx48 (ref = "0"); 
		model dead30 = tx48 / dist = poisson link = log offset = logpt;
		
		estimate "incident rate for tx48= 1" intercept 1 tx48 1 0;
		estimate "incident rate for tx48 = 0" intercept 1 tx48 0 1;

	run;
	ods trace off;

	data rr_induct2;
		set para_induct2;

		if parameter = "Tx48" and level1 = "1";

		rr = exp(estimate);
		rr_lower = exp(lowerwaldcl);
		rr_upper = exp(upperwaldcl);
		
		keep rr rr_lower rr_upper;
	run;

	proc print
		data = rr_induct2;
	run;

	/* induction time = 3 */
	title "q2-3" ;
	ods trace on;
	ods output  ParameterEstimates = para_induct3;
	data induct3;
		set q1;
		if tx48 = 1 and day30 <= 4  then delete;

		if tx48 = 1 then pt = day30 - 4;
		else if tx48 = 0 then pt = day30 - 1;

		logpt = log(pt);

		keep id tx48 day30 dead30 pt logpt;
	run;
 
	proc genmod data = induct3;
		class dead30(ref = "0") tx48 (ref = "0"); 
		model dead30 = tx48 / dist = poisson link = log offset = logpt;
		
		estimate "incident rate for tx48= 1" intercept 1 tx48 1 0;
		estimate "incident rate for tx48 = 0" intercept 1 tx48 0 1;

	run;
	ods trace off;

	data rr_induct3;
		set para_induct3;

		if parameter = "Tx48" and level1 = "1";

		rr = exp(estimate);
		rr_lower = exp(lowerwaldcl);
		rr_upper = exp(upperwaldcl);
		
		keep rr rr_lower rr_upper;
	run;

	proc print
		data = rr_induct3;
	run;
	

/* q3 survival curve */
	title "q3";
	proc lifetest data = q1 plots = (s) method = km;
		strata tx48;
		time day30*dead30(0);
	run;
		
