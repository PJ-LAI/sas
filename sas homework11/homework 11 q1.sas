dm "odsresult" clear;
dm "log" clear;

libname data "\\Mac\Home\Desktop\SAS\sas data";
data hw11;
	set data.frailty_cognition_longdata;
run;

/* homework 11 -- cohort study*/
	/*q1 :  demostrate distribution of variables */
		data baseline;
			set hw11;
			if fu = 0;
		run;
		/* continuous : age, edu_yr, cesdsco */
		title "univarible grouped by frailty groups";
		proc means data = baseline maxdec = 1;
			class frailty_gp3;
			var age edu_yr cesdsco;
		run;
		title " age in frailty";
		proc anova data = baseline;
			class frailty_gp3;
			model age = frailty_gp3;
			means frailty_gp3 / bon; /* bonferroni correction */
		run;
		quit;
		title "eduyr in frailty";
		proc anova data = baseline;
			class frailty_gp3;
			model edu_yr = frailty_gp3;
			means frailty_gp3 / bon; /* bonferroni correction */
		run;
		quit;
		title "cesdsco in frailty";
		proc anova data = baseline;
			class frailty_gp3;
			model cesdsco = frailty_gp3;
			means frailty_gp3 / bon; /* bonferroni correction */
		run;
		quit;

		/* category variables sex, apo4car */
		title "sex and apoe in frailty";
		proc freq data = baseline;
			tables frailty_gp3 * sex / nopercent nocol chisq;
			tables frailty_gp3 * apo4car / nopercent nocol chisq;
		run;

	/* q1-2 grouped by mocasco */
		data baseline2;
			set baseline;

			if mocasco = . then mocabi = .;
			else if mocasco >= 24 then mocabi = 0;
			else mocabi = 1;

			if htn = . then htnbi = .;
			else if htn = 0 then htnbi = 0;
			else htnbi = 1;
		run;

		/* continuous : age, edu_yr, cesdsco */
		title "univarible grouped by mocabi";
		proc means data = baseline2 maxdec = 1;
			class mocabi;
			var age edu_yr cesdsco;
		run;
	
		proc ttest data = baseline2;
			class mocabi;
			var age edu_yr cesdsco;
		run;

		/* category variables sex, apo4car */
		title "sex and apoe in moca";
		proc freq data = baseline2;
			tables mocabi * sex / nopercent nocol chisq;
			tables mocabi * apo4car / nopercent nocol chisq;
		run;
