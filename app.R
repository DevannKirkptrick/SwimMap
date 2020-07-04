library(dplyr)
library(ggplot2)
library(shiny)
library(DT)
library(ggrepel)
library(tidyr)
library(shinycssloaders)
library(shinythemes)
library(SwimmeR)

#Import Data
CovidConfirmed <- read_csv("https://usafactsstatic.blob.core.windows.net/public/data/covid-19/covid_confirmed_usafacts.csv")
CountyPop <- read_csv("https://usafactsstatic.blob.core.windows.net/public/data/covid-19/covid_county_population_usafacts.csv")


# Define UI
ui <- fluidPage(
  
#Navbar structure for UI
  navbarPage(titlePanel("Organizing Meridies with COVID-19"),
                          #shinythemes::themeSelector(),
                          fluidRow(column(1,
                                          
                                          # input Zipcode to plot
                                          numericInput("zipcodeinput", "Input a zipcode in Meridies", min = 0.00, step = 1, value = 1),
                                          # input attendees expectd
                                          numericInput("Attendees", "Number of Attendees Expected", min = 0.00, step = 1, value = 1)
                        )
             )
  )
)

# Define server
server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView(33, 84, zoom = 6)
  })
}  
# Run the application 
shinyApp(ui = ui, server = server)

