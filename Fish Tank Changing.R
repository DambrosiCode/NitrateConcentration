water_N = 10 #nitrates in tap water
tank_N = 20  #nitrates in tank
gal = 8.5    #gallons in tank
N_inc = 1 #how much do your nitrates increase per day

#keep these the same#
change_days = 7       #how often do you change your tank's water?
perm.change_days = 7  #how often do you change your tank's water?
###


max_days = 280
days = 0    
N_change = c(tank_N)


water.change.calc = function(total_N, w_change){
  new_total_N = ((total_N*(w_change)+(water_N*(1-w_change))))
  return(new_total_N)
}

water.change.graph = function(w_change){
  while (days <= max_days){
    tank_N = tank_N + N_inc
    if (days == change_days) {
      change_days = change_days + perm.change_days
      tank_N = water.change.calc(tank_N, w_change)
      N_change = c(N_change, tank_N)
      }
    days = days + 1
    }
  return(N_change)
}

y_lim = 30
x_lim = 20

plot(water.change.graph(1), xlim = c(0,x_lim), ylim = c(water_N,y_lim), xlab = "Week", ylab = "Nitrate ppm", pch = 16, col = 0)
lines(water.change.graph(1), xlim = c(0,x_lim), ylim = c(water_N,y_lim), xlab = "Week", ylab = "Nitrate ppm", pch = 16, col = 0)

title("Nitrate Levels per Water Change")

amt = 1 #percent changed
while (amt >= 0) {
  points(water.change.graph(amt), col = amt*10+1, pch = 16)
  lines(water.change.graph(amt), col = amt*10+1, pch = 16)
  
  amt = amt - .1 
}

legend(18, 30, legend=c("0%","10%", "20%", "30%", "40%", "50%","60%","70%", "80%","90%","100%" ), col=c(11:1), pch = 16, cex=0.8, title = "Change%")
