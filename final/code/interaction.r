bi <- function(x0, x1) {
    y <- (x1 - x0) / x0
    return(y)
}
agebi <- bi(2.2300, 2.3525)
edubi <- bi(1.7624, 2.2333)
bmibi <- bi(1.8387, 2.4490)
sex <- bi(1.8689, 2.3549)
apoe <- bi(2.1418, 1.5009)
smkbi <- bi(1.7221, 3.2327)
alcohol <- bi(1.8924, 2.6889)
ets <- bi(1.6586, 3.1515)
coffeebi <- bi(1.9434, 2.0963)
tea1 <- bi(2.0834, 1.7246)
tea2 <- bi(2.0834, 1.4474)
tea3 <- bi(2.9834, 2.2112)
dmbi <- bi(1.8939, 2.8000)
cholbi <- bi(2.3039, 1.0714)
cvdbi <- bi(1.7752, 2.2232)
ex <- bi(1.7922, 2.1685)
lsr <- bi(3.8182, 1.8649)
corp <- bi(1.7315, 2.5667)

x <- c(agebi, edubi, bmibi,
sex, apoe, smkbi, alcohol, ets,
coffeebi, tea1, tea2, tea3,
dmbi, cholbi, cvdbi,
ex, lsr, corp)
y <- c("agebi", "edubi", "bmibi"
, "sex", "apoe", "smkbi", "alcohol", "ets"
, "coffeebi", "tea1", "tea2", "tea3"
, "dm", "chol", "cvd"
, "ex", "lsr", "corp" 
)

interaction <- rbind(y, x)
interaction
write.csv(interaction, "/Users/raymond/Desktop/R/course/interaction.csv")
