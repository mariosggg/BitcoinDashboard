## app.R ##
library(shiny)
library(shinydashboard)
library(plotly)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Bitcoin_Data_by_Day", tabName = "Bitcoin_Data_by_Day", icon = icon("Dashboard")),
      menuItem("Bitcoin_Data_by_Hour", tabName = "Bitcoin_Data_by_Hour", icon = icon("Bitcoin_Data_by_Hour")),
      menuItem("Bitcoin_Data_by_Week", tabName = "Bitcoin_Data_by_week", icon = icon("Bitcoin_Data_by_week"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "Bitcoin_Data_by_Day",
              fluidRow(
                tabBox(
                  title = "First tapbox",
                  id = "tabset1", height = "500px",
                  fig <- plot_ly(crypto1, x = ~date, y = ~high, type = 'scatter', mode = 'lines') %>% 
                    layout(title = "the highest price in the specific date", xaxis = list(title = "date"), 
                           yaxis = list(title = "high "))
                ),
                tabBox(
                  title = "Second tapbox",
                  id = "tabset1", height = "500px",
                  fig <- plot_ly(data = crypto1, x = ~open, y = ~number.of.trades)%>% 
                    layout(title = "number of price trades in open time ", xaxis = list(title = "price"), 
                           yaxis = list(title = "number.of.trades "))
                ),
                tabBox(
                  title = "Third tapbox",
                  fig <- plot_ly(data=crypto1,x=~low,type="histogram")%>%
                    layout(title = "the lowest price of bitcoins")
                ),
                tabBox(
                  title = "Fourth tapbox",
                  fig <- plot_ly(crypto1, x = ~close, y = ~taker.buy.base.asset, type = 'scatter') %>% 
                    layout(title = "the amount of bitcoins that received in time", xaxis = list(title = "time"), 
                           yaxis = list(title = "the amount of bitcoins"))
                )
              )
      ),
      
      tabItem(tabName = "Bitcoin_Data_by_Hour",
              fluidRow(
              
                tabBox(
                 
                  title = "First tapbox",
                  id = "tabset1", height = "500px",
                  fig <- plot_ly(crypto2, x = ~date, y = ~high, type = 'scatter', mode = 'lines') %>% 
                    layout(title = "the highest price in the specific date", xaxis = list(title = "date"), 
                           yaxis = list(title = "high "))
                ),
                tabBox(
                  title = "Second tapbox",
                  id = "tabset1", height = "500px",
                  fig <- plot_ly(data = crypto2, x = ~open, y = ~number.of.trades)%>% 
                    layout(title = "number of price trades in open time ", xaxis = list(title = "price"), 
                           yaxis = list(title = "number.of.trades "))
                ),
                tabBox(
                  title = "Third tapbox",
                  fig <- plot_ly(data=crypto2,x=~low,type="histogram")%>%
                    layout(title = "the lowest price of bitcoins")
                ),
                tabBox(
                  title = "Fourth tapbox",
                  fig <- plot_ly(crypto2, x = ~close, y = ~taker.buy.base.asset, type = 'scatter') %>% 
                    layout(title = "the amount of bitcoins that received in time", xaxis = list(title = "time"), 
                           yaxis = list(title = "the amount of bitcoins"))
                )
              )
      ),
      
      tabItem(tabName = "Bitcoin_Data_by_Week",
              fluidRow(
                tabBox(
                  title = "First tapbox",
                  id = "tabset1", height = "500px",
                  fig <- plot_ly(crypto3, x = ~Date, y = ~Open, type = 'scatter', mode = 'lines') %>% 
                    layout(title =" the specific date in open time", xaxis = list(title = "date"), 
                           yaxis = list(title = "high "))
                ),
                tabBox(
                  title = "Second tapbox",
                  id = "tabset1", height = "500px",
                  fig <- plot_ly(data = crypto3, x = ~Open, y = ~Close)%>% 
                    layout(title = "number of price trades in open time ", xaxis = list(title = "price"), 
                           yaxis = list(title = "number.of.trades "))
                ),
                tabBox(
                  title = "Third tapbox",
                  fig <- plot_ly(data=crypto3,x=~Low,type="histogram")%>%
                    layout(title = "the lowest price of bitcoins")
                ),
                tabBox(
                  title = "Fourth tapbox",
                  fig <- plot_ly(crypto3, x = ~Adj.Close, y = ~Volume, type = 'scatter') %>% 
                    layout(title = "the amount of bitcoins that received in time", xaxis = list(title = "time"), 
                           yaxis = list(title = "the amount of bitcoins"))
                )
              )
      )
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    
 
      
      
      
      
      
    )
    
  )
)
server <- function(input, output) {  }

shinyApp(ui, server)