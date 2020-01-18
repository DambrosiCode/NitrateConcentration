library(ggplot2)

water.change.calc <- function(total_N, water.chng, water.N){
  #total_N - starting Nitrates in tank
  #water.chng 0.n amount changed 
  #returns new nitrate level
  water.chng <- 1-water.chng
  
  new_total_N <- ((total_N*(water.chng)+(water.N*(1-water.chng))))
  return(new_total_N) #new nitrate concentration 
}

water.change.graph <- function(water.chng, max.days = 70, water.N, tank.N, gal, N.inc = 1){
  #params:
    #water.chng - what percent of the water do you change 
    #max.days - how mmany days into the future
    #water.N - Nitrates in water
    #tank.N - initial tank Nitrates
    #gal - gallons of water in tank
    #N.inc - how much does N increase a day
  
  N.chng <- c()
  
  cnhg.days <- 7       #how often do you change your tank's water?
  perm.cnhg.days <- 7  #how often do you change your tank's water?
  
  days = 0
  
  i <- 0
  while (days <= max.days){
    i <- i+1
    tank.N <- tank.N + N.inc
    if (days == cnhg.days) {
      cnhg.days <- cnhg.days + perm.cnhg.days
      tank.N <- water.change.calc(tank.N, water.chng, water.N)
      #N.chng <- c(N.chng, tank.N)
      
      }
    days <- days + 1
    N.chng[i] <- (tank.N)
    }
  return(N.chng[seq(1,length(x),7)])
}

params <- water.change.graph(water.chng = .4, water.N = 10, tank.N = 20, gal = 8.5)


plot(params)

ggplot(data = data.frame(params), aes(y=params, x=c(1:length(params)))) + 
  geom_point()















y_lim <- 30
x_lim <- 20





plot(water.change.graph(1), xlim = c(0,x_lim), 
     ylim = c(water.N,y_lim), xlab = "Week", ylab = "Nitrate ppm", pch = 16, col = 0)

lines(water.change.graph(1), xlim = c(0,x_lim), 
      ylim = c(water.N,y_lim), xlab = "Week", ylab = "Nitrate ppm", pch = 16, col = 0)

title("Nitrate Levels per Water Change")

amt <- 1 #percent changed

while (amt >= 0) {
  points(water.change.graph(amt), col = amt*10+1, pch = 16)
  lines(water.change.graph(amt), col = amt*10+1, pch = 16)
  
  amt <- amt - .1 
}

legend(18, 30, legend=c("0%","10%", "20%", "30%", "40%", "50%","60%","70%", "80%","90%","100%" ), col=c(11:1), pch = 16, cex=0.8, title = "Change%")



