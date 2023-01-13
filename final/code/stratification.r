cf <- function(x, y) {
    z <- abs(y - x) / x
    return(z)

}

crude <- 0.5122
#age
age0 <- 
age1 <- 2.3839
agebd <- 0.8786
agemh <- 0.4281
cf(crude, agemh) 


#edu
edu0 <- 1.4559
edu1 <- 2.2655
edubd <- 0.2736
edumh <- 0.4929
educrude <- 4.7519
cf(crude, edumh) 

#bmi
bmi0 <- 1.9496
bmi1 <- 2.1733
bmibd <- 0.7839
bmimh <- 0.5129
bmicrude <- 1.0815
cf(crude, bmimh) 

#sex (0 = male 1 = female)
sex0 <- 2.0417
sex1 <- 1.9913
sexbd <- 0.9413
sexmh <- 0.4971
sexcrude <- 1.51
cf(crude, sexmh) 

#apoe
apo0 <- 1.9985
apo1 <- 1.5385
apobd <- 0.5045
apomh <- 0.5380
apocrude <- 3.54
cf(crude, apomh) 
#smk
smk0 <- 1.7404
smk1 <- 2.9393
smkbd <- 0.2083
smkmh <- 0.5180
smkcrude <- 1.48
cf(crude, smkmh) 

#alco
alco0 <- 1.9196
alco1 <- 2.2549
alcobd <- 0.7551
alcomh <- 0.5114
alcocrude <- 1.32
cf(crude, alcomh) 

#est
est0 <- 1.6753
est1 <- 3.5011
estbd <- 0.0548
etsmh <- 0.4834
etscrude <- 1.51
cf(crude, etsmh) 
 
#coffee (1 = no 0 = yes)
coffee0 <- 1.9786
coffee1 <- 1.9376
coffeebd <- 0.9580
coffeemh <- 0.5136
coffeecrude <- 2.0067
cf(crude, coffeemh) 

# tea(1 = no 0 = yes)
tea0 <- 1.9079
tea1 <- 2.0195
teabd <- 0.8769
teamh <- 0.5033
teacrude <- 1.4802
cf(crude, teamh) 

#dm ( 1 = yes 0 = no)
dm0 <- 1.9112
dm1 <- 2.5414
dmbd <- 0.5211
dmmh <- 0.4991
dmcrude <- 1.37
cf(crude, dmmh) 

#chol(1 = no 0 = yes)
chol0 <- 1.0755
chol1 <- 2.2622
cholbd <- 0.0667
cholmh <- 0.5206
cholcrude <- 2.1470
cf(crude, cholmh) 

#cvd (1 = no 0 = yes)
cvd0 <- 2.7824
cvd1 <- 1.6332
cvdbd <- 0.1763
cvdmh <- 0.5415
cvdcrude <- 1.4991
cf(crude, cvdmh) 

#ex (1 = no, 0 = yes)
ex0 <- 1.9922
ex1 <- 1.9800
exbd <- 0.9858
exmh <- 0.5031
excrude <- 1.78
cf(crude, exmh) 

#lsr( 1 = no, 0 = yes)
lsr0 <- 1.8436
lsr1 <- 3.8182
lsrbd <- 0.2367
lsrmh <- 0.5124
lsrcrude <- 1.06
cf(crude, lsrmh)

#corp (1 = no 0 = 1)
corp0 <- 2.7141
corp1 <- 1.6601
corpbd <- 0.1642
corpmh <- 0.5037
corpcrude <- 2.41
cf(crude, corpmh) 
cf(crude, 2.3358)
