/* homework1 */ 
libname hwk1 'C:\Users\Raymond\Desktop\sas code\course2';
title hwk1;
/* hwk1 */
	/* hwk1-1 calculate risk of day30 and day1095 */
	proc freq data = dataset3;
		tables dead30 dead1095 / out = hwK1.hwk1_1;
	run;

	/* hwk1-2 risk if day(10, 100, by = 10) */
		/* grouping */
		data hwk1.hwk1_2;
			set dataset3;

			if dead1095 = 1 then
				if day1095 <= 10 then dead_date = 10;
				else if day1095 <= 20 then dead_date = 20;
				else if day1095 <= 30 then dead_date = 30;
				else if day1095 <= 40 then dead_date = 40;
				else if day1095 <= 50 then dead_date = 50;
				else if day1095 <= 60 then dead_date = 60;
				else if day1095 <= 70 then dead_date = 70;
				else if day1095 <= 80 then dead_date = 80;
				else if day1095 <= 90 then dead_date = 90;
				else if day1095 <= 100 then dead_date = 100;
				else  dead_date = 101;
			else dead_date = 102;
		run;

		/* just to check */
		proc print data = hwk1.hwk1_2;
			var day1095 dead1095 dead_date;
			title "hwk1_2 risk";
		run;

		/* calculate risk */ 
		proc freq data = hwk1.hwk1_2;
			tables dead_date / out = hwk1.hwk1_2_risk outcum;
		run;

		/* plot x = dead date, y = cumulative risk */
		proc gplot data = hwk1.hwk1_2_risk (where = (dead_date));
			plot cum_pct * dead_date / haxis = axis1 vaxis = axis2;
			axis1
				label = ("days after diagnosed")
				order = (10 to 100 by 10);
			axis2
				label = ("percentage of risk")
				order = (0 to 100 by 5);
			symbol
				interpol = steplj
				line = 1
				width = 1.5
				color = blue
				value = dot;
			title "Risk of MRSA patients during 100 days after diagnosed";
		run;
		quit;
title hwk2;
/* hwk2*/
	/*hwk2-1 calculate incident rate in day30 and day1095 */
	proc sql;
		select sum(dead30) / sum(day30) as IR30,
			   sum(dead1095) /sum(day1095) as IR1095
		from dataset3;
	quit;

	/* hwk2-2 calculate incident rate in day30, day30-60, day60-90 */
		/* IR-0-30-60-90 */
		data hwk1.IR0_30_60_90;
			set dataset3;
			
			if day1095 <=30 and dead1095 = 1 then dead0_30 = 1;
			else dead0_30 = 0;

			if 30 < day1095 <= 60 and dead1095 = 1 then dead30_60 = 1;
			else dead30_60 = 0;

			if 60 < day1095 <= 90 and dead1095 = 1 then dead60_90 = 1;
			else dead60_90 = 0;

			if day1095 > 30 then day0_30 = 30;
			else day0_30 = day1095 ;

			if day1095 > 60 then day30_60 = 30;
			else if 30 < day1095 <= 60 then day30_60 = (day1095 - 30);
			else day30_60 = 0; 

			if day1095 > 90 then day60_90 = 30;
			else if 60 < day1095 <= 90 then day60_90 = (day1095 - 60);
			else day60_90 = 0;
		run; 
		/* just to check */
			proc print data = hwk1.ir0_30_60_90;
				var day1095 dead0_30 dead30_60 dead60_90 day0_30 day30_60 day60_90;
			run;
		/* results */
		proc sql; 
			select sum(dead0_30) / sum(day0_30) as IR0_30,
				   sum(dead30_60) / sum(day30_60) as IR30_60,
				   sum(dead60_90) / sum(day60_90) as IR60_90
			from hwk1.ir0_30_60_90; 
		quit;
title hwk3;
/* hwk3 */
	/* hwk3-1 calculate and plot Kaplan-Meier survival curve of MRSA patients */
	proc lifetest data = dataset3 plots = (s) method = KM;
		time dayfinal * deadfinal(0) ;
		title "survival curve";
	run; 
	
	/* hwk3-2 cumulative risk of competing risk */
		/* grouping */
		data hwk1.hwk3_2;
			set dataset3;

			if deadfinal = 1 then
				if MRSA_relateddeath = 1 then deadstatus = 1;
				else deadstatus = 2;
			else deadstatus = 0;
		run;

		/* just to check */
		proc print data = hwk1.hwk3_2;
			var deadfinal MRSA_relateddeath deadstatus;
		run;

		/* plotting cumulative risk curve */ 
		proc lifetest data = hwk1.hwk3_2 plots = CIF outcif = MRSA_nonMRSA; 
			time dayfinal * deadstatus(0) / eventcode = 1;
			time dayfinal * deadstatus(0) / eventcode = 2;
		run;









		

