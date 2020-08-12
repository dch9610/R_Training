#======================================
sc <- spark_connect(master="local")
tripadvisor

b <- tripadvisor[4:5]
b1 <- kmeans(b,3)

# recode diagnosis as a factor
# B, M을 Benign, Malignant로 바꿔줌
balance$V1 <- factor(balance$V1, levels = c("B", "L", "R"),
                     labels = c("Base", "Left","Right"))

plot(b)
plot(b, col = b1$cluster) # col 해당 데이터에 x1에 맞게 색깔을 입힘
points(b1$centers, col = 1:4, pch = 5, cex = 2) # center 크기, 색깔, 모양

#=====================================
# 데이터 준비
# training 데이터로 모델(70%)을 만들고, testing 데이터로 모델 (30%)을 평가하기 위한 사전작업
library(caret)

balance
table(balance$V1) #컬럼명을 기준으로 해당 값의 갯수 파악

inTrain <- createDataPartition(y = balance$V1, p = 0.7, list = F)
training <- balance[inTrain,]
testing <- balance[-inTrain,]
training

#표준화 (scale 함수 사용)

training.data <- scale(training[2:5])
summary(training.data)

# 모델 작성 (training 데이터를 3ㅐ개 군집으로 나누어줌)
balance.kmeans <- kmeans(training.data[,-5], centers = 3, iter.max = 10000)
balance.kmeans$centers

# 군집확인
# 군집 분석 결과를 training 데이터셋에 할당하고, 결과 확인
training$cluster <- as.factor(balance.kmeans$cluster)
qplot(V4,V5, colour = cluster, data = training)
table(training$V1, training$cluster)



ba <- balance[2:5]
ba1 <- kmeans(ba,3)



plot(training.data)
plot(training.data, col = balance.kmeans$cluster) # col 해당 데이터에 x1에 맞게 색깔을 입힘
points(balance.kmeans$cluster, col = 1:2, pch = 4, cex = 2) # center 크기, 색깔, 모양

