dm "log" clear;
dm "odsresult" clear;
/*q4 : use GLMM to estimate propensity score */

	proc glimmix data = frailty;
			class new_id ;
			model mocabi(event = "1") = age gait / dist = binary link = logit solution or (label);
			random intercept / subject = new_id;
			output out = drs predicted = pred_value;
		run;

		data drs2;
			set drs;
			drs = exp(pred_value) / (1 + exp(pred_value));
		run;

		proc glimmix data = drs2;
			class new_id frailtybi (ref = "0");
			model mocabi(event = "1") = frailtybi drs / dist = binary link = logit solution or(label);
			random intercept / subject = new_id;
		run; 
			
		data baseline2;
			set baseline;

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

	
		proc logistic data = baseline2;
			class new_id ;
			model mocabi(event = "1") = agebi ;
			output out = drs predicted = pred_value;
		run;

		data drs2;
			set drs;
			drs = exp(pred_value) / (1 + exp(pred_value));
		run;

		proc logistic data = drs2;
			class frailtybi (ref = "0");
			model mocabi(event = "1") = frailtybi drs ;
		run;
