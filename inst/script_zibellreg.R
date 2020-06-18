

library(bellreg)


data(cells)
head(cells)


mle1 <- zibellreg(cells~1|smoker+age+sex, data=cells, init=0)
mle2 <- zibellreg(cells~smoker+age+sex|1, data=cells, init=0)
mle3 <- zibellreg(cells~smoker+age+sex|smoker+age+sex, data=cells, init=0)
summary(mle1)
summary(mle2)
summary(mle3)


bayes1 <- zibellreg(cells~1|smoker+age+sex, data=cells, approach="bayes")
bayes2 <- zibellreg(cells~smoker+age+sex|1, data=cells, approach="bayes")
bayes3 <- zibellreg(cells~smoker+age+sex|smoker+age+sex, data=cells, approach="bayes")
summary(bayes1)
summary(bayes2)
summary(bayes3)



bayes3 <- zibellreg(cells~sex|sex, data=cells, approach="bayes")
summary(bayes3)
