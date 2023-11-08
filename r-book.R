#### Prereqs ####
library(akima)
library(boot)
library(car)
library(lme4)
library(meta)
library(mgcv)
library(nlme)
library(deSolve)
# library(R2jags)
library(RColorBrewer)
library(RODBC)
library(rpart)
library(spatstat)
library(spdep)
library(tree)
# setwd("R")
library(help=spatial)

#### 1 Getting Started ####

citation()

?read.table

help.search("data input")

find("lowess")
# 
# example(lm)
# 
# apropos("lm")
# example("lm")
# 
# demo(persp)
# demo(graphics)
# demo(Hershey)
# demo(plotmath)

objects()
search()
# detach(worms)

rm(list=ls())

#### Chapter 2: Essentials of the R Language

#### 2.1 Calculations ####
log(42/7)
2+3+4; 28*3; 3-7
2e-3

#### 2.1.1 Complex numbers in R ####
z <- 3.6-5i
Re(z)
Im(z)
Mod(z)
Arg(z)
Conj(z)
is.complex(z)
as.complex(3.8)

#### 2.1.2 Rounding ####
floor(5.7)
ceiling(5.7)
rounded <- function(x) floor(x+0.5)
rounded(-5.5)
trunc(5.5)
round(-5.5,0)
signif(12345678,4)

#### 2.1.3 Arithmetic ####
7+3-5*2
3^2/2
exp(1)
log(exp(1))
log10(10)
log(3,8)
pi
sin(pi/2)
cos(pi)

#### 2.1.4 Modulo and integer quotients ####
119 %/% 10 # integer quotient
119 %% 10 # remainder (modulo) - praktisch zum Testen auf odd or even
9 %% 2
8 %% 2
15232 %% 7 == 0 # test for equality

#### 2.1.5 Variables ####
x <- 5

#### Exkurs ####
y<-scan()

counts <- c(rpois(100,25))
names(counts)<-1:length(counts)
counts
table(counts)
mean(counts, na.rm=TRUE)

OrchardSprays
attach(OrchardSprays)
View(OrchardSprays)
tapply(decrease, treatment, mean)
detach()
?tapply
?OrchardSprays

xv <- rnorm(1000,100,10)
xv
cat(c(
  "Position", which(abs(xv-100)==min(abs(xv-100))), "beinhaltet den Wert", xv[which(abs(xv-100)==min(abs(xv-100)))], "der am nächsten an 100 liegt.")
  )
  
cat("Insert 3 Coins\n")
# yvi <- scan(nmax=3)
yvi <- c(1000,100,10)
yv <- rnorm(yvi[1],yvi[2],yvi[3])
cat(c(
  "Dieser Vektor beinhaltet",yvi[1],"Werte. Der Mittelwert beträgt",yvi[2],"und die Standardabweichung",yvi[3],
  "\nDer Wert, der mit",yv[which(abs(yv-yvi[2])==min(abs(yv-yvi[2])))], "am nächsten am Mittelwert",yvi[2],"liegt befindet sich auf Position",which(abs(yv-yvi[2])==min(abs(yv-yvi[2]))),"."
))
boxplot(yv)
barplot(sort(yv))
barplot(yv)
letters


#### 2.1.6 Operators ####
# + - * / %/% %% ^ # arithmetic (plus, minus, times, divide, integer, quotient, modulo, power)
# > >= < <= == != # relation (greater than, greater than or equal, lesser than, lesser than or equal, equal, not equal)
# ! & | # logical (not, and, or)
# ~ # model formulae ('is modelled as a function of')
# <- -> # assignments (gets)
# $ list index (the 'element name' operator)
# : # create a sequence

#### 2.1.7 Integers ####
x <- c(5,6,7,8)
is.integer(x)
is.numeric(x)
x <- integer(x)
as.integer(x)
as.integer(5.6)
as.integer(5.6 - 3i)

#### 2.1.8 Factors #### 
gender <- factor(c("female", "male", "female", "male", "female"))
class(gender)
mode(gender)
daphnia <- read.table("daphnia.txt", header=T, stringsAsFactors = T)
head(daphnia)
attach(daphnia)
is.factor(Water); is.factor(Detergent)
levels(Detergent)
nlevels(Detergent)
tapply(Growth.rate, Detergent, mean)

