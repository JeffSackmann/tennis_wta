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

EM <- function(W,nsteps,a,b,eps){
  
# Initialise Variables
  
  K <- length(W[1,])
  n <- matrix(0,nrow=K,ncol=K)
  n <- W + t(W)

  lambda <- runif(K,10,20)

  
  Z <- matrix(0,nrow = K,ncol=K)
  
  
  for(t in 1:nsteps){
    step <- EM_step(Z,lambda,W,a,b,K,n)
    Z <- step$z
    lambda_temp <- step$lam/sum(step$lam)
    
    if(sqrt(sum((lambda-lambda_temp)^2))<eps) {
      
      print(cat('Converge after',t,'steps','\n'))
      
      return(lambda_temp)} # Stopping Condition
    
    lambda <- lambda_temp 
    
  }
  
   
  return(lambda)
  
}

EM2_step <- function(lambda,W,a,b,K,n){

  temp <- matrix(0,K,K)
  for(i in 1:K){
    for(j in 1:K){
      temp[i,j] <- n[i,j]/(lambda[i]+lambda[j])
    }
  }
  
  for(i in 1:K){
    lambda[i] = (a - 1 + sum(W[i,]))/(b+ sum(temp[i,]))
  }

  return(lambda)
}



EM2 <- function(W,nsteps,a,b,eps){

  # Initialise Variables

  K <- length(W[1,])
  n <- matrix(0,nrow=K,ncol=K)
  n <- W + t(W)
  lambda <- runif(K,10,20)
  
  for(t in 1:nsteps){
    lambda_temp <- EM2_step(lambda,W,a,b,K,n)
    if(sqrt(sum((lambda-lambda_temp)^2))<eps) {
      
      print(cat('Converge after',t,'steps','\n'))
      
      return(lambda_temp)} # Stopping Condition
    lambda <- lambda_temp 
  }
  return(lambda)
}



