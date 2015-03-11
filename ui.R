#####################################
# DOCUMENTATION FOR USING THE       #
# SHINY PACKAGE CAN BE FOUND AT     #
# http://shiny.rstudio.com/tutorial #
# County Profiles v0.0.1 (ui.R)     #
# Author & Copyright: Bogdan Rau    #
# Web: http://bogdanrau.com         #
#####################################
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
                                       choices = list("0-17 (Child & Teen)" = "0-17",
                                                      "18-64 (Adults)" = "18-64"))
                    ),
                    column(12,
                           selectInput("year", label = h6("Select Year"),
                                       choices = list("2009" = 2009,
                                                      "2011-2012" = "2011-2012",
                                                      "2012-2013" = 2012)
                    )),
                    column(12,
                           selectInput("locationType", label = h6("Select Geography"),
                                       choices = list("Counties" = "Counties",
                                                      "Regions" = "Regions",
                                                      "SPAs" = "SPAs",
                                                      "HHSAs" = "HHSAs"))
                    ),
                    conditionalPanel(
                            condition = "input.locationType == 'Counties'",
                            column(12,
                                   selectizeInput("coLocation", h6("Select County"),
                                                       choices = list("Los Angeles" = "LosAngeles",
                                                                      "Orange" = "Orange",
                                                                      "San Diego" = "SanDiego",
                                                                      "Riverside" = "Riverside"),
                                                  options = list(
                                                          placeholder = "Choose or Search for County",
                                                          onInitialize = I('function() { this.setValue(""); }')
                                                          ))
                            )),
                    conditionalPanel(
                            condition = "input.locationType == 'Regions'",
                            column(12,
                                   selectInput("regLocation", label = h6("Select Region"),
                                               choices = list("Central Coast" = "CentralCoast",
                                                              "Greater Bay Area" = "GreaterBayArea",
                                                              "Los Angeles County" = "LosAngelesCounty",
                                                              "Norther Sierra" = "NorthernSierra"))
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