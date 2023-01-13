/* hw5 cohort study */
dm "odsresult" clear;
dm "log" clear;
proc import datafile = "C:\Users\Raymond\Desktop\sas data\Dataset 4.xlsx"
	dbms = xlsx
	out = work.dataset4
	replace;
run;

	/* q1 : odd ratio */
	title "q1";

	proc sort data = dataset4 out = dataset4_sorted;
		by descending case descending contIV_24H;
	run;

	proc freq data = dataset4_sorted order = data;
		tables case*contIV_24h / nopercent nocol OR chisq;
	run;

	proc logistic data = dataset4;
		class contiv_24h(ref = "0")/ param = ref;
		model case(event = "1") = contiv_24h;
	run;

	/* q2 : logistic regression */
		title "q2-1";
		/* no selection */
		proc logistic data = dataset4;
			class case(ref = "0") 
				  contiv_24h(ref = "0") 
				  gender(ref = "0") 
	        	  VAR6(ref = "0") 
				  service(ref = "0") 
				  site(ref = "0") / param = ref;
			model case = contiv_24h gender VAR6 service site;
		run;
		title "q2-2";
		/* stepwise selection */
		proc logistic data = dataset4;
			class case(ref = "0") 
				  contiv_24h(ref = "0") 
				  gender(ref = "0") 
			      VAR6(ref = "0") 
				  service(ref = "0") 
				  site(ref = "0") / param = ref;
			model case = contiv_24h gender VAR6 service site/
			selection = stepwise
			slentry = 0.15
			slstay = 0.15
			details;
		run;

	/* q3 : conditional logistic regression */
		title "q3-1";
		/* no selection */
		proc logistic data = dataset4;
			class case(ref = "0") 
				  contiv_24h(ref = "0") 
				  gender(ref = "0") 
	        	  VAR6(ref = "0") 
				  service(ref = "0") 
				  site(ref = "0") / param = ref;
			model case = contiv_24h gender VAR6 service site;
			strata strata;
		run;
		title "q3-2";
		/* stepwise selection */
		proc logistic data = dataset4;
			class case(ref = "0") 
				  contiv_24h(ref = "0") 
				  gender(ref = "0") 
			      VAR6(ref = "0") 
				  service(ref = "0") 
				  site(ref = "0") / param = ref;
			model case = contiv_24h gender VAR6 service site/
			selection = stepwise
			slentry = 0.15
			slstay = 0.15
			details;
			strata strata;
		run;
	
