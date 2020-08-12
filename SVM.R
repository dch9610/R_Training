

#iris3 데이터에서 1:25까지 데이터만 불러오고 ,,1은 첫번째 품종을 의미함
train <- rbind(iris3[1:25,,1], iris3[1:25,,2], iris3[1:25,,3]) 
test <- rbind(iris3[26:50,,1], iris3[26:50,,2], iris3[26:50,,3])

# rep('a', 21) a의 문자를 21번 반복
cl <- factor(c(rep("s",25), rep("c",25), rep("v",25)))

# SVM
model <- svm(train,cl)
summary(model)

#Test with train data 
pred <- predict(model, test)

# Check accuracy
real <- cl
table(pred,real)

# Create Data
x <- seq(0.1,5,by=0.05) # 0.1부터 5까지 0.05씩 증가
y <- sin(x) + rnorm(x,sd=0.2) # x개의 난수 생성, sd는 표준편차, 오차를 추가한것

# Estimate model and predict input values
m <- svm(x,y)
new <- predict(m,x) # predict 예측 
m

#Visualize
plot(x,y) # 학습데이터 (검은점)
points(x,sin(x),col=2) # x에 관해 sin(x)가 찍힘 (빨간점 col=2)
points(x,new,col=4) # x에 관해 new의 정보가 찍힘 (파란점 col=4)

#==========================================================

# lm (Linear Models) 선형모델
ggplot(data =iris, aes (x=Sepal.Length,
                        y=Petal.Length,
                        color=Species)) +
  geom_smooth(method=lm,formula=y~x) +
  geom_point(size=2)+
  ggtitle("Sepal Length vs Petal Length") + 
  xlab("Sepal Length") + ylab("Petal Length")

require(graphics)
# Create Data
x <- seq(0.1,5,by=0.05) # 0.1부터 5까지 0.05씩 증가
y <- log(x) + rnorm(x,sd=0.2) # x개의 난수 생성, sd는 표준편차, 오차를 추가한것
x_y <- cbind(x,y)
colnames(x_y) <- c("x","y")
x_y.df <- as.data.frame(x_y)

linear_model <- lm(y ~x, data=x_y.df)
linear_predict <- predict(linear_model,newdata=data.frame(y=x_y.df$x)
                          , interval="confidence")

svm_model <- svm(x,y)
svm_predict <- predict(svm_model, newdata=data.frame(y=x_y.df$x))

plot(x,y) # 학습데이터
points(x, linear_predict[,1], col=4) # 유사한 학습데이터를 학습
points(x, svm_predict,col=2)
#dbline(linear_model, col=4)