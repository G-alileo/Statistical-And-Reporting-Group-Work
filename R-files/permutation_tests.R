# --- Example 1: Permutation Test for Difference in Means (Reading Data) ---
T <- c(24, 43, 58, 71, 61, 44, 67, 49, 59, 52, 62, 54, 46, 43, 57, 
       43, 57, 56, 53, 49, 33)
C <- c(42, 43, 55, 26, 33, 41, 19, 54, 46, 10, 17, 60, 37, 42, 55, 
       28, 62, 53, 37, 42, 20, 48, 85)
n1 <- length(T)
n2 <- length(C)
Z <- c(T,C)
N <- length(Z)
obs_stat <- mean(T)-mean(C)
B <- 1000
new_stats <- numeric(B)

for( i in 1:B){
    idx <- sample(1:N,size=n1, replace=F)
    newT <- Z[idx]
    newC <- Z[-idx]
    new_stats[i] <- mean(newT)-mean(newC)
    }

pvalue <- mean(c(obs_stat,new_stats)>=obs_stat)
pvalue                                                                         

hist(new_stats, main="Permutation Distribution")
points(obs_stat,0, cex=1, pch=16)                       

# --- Example 2: Permutation Test for t-statistic (chickwts Data) ---
# Note: R's `chickwts` dataset must be loaded externally to run this section.

X <- as.vector(chickwts$weight[chickwts$feed=="soybean"])
Y <- as.vector(chickwts$weight[chickwts$feed=="linseed"])

B <- 999
Z <- c(X,Y)
reps <- numeric(B)
K <- 1:26
t0 <- t.test(X,Y)$statistic

for(i in 1:B){
    k <- sample(K, size=14, replace=F)
    x1 <- Z[k]
    y1 <- Z[-k]
    reps[i] <- t.test(x1,y1)$statistic
    }

p <- mean(c(t0, reps)>=t0)                                   
hist(reps, main="Permuation Distribution")
points(t0,0, cex=1, pch=16)                                                                                     

# --- Example 3: Permutation Test for K-S Statistic (chickwts Data) ---
# X, Y, Z, K, B are carried over from Example 2

D <- numeric(B)
DO <- ks.test(X,Y, exact=F)$statistic


D <- numeric(B)
for( i in 1:B){
    k <- sample(K, size=14, replace=F)
    x1 <- Z[k]
    y1 <- Z[-k]
    D[i] <- ks.test(x1, y1, exact=F)$statistic
    }

p <- mean(c(DO,D) >= DO)                                   
hist(D, main="Permuation Distribution")
points(DO,0, cex=1, pch=16)                                 

# --- Example 4: Randomization Test for Correlation Coefficients ---

Score <- c(58,  48,  48,  41,  34,  43,  38,  53,  41,  60,  55,  44,  
           43, 49,  47,  33,  47,  40,  46,  53,  40,  45,  39,  47,  
           50,  53,  46,  53)
SAT <- c(590, 590, 580, 490, 550, 580, 550, 700, 560, 690, 800, 600, 
           650, 580, 660, 590, 600, 540, 610, 580, 620, 600, 560, 560, 
           570, 630, 510, 620)

r.obt <- cor(Score, SAT)
cat("The obtained correlation is ",r.obt,'\n')                                                                     

nreps <- 5000
r.random <- numeric(nreps)
for (i in 1:nreps) {
    Y <- Score
    X <- sample(SAT, 28, replace = FALSE)
    r.random[i] <- cor(X,Y)
    }

prob <- length(r.random[r.random >= r.obt])/nreps
cat("Probability randomized r >= r.obt",prob)                                                           

# --- Comparison: Bootstrap versus Randomization ---


x <- c(45, 53, 73, 80)
y <- c(22, 30, 29, 38)
then two resamples might be
rbind(x, sample(y, size=4, replace=F))
##   [,1] [,2] [,3] [,4]
## x   45   53   73   80
##     29   22   38   30
rbind(x, sample(y, size=4, replace=F))
##   [,1] [,2] [,3] [,4]
## x   45   53   73   80
##     29   22   38   30