library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Shiny Application and Reproducible Pitch - Sberbank Open Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      uiOutput("region"),
      uiOutput("rname"),
      
      radioButtons("period", "Choose a time period:", 
                   c("Date range"="mon",
                     "Years" = "year",
                     "From the year begin" = "yearbegin",
                     "All the time" = "all"),
                   selected = "all"),
      uiOutput("slider1"),
      uiOutput("slider2"),
      uiOutput("dates"),
      checkboxGroupInput("chkGroup", label = h3("Geom smooth"), 
                         choices = list("Auto" = 1, "Linear model" = 2, "Poly Model" = 3),
                         selected = 1)
    ),
    
                   
    # Show a plot of the generated distribution
    mainPanel(
      h3(textOutput("text1")),
      plotlyOutput("distPlot")
    )
  ),
  
  hr(),
  
  fluidRow(
    column(4, h3("Sberbank Open Data plotting tool using Shiny"), h5("by Raghavendra Dabral")),
    column(6, 
          h3("Synopsis"),
          p("This app was created to showcase a shiny application for the Coursera JHU Data Science Specialization.
            The server code along with the UI code is available in my ", a("GitHub repository.", href = "https://github.com/raghav-211/shiny-application-reproducible-pitch")),
          p("Depending on the area and the product in Russia, Sberbank holds somewhere between 40% and 90% of the financial services industry. 140 million private and 1.5 million business users' data are analysed."),
          p("Big Data from Sberbank contains details about some of the nation's economic processes. These statistics are available
            at ", a("Opendata Sberbank", href = "http://www.sberbank.com/ru/opendata"), (" and the "), a("official English website.", href="http://www.sberbank.com") ),
          h3("Instructions and User Guide"),
          p("To manipulate the data and plot it, the app has a number of inputs. The user can choose a measurement, a region, and a time frame."),
          HTML("<ol>
                <li>Select a region</li>
                <li>Select a variable</li>
                <li>Select a time period:</li>
                <ul>
                  <li>Date range - specifies the begining date and end dates of showing data</li>
                  <li>Years - a slider that specifies the years of showing data</li>
                  <li>From the year begin - a slider that specifies from the begin of which year to show the data</li>
                  <li>Finally, All the time - showing the data for all the time</li>
                </ul>
               </ol>"),
          
          p("Additionally, the user could choose an approximation model for the data:"),
          HTML("<ul>
                  <li>Auto - the plot generates an approximation curve automatically</li>
                  <li>Linear model - the plot generates Linear approximation model curve</li>
                  <li>Poly model - the plot generates polynom model curve for the presented data</li>
                </ul>")
          )
           
  )
  
)
)
