# knn 목적: 분류
library(class)
iris3

#iris3 데이터에서 1:25까지 데이터만 불러오고 ,,1은 첫번째 품종을 의미함
train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3]) 
test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3])

# rep('a', 21) a의 문자를 21번 반복
cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))
rep_total <- c(rep("s",25), rep("c",25), rep("v",25))
rep_total
# 훈련 데이터(train)로 테스트를 할건데 cl 형식으로  순서 주의
results <- knn(train, test, cl, k = 3, prob=TRUE) # knn 안에서 합쳐짐 (train, test, cl, k=3...)
results
attributes(.Last.value) 

train_show <- cbind(train,rep_total) # cbind 컬럼으로 합친다. train 컬럼옆에 rep_total을 붙인다.
colnames(train_show)[5]<- c("results") # 컬럼명의 5번째 이름을 results로 바꾼다.

plot(results)