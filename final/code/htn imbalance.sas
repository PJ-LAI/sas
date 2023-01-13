/* final interaction */
dm "odsresult" clear;
dm "log" clear;


/* agebi */
title "agebi";
	proc sort data = ad5;
		by descending agebi  descending htnbi descending caco;
	run;

	proc freq data = ad5 order = data;
		/* tables agebi * htnbi * caco / or cmh; */
		tables agebi * htnbi / chisq ;
	run;

/* agegp 
title "agegp" ;
	proc sort data = ad5;
		by agegp descending htnbi descending caco ;
	run;
	
	proc freq data = ad5 order = data;
		tables agegp * htnbi * caco / or cmh;
	run; */

/* edubi */
title "edubi";
	proc sort data = ad5 ;
		by descending htnbi descending caco descending edubi;
	run;

	proc freq data = ad5 order = data;
		/*tables edubi * htnbi * caco / or cmh; */
		tables edubi * htnbi / chisq;
	run;

/* bmibi */
title "bmibi";
	proc sort data = ad5;
		by descending bmibi descending htnbi descending caco ;
	run;
	
	proc freq data = ad5 order = data;
		/*tables bmibi * htnbi * caco / or cmh; */
		tables bmibi * htn / chisq;
	run;

/* sex */
title "sex";
	proc sort data = ad5;
		by descending sexbi descending htnbi descending caco ;
	run;
	
	proc freq data = ad5 order = data;
		tables sexbi * htnbi /chisq
	run;
/* apo4car */
title "apo4car";
	proc sort data = ad5;
		by descending apo4car descending htnbi descending caco ;
	run;
	
	proc freq data = ad5 order = data;
		tables apo4car * htnbi / chisq;
	run;

/* smk */
title "smkbi";
	proc sort data = ad5;
		by descending htnbi descending caco descending smkbi;
	run;
	
	proc freq data = ad5 order = data;
		tables smkbi * htnbi / chisq;
	run;

/* alcohol */
title "alcohol";
	proc sort data = ad5;
		by descending htnbi descending caco descending alcohol;
	run;
	
	proc freq data = ad5 order = data;
		tables alcohol * htnbi / chisq;
	run;
/* ets */
title "est";
	proc sort data = ad5;
		by descending htnbi descending caco descending ets;
	run;
	
	proc freq data = ad5 order = data;
		tables ets * htnbi / chisq;
	run;

/* coffeebi */
title "coffee2";
	proc sort data = ad5;
		by descending htnbi descending caco descending coffeebi;
	run;
	
	proc freq data = ad5 order = data;
		tables coffee2 * htnbi / chisq;
	run;

/* tea */
title "tea2";
	proc sort data = ad5;
		by descending htnbi descending caco descending tea;
	run;
	
	proc freq data = ad5 order = data;
		tables tea2 * htnbi / chisq;
	run;

/* dmbi */
title "dmbi";
	proc sort data = ad5;
		by descending htnbi descending caco descending dmbi;
	run;
	
	proc freq data = ad5 order = data;
		tables dmbi* htnbi / chisq;
	run;

/* cholbi */
title "chol2";
	proc sort data = ad5;
		by descending htnbi descending caco descending cholbi;
	run;
	
	proc freq data = ad5 order = data;
		tables chol2 * htnbi / chisq;
	run;

/* cvdbi */
title "cvd2";
	proc sort data = ad5;
		by descending htnbi descending caco descending cvdbi;
	run;
	
	proc freq data = ad5 order = data;
		tables cvd2 * htnbi / chisq;
	run;

/* ex */
title "exbi";
	proc sort data = ad5;
		by descending htnbi descending caco descending exbi;
	run;
	
	proc freq data = ad5 order = data;
		tables exbi * htnbi / chisq;
	run;

/* lsr */
title "lsrbi";
	proc sort data = ad5;
		by descending htnbi descending caco descending lsrbi;
	run;
	
	proc freq data = ad5 order = data;
		tables lsrbi * htnbi /chisq;
	run;

/* corp */
title "corpbi";
	proc sort data = ad5;
		by descending htnbi descending caco descending corpbi;
	run;
	
	proc freq data = ad5 order = data;
		tables corpbi * htnbi / chisq;
	run;

 



	
