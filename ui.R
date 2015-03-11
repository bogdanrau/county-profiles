#####################################
# DOCUMENTATION FOR USING THE       #
# SHINY PACKAGE CAN BE FOUND AT     #
# http://shiny.rstudio.com/tutorial #
# County Profiles v0.0.1 (ui.R)     #
# Author & Copyright: Bogdan Rau    #
# Web: http://bogdanrau.com         #
#####################################

source("choices.R")
shinyUI(fluidPage(
  
  # PROVIDE TITLE OF THE PAGE: Includes <title> attribute and an <h1> #
  titlePanel("County Profiles"),
  # SET UP PAGE SIDEBAR W/ A SIDEBAR AND MAIN PANEL #
  sidebarLayout(
    sidebarPanel( # SIDEBAR PANEL
            # Set up row with options to select
            fluidRow(
                    column(12,
                           h5("Customize your query below:")
                    ),
            
                    column(12,
                           selectInput("population", label= h6("Select Population"),
                                       choices = population)
                    ),
                    column(12,
                           selectInput("year", label = h6("Select Year"),
                                       choices = year)
                    ),
                    column(12,
                           selectInput("locationType", label = h6("Select Geography"),
                                       choices = geography)
                    ),
                    conditionalPanel(
                            condition = "input.locationType == 'Counties'",
                            column(12,
                                   selectizeInput("coLocation", h6("Select County"),
                                                       choices = counties,
                                                  options = list(
                                                          placeholder = "Choose or Search for County",
                                                          onInitialize = I('function() { this.setValue(""); }')
                                                          ))
                            )),
                    conditionalPanel(
                            condition = "input.locationType == 'Regions'",
                            column(12,
                                   selectInput("regLocation", label = h6("Select Region"),
                                               choices = regions)
                            )),
                    column(12,
                           actionButton("getResults", "Get Results!", icon("download"))
                    )
                    )),
    mainPanel( # MAIN PANEL
            h4("The data contained in this website is not real."),
      dataTableOutput("results")
      
      ) 
    )
  ))