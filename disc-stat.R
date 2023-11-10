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

# 198/2529
fbp <- c(22, 40, 53, 57, 93, 98, 103, 108, 116, 121, 252)

fbp <- fbp[which(fbp < 250)]

fbp.m <- sum(fbp) / length(fbp)
for(i in 1:length(fbp)){
  fbp.ss <- sum((fbp[i]-fbp.m)^2)
}
fbp.vr <- fbp.ss / length(fbp)
fbp.sd <- sqrt(fbp.vr)

cat('Der Mean der Facebookpeople beträgt', fbp.m,'.')
cat('Die Varianz der Facebookpeople beträgt', fbp.vr, 'und die Standardabweichung beträgt', fbp.sd)


?cat
