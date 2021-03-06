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
    tags$head(tags$style(".table .alignCenter { text-align: center; width: 110px; }
                         .table .highlight { text-align: center; background-color: #ebebeb; width: 110px; }
                         tfoot { display:none; }
                         .container-fluid { margin-top: 5px; }
                         ")),
    ## Set title of the page (includes <h1> tag)
    #titlePanel("County Profiles"),
    
    ## Set up page with a sidebar and main panel
    sidebarLayout(
        sidebarPanel(
            fluidRow(
                column(12, h4("County Profiles v0.0.1")),
                column(12, h6("NOT FOR PUBLIC USE - CURRENTLY USING DUMMY DATA")),
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
            conditionalPanel(
                condition = "input.getResults > 0",
                downloadButton(outputId = "downloadPlot", label = "Download Chart"),
                downloadButton(outputId = "downloadTable", label = "Download Table (.csv)"),
                htmlOutput(outputId = "downloadPDF", inline = TRUE)),
            plotOutput("insuranceStatus", width="auto", height=330),
            dataTableOutput("results")
            )
        )
    
    ))