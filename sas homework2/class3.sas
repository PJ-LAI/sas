/* hwk2 */
libname class3 "C:\Users\Raymond\Desktop\sas code\course3";
/* Q1 */
	/* Q1-1 RISK and RATE */
	title Q1_1 ;		
		/* grouping */
		data class3._150;
			set dataset1;
			
			if comday <= 150 then 
				if endpoint = 1 then event150 = 1;
				else event150 = 0;
			else event150 = 0;

			if comday <= 150 then
				if endpoint = 1 then day150 = comday;
				else day150 = comday;
			else day150 = 150;
		run;
		/* just to check */ 
		proc print data = class3._150;
			var regimen endpoint comday event150 day150;
		run;
		/* calculating risk and rate */
		proc sql;
			create table class3.IR150 as 

			select 
			regimen,
			sum(endpoint) / count(ID) as risk_final,
			sum(event150) / sum(day150) as rate_150

			from class3._150
			group by regimen;
		quit;
		proc print data = class3.IR150;
		run;
	/* Q1-2 risk difference of inh and rmp */
	title Q1_2 ;
		proc freq data = dataset1;
			table endpoint * regimen / norow nopercent chisq ;
		run;

	/* Q1-3 rate ratio of inh and rmp */
		data class3.data_poisson;
			set class3._150;
			ln_day = log(day150);
		run;

		proc genmod data = class3.data_poisson;
			class regimen(ref = "2" param = ref);
			model event150 = regimen / d = poisson offset = ln_day;
			estimate "rate ratio" regimen 1;
			lsmeans regimen / diff exp cl;
		run;  

/* Q2 */
	/* creating data for proc stdrate*/
		proc sql;
			create table class3.data_af as
			select
				sum(case when regimen = 1 then endpoint else . end) as INH_E,
				count(case when regimen = 1 then ID else . end) as INH_count,
				sum(case when regimen = 2 then endpoint else . end) as RMP_E,
				count(case when regimen = 2 then ID else . end) as RMP_count
			from dataset1;
		quit;

	/* Calculating attibutable fraction */
		proc stdrate data  = class3.data_af
			refdata = class3.data_af
			method = indirect(af)
			stat = risk
			plots = risk;

			population event = INH_E total = INH_count;
			reference event = RMP_E total = RMP_count;
		run;


		
	

		