Detergent <- factor(Detergent, levels=c("BrandD","BrandB","BrandA", "BrandC")) # Reihenfolge der Faktoren ändern
tapply(Growth.rate, Detergent, mean)
as.vector(unclass(Daphnia))

#### 2.2 Logical Operations ####
# ! logical not
# & logical and
# | logical or
# < less than
# <= less than or equal to
# > greater than
# >= greater than or equal to
# == logical equal
# != not equal
# && AND with IF
# || OR with IF
# xor(x,y) exclusive OR
# isTRUE(x) an abbreviation of identical(TRUE, x)

#### 2.2.1 TRUE and T with FALSE and F ####
TRUE == FALSE
T == F
T <- 0
T == FALSE
T == F
F <- 1
TRUE == F
T != F

#### 2.2.2 Testing for equality with real numbers ####
x <- sqrt(2)
x^2 
x * x == 2
x * x - 2

#### 2.2.3 Equality of floating point numbers using all.equal ####
x <- 0.3 - 0.2
y = 0.1
x == y
identical(x,y)
all.equal(x,y) # allows for insignificant differences
?all.equal

#### 2.2.4 Summarizing differences between objects using all.equal ####
a <- c("cat", "dog", "goldfish")
a
b <- factor(a)
b
all.equal(a,b) # oject on the left is called target, object on the right is called current
class (b)
mode(b)
attributes(b)

n1 <- c(1,2,3)
n2 <- c(1,2,3,4)
all.equal(n1,n2)
n2 <- as.character(n2)
all.equal(n1,n2)

#### Exkurs ####
vec<-1:80
vec[-(1:80*(1:80%%9==0))]
x <- c(1:5)
outer(x, x)

TRUE | NA

#### 2.2.5 Evaluation of combinations of TRUE and FALSE ####
x <- c(NA, FALSE, TRUE)
names(x) <- as.character(x)
x
outer(x, x, "&")
outer(x, x, "|")

#### 2.2.6 Logical arithmetic ####
x <- 0:6
x <= 4
all(x < 10)
any(x > 1)

sum(x > 4)
(x < 4) * runif(7)
?runif(7)

treatment <- letters[1:5]
(t2 <- factor(13 + (treatment == "b") + 2 * (treatment == "c") + 3 * (treatment == "d")))

#### 2.3 Generating sequences ####
1300:1337
seq(1300,1337,along=0:37)
seq(5:1)
5:1
seq(0, 1.5, 0.1)
seq(6, 4, -0.2)
sequence(1:5)
N <- c(55, 76, 92, 103, 84, 88, 121, 91, 65, 77, 99)
seq(from = 0.04, by = 0.01, length = 11)
seq(from = 0.04, by = 0.01, along = N) # R erhöht in der angegebenen Schrittgröße bis die Faktorlänge erreicht ist
seq(from = 0.04, to = 0.14, along = N) # R berechnet die notwendige Größe der Schritte für die Länge des Faktors
seq(1.4, 2.1, 0.3) # Wenn es nicht exakt aufgeht hört es vorher auf

sequence(c(4,3,2,3))
sequence(length(x))

#### 2.3.1 Generating repeats ####
rep(1:3,3)
rep(1:4, 2, each = 3)
rep(1:5, 1:5)
rep(x, length(x))

rep(c("cat", "dog", "gerbil", "goldfish", "rat"), c(2,3,2,1,3))
length(rep(c("cat", "dog", "gerbil", "goldfish", "rat"), c(2,3,2,1,3)))

#### 2.3.2 Generating factor levels ####
gl(3,5)
gl(3,2,10)
Temp <- gl(2, 2, 24, labels = c("Low", "High"))
Soft <- gl(3, 8, 24, labels = c("Hard", "Medium", "Soft"))
M.user <- gl(2, 4, 24, labels = c("N", "Y"))
Brand <- gl(2, 1, 24, labels = c("X", "M"))
data.frame(Temp, Soft, M.user, Brand)

#### 2.4 Membership: Testing and coercing in R ####


