

library(bellreg)

data(cells)
head(cells)


fit <- zibellreg(cells~smoker+gender|smoker+gender, data=cells, init=0)
summary(fit)

bayes <- zibellreg(cells~smoker+gender|smoker+gender, data=cells, approach = "bayes")
summary(bayes)

bayes <- zibellreg(cells ~ 1|smoker+gender, data=cells, approach = "bayes")
summary(bayes)

teste <- bellreg(cells~smoker+gender, data=cells, approach = "bayes")
summary(teste)


coefs <- object$fit$par
p <- object$p
q <- object$q
coefs1 <- coefs[1:q]
coefs2 <- coefs[(q+1):(q+p)]
names(coefs1) <- object$labels1
names(coefs2) <- object$labels2
coefs1
coefs2
coefficients <- list("Degenerated dist." = coefs1, "Bell dist." = coefs2)
coefficients
coefficients[[1]]

fit$labels

summary(fit)
coef(fit)
vcov(fit)
vcov(object)

mle1 <- zibellreg(cells~1|smoker+age+gender, data=cells, init=0)
mle2 <- zibellreg(cells~smoker+age+gender|1, data=cells, init=0)
mle3 <- zibellreg(cells~smoker+age+gender|smoker+age+gender, data=cells, init=0)
summary(mle1)
summary(mle2)
summary(mle3)


bayes1 <- zibellreg(cells~1|smoker+age+gender, data=cells, approach="bayes")
bayes2 <- zibellreg(cells~smoker+age+gender|1, data=cells, approach="bayes")
bayes3 <- zibellreg(cells~smoker+age+gender|smoker+age+gender, data=cells, approach="bayes")
summary(bayes1)
summary(bayes2)
summary(bayes3)



bayes3 <- zibellreg(cells~gender|gender, data=cells, approach="bayes")
summary(bayes3)





teste <- V
rownames(teste) <- c(object$labels1, object$labels2)
teste




teste <- zibellreg(cells~1|smoker+gender, data=cells, init=0)
summary(teste)



formula <- cells~smoker+gender|smoker+gender
data=cells





object <- fit
std <- diag(1/object$v_sd)
V <- MASS::ginv(object$fit$hessian)
V <- std%*%V%*%std




