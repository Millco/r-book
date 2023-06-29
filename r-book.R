tab1 <- read.csv("bsp1.csv")

vec1 <- tab1[nrow(tab1),]

tab2 <- tab1[1:nrow(tab1)-1,]
# 
# tab2
# vec1

tab3 <- tab2
tab3[is.na(tab3)] <- 0
for(i in 2:4){
tab3[which(tab3[,i] > 0),i] <- ifelse(tab2[which(tab3[,i] > 0),i] > 0, vec1[i],0)
}
tab3

#tab3[which(tab3[,2] > 0),2] <- ifelse(tab2[which(tab3[,2] > 0),2] > 0, vec1[2],0)

