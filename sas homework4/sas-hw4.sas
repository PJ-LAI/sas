/* HW4 descriptive epidemiology */
proc import datafile = "C:\Users\User\Desktop\Dataset 2.xlsx"
	dbms = xlsx
	out = work.dataset2
	replace;
run;
/*Q1-1 */
title "Q1-1";
proc gchart data = dataset2;
	vbar year / midpoints = 1980 to 2000 by 1 freq;
run;

/*Q1-2 */
title "Q1-2";

proc gchart data = dataset2;
	vbar year / midpoints = 1980 to 2000 by 1 freq group = hiv patternid =  group;
	pattern1 color = white;
	pattern2 color = black;
run;

/*Q1-3 */
title "Q1-3";
	/* obtaining freq of all year */
	data datayear;
		do year = 1980 to 2001;
			output;
		end;
	run;

	data allyear;
		set dataset2(in = a keep = year) datayear(in= b);
		if a then weight = 1;
		if b then weight = 0;
	run;

	proc freq data = allyear;
		tables year / nopercent nocum out = all_year(drop = percent);
		weight weight / zeros;
	run;
	/* grouping and result*/
	data year1996;
		set all_year;
		if year < 1996 then group = 1;
		else group = 2;
	run;

	proc ttest data = year1996 h0 = 0 alpha = 0.05;
		class group;
		var count;
	run;
/*Q2-1 */
title "Q2-1";
	/* grouping */
	data agegroup;
		 set dataset2;
		 if 10 <= age <= 19 then agegroup = 1;
		 else if age <= 29 then agegroup = 2;
		 else if age <=39 then agegroup = 3;
		 else if age <=49 then agegroup = 4;
		 else if age <=59 then agegroup = 5;
		 else if age <=69 then agegroup = 6;
		 else if age <=79 then agegroup = 7;
		 else if age <=89 then agegroup = 8;
		 else if age <=99 then agegroup = 9;
		 else if age >100 then agegroup = 10;

		 if imt = 1 then immunotherapy = 1;
		 else if imt = 0 then immunotherapy = 0;
	run;

	proc print data = agegroup(obs = 30);
		var age agegroup;
	run;

	/* labeling */
	proc format;
		value agelabel
		1 = "10-19 y/o"
		2 = "20-29 y/o"
		3 = "30-39 y/o"
		4 = "40-49 y/o"
		5 = "50-59 y/o"
		6 = "60-69 y/o"
		7 = "70-79 y/o"
		8 = "80-89 y/o"
		9 = "90-99 y/o"
		10= ">100 y/o";

		value genderlabel
		0 = "male"
		1 = "female";

		value imtlabel
		0 = "without immunotherapy"
		1 = "with immunotherapy";
		
		value cirrhosislabel
		0 = "without cirrhosis"
		1 = "with cirrhosis";
	run;
	/* output */
	proc freq data = agegroup;
		tables gender * agegroup /norow nocol nopercent;
		format gender genderlabel.
			   agegroup agelabel.;
	run;

/*Q2-2 */
title"Q2-3";

	proc freq data = agegroup;
		tables	hiv*gender*agegroup / norow nocol nopercent;
		format gender genderlabel.
					 agegroup agelabel.;
	run;
	
/* Q2-3 */
title "Q2-3";

	/*chi-square */
	proc freq data = agegroup;
		tables hiv*( gender agegroup imt cirrhosis) / nopercent nocol chisq expected fisher;
		format gender genderlabel.
			   agegroup agelabel.
			   imt imtlabel.
			   cirrhosis cirrhosislabel.;
	run;
