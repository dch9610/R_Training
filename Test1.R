require(graphics)

# a 2-dimensional example
x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
           matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
colnames(x) <- c("x", "y")
(cl <- kmeans(x, 2))
plot(x, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex = 2)


#####################
x <- rbind(matrix(rnorm(100, sd = 0.3), ncol = 2),
           matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2))
colnames(x) <- c("x", "y")

mat_1 <- matrix(rnorm(100,sd=0.3),ncol = 2)
mat_2 <- matrix(rnorm(100,mean=1,sd=0.3),ncol = 2)

bind_results <- rbind(mat_1,mat_2)

colnames(x) <- c("x","y") # 행에 이름을 붙여줌
cl <- kmeans(x,5) # 1부터 3까지의 숫자로 표현
cl
plot(x,col=cl$cluster)
points(cl$cluster,col=1:3,pch=8,cex=2) # 
