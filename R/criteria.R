
#---------------------------------------------
#' Akaike Information Criterion for the bellreg model
#'
#' @aliases AIC.bellreg
#' @description Function to compute the Akaike Information Criterion (AIC) for fitted bellreg model.
#' @export
#' @param object an object of the class bellreg.
#' @param ... further arguments passed to or from other methods.
#' @param k numeric, the penalty per parameter to be used; the default k = 2 is the classical AIC.
#' @return  The AIC associated with the fitted model.
#' @examples
#' \dontrun{
#' fit <- bellreg(nf~lroll, data=faults, init=0)
#' AIC(fit)
#'}
#'

AIC.bellreg <- function(object, ..., k = 2){
  p <- object$p
  q <- object$q
  if(object$approach == "bayes"){
    warning("AIC is not available for Bayesian models!")
  }else{
    npar <- ifelse(is.null(q), p, p+q)
    loglik <- object$fit$value
    AIC <- -2*loglik + k*npar
  }
  return(AIC)
}
