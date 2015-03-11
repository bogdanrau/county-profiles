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
        
        input$getResults ## Take a dependency on input$getResults button
        if(input$getResults == '0') { return() } ## Initial load with no button press, show nothing
        else {
            
            data <- isolate( ## Create data by concatenating different values from the input fields
                read.csv(file = paste("data/", input$year, "/", input$population, "/", input$locationType, "/",
                                      input$coLocation, ".csv", sep=""), check.names = FALSE)
                )
            print(data) # Print data to console to show on screen
        }
        
    },
    options = list( # data table options to remove certain additional/advanced features
        column.searchable = FALSE,
        searching = FALSE,
        paging = FALSE,
        ordering = FALSE
    )
    
    )
    
})
