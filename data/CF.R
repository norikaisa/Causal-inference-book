library(grf)
data <- read.csv("a_impute_CF.csv")
Y <- ifelse(data$Y == "Yes",1,0)
W <- ifelse(data$T == "Endoscopy",1,0)
X <- data.frame(data$K,data$Age)


forest.Y <- regression_forest(X, Y)
Y.hat <- predict(forest.Y)$predictions
forest.W <- regression_forest(X, W)
W.hat <- predict(forest.W)$predictions
c.forest <- causal_forest(X, Y, W, Y.hat, W.hat)
tau.hat <- predict(c.forest)$predictions
mu.hat.0 <- Y.hat - W.hat * tau.hat
mu.hat.1 <- Y.hat + (1 - W.hat) * tau.hat
ITE = mu.hat.1 - mu.hat.0
summary(ITE)
summary(mu.hat.0)
summary(mu.hat.1)

c.forest <- causal_forest(X, Y, W)
summary(predict(c.forest)$predictions)
average_treatment_effect(c.forest, target.sample = "all")

tree <- get_tree(c.forest, 3) 
plot(tree)


data$ITE = predict(c.forest)$predictions
plot(data$ITE, data$Age)
write.csv(data, "a_impute_CF.csv")


