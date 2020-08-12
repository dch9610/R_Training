## Not run:  
# create training numbers
X1 = sample(0:127, 10000, replace=TRUE) # 0~127의 랜덤한 숫자
X2 = sample(0:127, 10000, replace=TRUE) 

# create training response numbers
Y <- X1 + X2

# convert to binary
X1 <- int2bin(X1)
X2 <- int2bin(X2)
Y  <- int2bin(Y)

# Create 3d array: dim 1: samples; dim 2: time; dim 3: variables.
X <- array( c(X1,X2), dim=c(dim(X1),2) )

# train the model
model <- trainr(Y=Y[,dim(Y)[2]:1],
                X=X[,dim(X)[2]:1,],
                learningrate   =  1,
                hidden_dim     = 16 )

# create test inputs (2진수 형태로 만듬)
A1 = int2bin( sample(0:127, 7000, replace=TRUE) ) 
A2 = int2bin( sample(0:127, 7000, replace=TRUE) )

# create 3d array: dim 1: samples; dim 2: time; dim 3: variables
A <- array( c(A1,A2), dim=c(dim(A1),2) )

# predict
B  <- predictr(model,
               A[,dim(A)[2]:1,]     )
B = B[,dim(B)[2]:1]
# convert back to integers
A1 <- bin2int(A1)
A2 <- bin2int(A2)
B  <- bin2int(B)

# inspect the differences              
table( B-(A1+A2) )

# plot the difference
hist(  B-(A1+A2) )

## End(Not run)

#[Package rnn version 1.4.0 Index]