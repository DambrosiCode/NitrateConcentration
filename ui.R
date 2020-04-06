#UI
ui<-fluidPage(
  #title
  titlePanel("Fish Tank Change Estimator"),
  
  #Sidebar
  sidebarLayout(
    #inputs
    sidebarPanel(
      #slider input: Water Change
      numericInput(inputId = "waterChng",
                   label = "What percent of water do you change?",
                   max = 1,
                   min = 0,
                   value = .25,
                   step=.1),
      
      #slider input: N in water
      numericInput(inputId = "waterN",
                   label = "Total N in water used for changing",
                   value = 5),
      
      #slider input: N in tank
      numericInput(inputId = "tankN",
                   label = "Total N in Tank",
                   value = 5),
      
      #slider input: N daily increase   
      numericInput(inputId = "nInc",
                   label = "How much does your N increase daily?",
                   value = .1,
                   step = .1),
      
      #slider input: Max Days Out
      numericInput(inputId = "maxDays",
                   label = "How many days out?",
                   value = 140,
                   step = 28)
    ),
    mainPanel(
      #OUTPUT: linegraph
      plotOutput(outputId = "changeInN")
    )
  )
)