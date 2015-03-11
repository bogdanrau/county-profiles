#####################################
# DOCUMENTATION FOR USING THE       #
# SHINY PACKAGE CAN BE FOUND AT     #
# http://shiny.rstudio.com/tutorial #
# County Profiles v0.0.1 (server.R) #
# Author & Copyright: Bogdan Rau    #
# Web: http://bogdanrau.com         #
#####################################

shinyServer(function(input, output) {
        
        output$results <- renderDataTable({
                
                input$getResults
                if(input$getResults == '1') {
                        print(data <- read.csv(file = paste("data/", input$year, "/", input$population, "/", input$locationType, "/",
                                                      input$coLocation, ".csv", sep=""), check.names = FALSE))
                        
                }
                
        }, options = list(
                column.searchable = FALSE,
                searching = FALSE,
                paging = FALSE,
                ordering = FALSE
                ))
        
})
