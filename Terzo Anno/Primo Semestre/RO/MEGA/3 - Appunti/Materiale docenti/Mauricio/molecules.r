library("optimx")

findmolecule = function(x) {
    x_1 = c(0, 0, 0)
    x_2 = c(x[1], x[2], x[3])
    x_3 = c(x[4], x[5], x[6])
    x_4 = c(x[7], x[8], x[9])
    
    d <- t(matrix(c(1.526, 2.4914, 3.838, 0, 1.526, 2.4914, 1.526, 0, 1.526), nrow = 3, ncol = 3))
    
    fval <- (sum((x_2 - x_1)^2) - d[1,1]^2)^2 + (sum((x_3 - x_1)^2) - d[1,2]^2)^2 
            + (sum((x_4 - x_1)^2) - d[1,3]^2)^2 + (sum((x_2 - x_3)^2) - d[2,2]^2)^2 
            + (sum((x_2 - x_4)^2) - d[2,3]^2)^2 + (sum((x_3 - x_4)^2) - d[3,3]^2)^2
    
    return(fval)
}

params = c(1.5, 0.4, 0, 2, 0, 1.5, 3.5, 0.5, 1.5)

a <- optimx(par=params, fn=findmolecule, control = list(all.methods = TRUE))
