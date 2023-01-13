/* howework 3 */
/* Q1 */
	/* Q1-1 : AGE <- t-test */
	title Q1_1;

	proc ttest data = dataset1;
		class regimen;
		var age;
	run;
	
		/* extra: check if age is in normal distribution */
		proc univariate data = dataset1 normal plot;
			var age; 
		run; /* actually not in norm, but we have big data (300 > 30), can ignore

		/* if there's small sample and not in norm -> Mann-Whitney U test */
		proc npar1way data = dataset1;
			class regimen;
			var age;
		run;
	/* Q1-2 : HBV <- chi-square */
	title Q1_2;
	proc freq data = dataset1;
		tables regimen * hbv / chisq;
	run;

	/* Q1-3 : */
	title Q1_3;
	proc freq data = dataset1;
		tables regimen * hcv / chisq;
	run;
	/* Q1-4 : */
	title Q1_4;
	proc freq data = dataset1;
		tables regimen * GPT_UNL / chisq;
	run;
/* Q2 */
	/* Q2-1 primary endpoint by intetion=to-treat*/
		title Q2_1;
		data primary;
			set dataset1;

			if endpoint - dropout = 1 then primary = 1;
			else primary = 0;
		run;

		proc print data = primary;
		run;
		/* chisqure + risk difference */
		proc freq data = primary;
			tables regimen * primary / chisq riskdiff;
		run;
		/* chisquare + risk ratio */
		proc freq data = primary;
			tables regimen * primary / chisq relrisk (equal column = 2);
		run;
		/* chisquare + odd ratio */
		proc freq data = primary;
			tables regimen * primary / chisq OR;
		run;

	/* Q2-2 primary endpoint by efficacy analysis */
		title Q2_2;
		data primary_efficacy;
			set dataset1;

			if dropout = 1 then delete;

			if endpoint = 1 then primary = 1;
			else primary = 0;

		run;
		proc print data = primary_efficacy;
		run;
		proc freq data = primary_efficacy;
			tables regimen * primary / chisq riskdiff;
		run;
	/* Q2-3 secondary endpoint by intention-to-treat */
		title Q2_3;
		proc freq data = dataset1;
			tables regimen * endpoint / chisq riskdiff;
		run;

	/* Q2-4 secondary endpoint by efficacy analysis */
		title Q2_4;
		data secondary_efficacy;
			set dataset1;

			if dropout = 1 then delete;

			if endpoint = 1 then secondary = 1;
			else secondary = 0;
		run;
		proc print data = secondary_efficacy;
		run;

		proc freq data = secondary_efficacy;
			tables regimen * secondary / chisq riskdiff;
		run;
	

