

### --------------------------------------------------------

hmean <- function(x){
  return(1/mean(1/x))
}

### --------------------------------------------------------
# Function to compute the LPML criteria:
LPML <- function(loglik, n){
  lik <- apply(loglik, 2, exp)
  CPO <- apply(lik, 2, hmean)
  LPML <- sum(log(CPO))
  aLPML <- mean(log(CPO))
  return(c(LPML, aLPML))
}

### --------------------------------------------------------
# Function to compute the DIC criteria:
DIC <- function(loglik, n){
  D <- apply( -2*loglik, 1, sum);
  pD <- 0.5*stats::var(D)
  DIC <- mean(D) + pD;
  return( matrix(c(DIC, pD), ncol=2) )
}

### --------------------------------------------------------
# Function to compute the WAIC criteria:
WAIC <- function(loglik, n){
  lpd <- sum( log( apply(exp(loglik), 2, mean) ) )
  pD <- sum( apply(loglik,  2, var) )
  WAIC <- lpd - pD
  return( matrix(c(WAIC, pD),ncol=2) )
}



#---------------------------------------------
#' Covariance of the regression coefficients
#'
#' @aliases vcov.bellreg
#' @export
#' @param object an object of the class bellreg
#' @param ... further arguments passed to or from other methods.
#' @return  the variance-covariance matrix associated with the regression coefficients.
#'
#'
vcov.bellreg <- function(object, ...){
  std <- diag(1/object$x_sd)
  V <- MASS::ginv(object$fit$hessian)
  colnames(V) <- names(object$fit$par)
  rownames(V) <- names(object$fit$par)
  V <- std%*%V%*%std
  #class(V) <- "vcov.ypbp"
  return(V)
}

#---------------------------------------------
#' Covariance of the regression coefficients
#'
#' @aliases vcov.zibellreg
#' @rdname vcov-methods
#' @method vcov zibellreg
#' @export
#' @export vcov
#' @param object an object of the class bellreg
#' @param ... further arguments passed to or from other methods.
#' @return  the variance-covariance matrix associated with the regression coefficients.
#'
#'
vcov.zibellreg <- function(object, ...){
  std <- diag(1/object$v_sd)
  V <- MASS::ginv(object$fit$hessian)
  colnames(V) <- names(object$fit$par)
  rownames(V) <- names(object$fit$par)
  V <- std%*%V%*%std
  return(V)
}

#---------------------------------------------
#' Estimated regression coefficients
#'
#' @aliases coef.bellreg
#' @rdname coef-methods
#' @export
#' @param object an object of the class bellreg
#' @param ... further arguments passed to or from other methods
#' @return  the estimated regression coefficients
#'
#'
coef.bellreg <- function(object, ...){
  coeffs <- object$fit$par
  return(coeffs)
}


#---------------------------------------------
#' Estimated regression coefficients
#'
#' @aliases coef.zibellreg
#' @rdname coef-methods
#' @export
#' @param object an object of the class bellreg
#' @param ... further arguments passed to or from other methods
#' @return  the estimated regression coefficients
#'
#'
coef.zibellreg <- function(object, ...){
  coeffs <- object$fit$par
  return(coeffs)
}


#---------------------------------------------
#' Generic S3 method confint
#' @aliases confint.bellreg
#' @export
#' @param object a fitted model object
#' @param ... further arguments passed to or from other methods.
#' @return the estimated regression coefficients
#'
confint <- function(object, ...) UseMethod("confint")

#---------------------------------------------
#' Confidence intervals for the regression coefficients
#'
#' @aliases confint.bellreg
#' @export
#' @param object an object of the class bellreg
#' @param level the confidence level required
#' @param ... further arguments passed to or from other methods
#' @return  100(1-alpha) confidence intervals for the regression coefficients
#'
#'
confint.bellreg <- function(object, level=0.95, ...){
  p <- object$p
  q <- object$q
  V <- vcov(object)
  par.hat <- object$fit$par[1:p]
  alpha <- 1-level
  d <- stats::qnorm(1 - alpha/2)*sqrt(diag(V))
  lower <- par.hat - d
  upper <- par.hat + d
  CI <- cbind(lower, upper)
  labels <- round(100*(c(alpha/2, 1-alpha/2)),1)
  colnames(CI) <- paste0(labels, "%")
  return(CI)
}
