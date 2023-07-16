library(shiny)

shinyUI(
  navbarPage("Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and Ozone"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Solar.R" = "Solar.R",
                                          "Wind" = "Wind",
                                          "Temp" = "Temp",
                                          "Month" = "Month",
                                          "Day" = "Day"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("AirQualityBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("AirQualityPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("About the Data Set",
                      
                      h3("Regression Models Course Project (from Coursera)"),
                      helpText("You are reviewing the impact of air quality variables on one another.",
                               "You want to view relationships between this data"),
                      h3("Important"),
                      p("A data frame with 153 observations on 6 variables."),
                      
                      a("https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/airquality.html")
             ),
             tabPanel("More Data Detail",
                      h2("Air Quality Data"),
                      hr(),
                      h3("Description"),
                      helpText("This data is from the R dataset AirQuality",
                               " It will be used for DDP Assignment 4",
                               " The data looks at environemtnal variables for air quality"),
                      h3("Format"),
                      p("A data frame with 153 observations on 6 variables."),
                      
                      p("  [, 1]   Ozone (ppb)"),
                      p("  [, 2]	 Solar R (lang)"),
                      p("  [, 3]	 Wind (mph)"),
                      p("  [, 4]	 Temperature (degrees F)"),
                      p("  [, 5]	 Month (1--12)"),
                      p("  [, 6]	 Day of month (1--31)"),
                     
                      
                      h3("Source"),
                      
                      p("The data were obtained from the New York State Department of Conservation (ozone data) and the National Weather Service (meteorological data).")
             ),
             tabPanel("Go back to my Github repository",
                      a("https://github.com/mpalombo512/Datasciencecoursera"),
                      hr(),
                      h4("I hope you like the Shiny App"),
                      h4("The name of the repository is Datasciencecoursera")
             )
  )
)
