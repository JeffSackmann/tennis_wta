# Define EM for one time step 

EM_step <- function(Z,lambda,W,a,b,K,n){
  
  # Expectation  
  
  for(i in 1:K){
    for(j in 1:K){
      if(n[i,j]>0){
        Z[i,j] <- rgamma(1,n[i,j],lambda[i]+lambda[j])}
    }
  }
  
  # Compute sum of upper and lower diagonals of Z    
  upper <- sum(Z[upper.tri(Z, diag = FALSE)])
  lower <- sum(Z[lower.tri(Z, diag = FALSE)])
  
  #Maximisation
  
  for(i in 1:K){
    lambda[i] <- rgamma(1,a + sum(W[i,]),b + upper + lower)
  }
  
  return(list("z"=Z,"lam"=lambda))
}





# Perform EM for nsteps

EM <- function(W,nsteps,a,b){
  
  # Initialise Variables
  
  K <- length(W[1,])
  n <- matrix(0,nrow=K,ncol=K)
  n <- W + t(W)
  lambda <- runif(K,0,10)
  
  Z <- matrix(0,nrow = K,ncol=K)
  
  
  for(t in 1:nsteps){
    step <- EM_step(Z,lambda,W,a,b,K,n)
    Z <- step$z
    lambda <- step$lam
    
    return(lambda)
  }
}


rescale <- function(l)l/sum(l)
  
