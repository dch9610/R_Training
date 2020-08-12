iris
x <- iris[1:2]
x1 <- kmeans(x,4)

plot(x)
plot(x, col = x1$cluster) # col 해당 데이터에 x1에 맞게 색깔을 입힘
points(x1$centers, col = 1:4, pch = 5, cex = 2) # center 크기, 색깔, 모양
