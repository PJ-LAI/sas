/* Homework 8 */
dm "odsresult" clear;
dm "log" clear;
/* paper 1 */
	/* (a) -1 high birth weight --> testicular ca. */
	data Q1;
		/* rate */
		IR1 = 23 / 9.5;  /* exposed group */ 
		IR0 = 394 / 120.8;  /*  non-exposed group */

		/* rate ratio*/
		IRR = IR1 / IR0; 
			/* standard error */
			SE_logIRR = sqrt(1 / 23 + 1 / 394);  
			/* 95% CI */
			IRR_lower = exp(log(IRR) - 1.96 * SE_logIRR); 
			IRR_upper = exp(log(IRR) + 1.96 * SE_logIRR); 

		/* rate difference */
		IRD = IR1 - IR0;  
			/* standard error */
			SE_IRD = sqrt(23 / (9.5**2) + 394 / (120.8 ** 2));
			/* 95% CI */
			IRD_lower = IRD - 1.96 * SE_IRD;  
			IRD_upper = IRD + 1.96 * SE_IRD;  
		run;
		proc print data = q1;
		run;

		%macro q1 (n1, n0, pt1, pt0, title);

			data q1;
				/* rate */
				IR1 = &n1. / &pt1.;  /* exposed group */ 
				IR0 = &n0. / &pt0.;  /*  non-exposed group */

				/* rate ratio*/
				IRR = IR1 / IR0; 
					/* standard error */
					SE_logIRR = sqrt(1 / &n1. + 1 / &n0.);  
					/* 95% CI */
					IRR_lower = exp(log(IRR) - 1.96 * SE_logIRR); 
					IRR_upper = exp(log(IRR) + 1.96 * SE_logIRR); 

				/* rate difference */
				IRD = IR1 - IR0;  
					/* standard error */
					SE_IRD = sqrt(&n1. / (&pt1.**2) + &n0. / (&pt0. ** 2));
					/* 95% CI */
					IRD_lower = IRD - 1.96 * SE_IRD;  
					IRD_upper = IRD + 1.96 * SE_IRD;  
				run;
				
				title &title;
				proc print data = q1;
				run;

				title;
		%mend q1;

		%q1 ( n1 = 23, n0 = 394, pt1 = 9.5, pt0 = 120.8, title = "high birth weight");
	/* (a) -2 maternal age --> testicular ca. */
		%q1 ( n0 = 803, n1 = 1348, pt0 = 144.3, pt1 = 145.2, title = "maternal age")
	/* (a) -3 preecalmpsia --> testicular ca. */
		%q1(n1 = 3, n0 = 153, pt1 = 2.9, pt0 = 92.0, title = "preeclampsia")
/* paper 2 */
		%macro q2(epdp, endp, epdn, endn, title);
				data q2;
					/* OR */
					OR = (&epdp. * &endn.) / (&endp. * &epdn.);  
					/* standard error */
					SE_logOR = sqrt(1 / &epdp. + 1 / &endp. + 1 / &epdn. + 1 / &endn.); 
					/* 95% CI */
					OR_lower = exp(log(OR) - 1.96 * SE_logOR);  
					OR_upper = exp(log(OR) + 1.96 * SE_logOR);  
				run;

				title &title.;  

				Proc print data = q2; 
				run;  

				title;  
	%mend q2; 
	/* a-1 : gender --> AD */
		%q2( epdp = 60, endp = 70, epdn = 100, endn = 155, title = "(E)male(DZ)ADcrude");
	/* a-2 : gender--> AD stratified by APOE e4*/
		%q2(epdp = 37, endp = 50, epdn = 17 , endn = 40, title = "(E)male(DZ)AD(STRATA)carrier");
		%q2(epdp = 23, endp = 20, epdn = 83 , endn = 115, title = "(E)male(DZ)AD(STRATA)non_carrier");
	/* a-3 */
	/* a-4 */
	/* b-1 APOE e4 --> AD*/
		%q2(epdp = 87, endp = 43, epdn = 57, endn = 198, title = "(E)APOE(DZ)ADcrude");
	/* b-2 APOE e4 --> AD stratified by gender */
		%q2(epdp = 37, endp = 23, epdn = 17, endn = 83, title = "(E)APOE(DZ)AD(STRATA)male");
		%q2(epdp = 50, endp = 20, epdn = 40, endn = 115, title = "(E)APOE(DZ)AD(STRATA)female");



	
	 
