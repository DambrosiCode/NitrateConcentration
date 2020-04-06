library(shiny)
library(ggplot2)

#calculates how much N levels change
water.change.calc <- function(total_N, water.chng, water.N){
  #total_N - starting Nitrates in tank
  #water.chng 0.n amount changed 
  #returns new nitrate level
  water.chng <- 1-water.chng
  
  new_total_N <- ((total_N*(water.chng)+(water.N*(1-water.chng))))
  return(new_total_N) #new nitrate concentration 
}
#calculates N levels over time on a week-by-week basis
water.change.graph <- function(water.chng, max.days = 70, water.N, tank.N, N.inc = 1){
  #params:
  #water.chng - what percent of the water do you change 
  #max.days - how mmany days into the future
  #water.N - Nitrates in water
  #tank.N - initial tank Nitrates
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
  return(N.chng[seq(1,length(N.chng),7)])
}

server <- function(input, output){
  #graphical outpu
  output$changeInN <- renderPlot({
    params <- water.change.graph(water.chng = input$waterChng,
                                 max.days   = input$maxDays, 
                                 water.N    = input$waterN, 
                                 tank.N     = input$tankN, 
                                 N.inc      = input$nInc)
    plot(params, ylim = c(0,max(params)), ylab = ("Nitrate ppm"), xlab = ("Week"))
  })
}




