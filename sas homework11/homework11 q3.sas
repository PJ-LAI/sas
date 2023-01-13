dm "odsresult" clear;
dm "log" clear;
/*q3 : use GLMM to perform stratified analysis by sex, age, group, and APOE status at baseline */
		/* sex */
		title "q3 stratified by sex";
		proc sort data = baseline2;
			by sex;
		run;

		proc glimmix data = baseline2 order = data;
			by sex;
			class new_id frailty_gp3(ref = "0");
			model mocabi(event = "1") = frailty_gp3 / dist = binary link = logit solution or(label);
		run;

		/* age */
		title "q3 stratified by age";

		data baseline3;
			set baseline2;

			if age = . then agebi = .;
			else if age <= 74 then agebi = 0;
			else agebi = 1;
		run;

		proc sort data = baseline3;
			by agebi;
		run;

		proc glimmix data = baseline3 order = data;
			by agebi;
			class new_id frailty_gp3(ref = "0");
			model mocabi(event = "1") = frailty_gp3 / dist = binary link = logit solution or(label);
		run;

		/* APOE status */
		title "q3 stratified by APOE status";
		proc sort data = baseline3;
			by apo4car;
		run;

		proc glimmix data = baseline3 order = data;
			by apo4car;
			class new_id frailty_gp3(ref = "0");
			model mocabi(event = "1") = frailty_gp3 / dist = binary link = logit solution or(label);
		run;

