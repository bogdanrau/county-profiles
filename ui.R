#####################################
# DOCUMENTATION FOR USING THE       #
# SHINY PACKAGE CAN BE FOUND AT     #
# http://shiny.rstudio.com/tutorial #
# County Profiles v0.0.1 (ui.R)     #
# Author & Copyright: Bogdan Rau    #
# Web: http://bogdanrau.com         #
#####################################
## Load additional scripts
source("choices.R")
source("inputOptions.R")
library(shiny)
## Begin ShinyUI
shinyUI(fluidPage(
    
    ## Set title of the page (includes <h1> tag)
    titlePanel("County Profiles"),
    
    ## Set up page with a sidebar and main panel
    sidebarLayout(
        sidebarPanel(
            fluidRow(
                column(12, h5("Customize your query below:")),
                column(12, selectInput("population", label = h6("Select Population"), choices = population)),
                column(12, selectInput("year", label = h6("Select Year"), choices = year)),
                column(12, selectInput("locationType", label = h6("Select Geographic Level"), choices = geography)),
                conditionalPanel(
                    condition = "input.locationType == 'Counties'",
                    column(12, selectizeInput("coLocation", h6("Select County"), choices = counties, options = coOptions))
                    ),
                conditionalPanel(
                    condition = "input.locationType == 'Regions'",
                    column(12, selectizeInput("regLocation", h6("Select Region"), choices = regions, options = regOptions))
                    ),
                column(12, actionButton("getResults", label = "Get results!"))
                )
            ),
        
        mainPanel(
            plotOutput("insuranceStatus"),
            dataTableOutput("results")
            )
        )
    
    ))