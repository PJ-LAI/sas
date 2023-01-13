dm "odsresult" clear;
dm "log" clear;

libname data "\\Mac\Home\Desktop\SAS\sas data";

data hw11;
	set data.frailty_cognition_longdata;
run;
	/*q2 :  generalized model : frailiry status ( e ) --> moca ( dz ) */
		title "q2 unadjusted";
		data frailty;
			set hw11;

			if mocasco = . then mocabi = .;
			else if mocasco >= 24 then mocabi = 0;
			else mocabi = 1;

			if frailty_gp3 = . then frailtybi = .;
			else if frailty_gp3 = 0 then frailtybi = 0;
			else frailtybi = 1;

			if htn = . then htnbi = .;
			else if htn = 0 then htnbi = 0;
			else htnbi = 1;

			if dm = . then dmbi = .;
			else if dm = 0 then dmbi = 0;
			else dmbi = 1;

			if chol = . then cholbi = .;
			else if chol = 0 then cholbi = 0;
			else cholbi = 1;
		run;
		proc freq data = frailty;
			tables frailty_gp3 * frailtybi;
		run;
		proc glimmix data = frailty;
			class new_id frailtybi(ref = "0");
			model mocabi(event = "1") = frailtybi / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run; 
		/*q2 : use 10% rule to decide cf to put in model */
		/* age */
		title "q2 adjust age";

		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0");
			model mocabi(event = "1") = frailtybi age / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;
		/* sex */
		title "agjust sex";
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0") sex(ref = "1");
			model mocabi(event = "1") = frailtybi sex / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;

		/*APOE status */
		title "adjust apoe ";
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0") apo4car(ref = "0");
			model mocabi(event = "1") = frailtybi apo4car / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;

		/* cesdsco */
		title "adjust cesdsco";
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0");
			model mocabi(event = "1") = frailtybi cesdsco / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;

		/* alcohol */
		title "adjust alcohol";
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0") alcohol(ref = "0");
			model mocabi(event = "1") = frailtybi alcohol / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;

		/* gait */
		title "adjust gait";
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0");
			model mocabi(event = "1") = frailtybi gait / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;

		/* htn */
		title "adjsut htnbi";
		proc glimmix data = frailty;
			class new_id frailtybi  (ref = "0") htnbi(ref = "0");
			model mocabi(event = "1") = frailtybi htnbi / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;

		/* dm */
		title "adjust dm";
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0") dmbi(ref = "0");
			model mocabi(event = "1") = frailtybi dmbi/ dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;

		/* chol */
		title "adjust chol";
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0") cholbi(ref = "0");
			model mocabi(event = "1") = frailtybi cholbi / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run;  

		proc iml;
			crude1 = 2.11;
			age1 = abs(1.51 - crude1) / crude1;
			sex1 = abs(2.12 - crude1) / crude1;
			apo1 = abs(2.12 - crude1) / crude1;
			cesd1 = abs(2.14 - crude1) / crude1;
			alco1 = abs(2.11 - crude1) / crude1;
			gait1 = abs(1.11 - crude1) / crude1;
			htn1 = abs(2.08 - crude1) / crude1;
			dm1 = abs(2.13 - crude1) / crude1;
			chol1 = abs(2.06 - crude1) / crude1;
			print age1 sex1 apo1 cesd1 alco1 gait1 htn1 dm1 chol1;
		quit;
		/* model 1 moca ~ frailty + age + gait */
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0") ;
			model mocabi(event = "1") = frailtybi  age gait  / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run; 

		/* model 2 moca ~ frailty + age + gait + sex +  apo4car + cesdsco */
		proc glimmix data = frailty;
			class new_id frailtybi (ref = "0") sex (ref = "1") apo4car (ref = "0") ;
			model mocabi(event = "1") = frailtybi  age gait  sex apo4car cesdsco/ dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run; 

		
