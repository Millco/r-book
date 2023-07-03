library(ggplot2)

rm(list=ls())
dis <- c(9,845)
nodis <- c(3,6805)
sums <- dis + nodis

bigbrother1 <- cbind(nodis,dis)
bigbrother2 <- rbind(cbind(nodis,dis,sums),c(sum(nodis),sum(dis),sum(sums)))
rownames(bigbrother1) <- c("selected","rejected")
rownames(bigbrother2) <- c("selected","rejected","sums")

bigbrother1
bigbrother2

chisq.test(bigbrother1)

plot(bigbrother1)
