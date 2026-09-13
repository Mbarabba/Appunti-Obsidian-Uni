library("optimx")

pos=matrix( c(0, 0, 10, 0, 0, 10), nrow=2, ncol=3)
d=c(4.24,7.62,13.34)

findfriend<- function(x){ # objective function
fval<-(sum((x - pos[,1])^2)-d[1]^2)^2 + (sum((x - pos[,2])^2)-d[2]^2)^2 + (sum((x - pos[,3])^2)-d[3]^2)^2
return(fval)
}

a <- optimx(c(0,0),findfriend,control = list(all.methods = TRUE))
print(a)
