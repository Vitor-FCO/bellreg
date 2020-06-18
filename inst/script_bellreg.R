

library(bellreg)

data(faults)
mle <- bellreg(nf~lroll, data=faults, init=0)
summary(mle)

bayes <- bellreg(nf~lroll, data=faults, approach="bayes")
summary(bayes)






mle2 <- zibellreg(nf~lroll|lroll, data=faults, init=0)
summary(mle2)


bayes2 <- bellreg(nf~lroll|lroll, data=faults, approach="bayes")
summary(bayes)



formula <- nf~lroll|lroll
data=faults
approach="bayes"
