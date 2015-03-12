#####################################
# DOCUMENTATION FOR USING THE       #
# SHINY PACKAGE CAN BE FOUND AT     #
# http://shiny.rstudio.com/tutorial #
# County Profiles v0.0.1 (server.R) #
# Author & Copyright: Bogdan Rau    #
# Web: http://bogdanrau.com         #
#####################################
library(shiny)
shinyServer(function(input, output, session) {
    output$results <- renderDataTable({
        
        input$getResults ## Take a dependency on input$getResults button
        if(input$getResults == '0') { return() } ## Initial load with no button press, show nothing
        else {
            
            data <- isolate( ## Create data by concatenating different values from the input fields
                read.csv(file = paste("data/", input$year, "/", input$population, "/", input$locationType, "/",
                                      input$coLocation, ".csv", sep=""), check.names = FALSE)
            )
            print(data, type='html') # Print data to console to show on screen
            
            
        }
        
    },
    options = list( # data table options to remove certain additional/advanced features
        column.searchable = FALSE,
        searching = FALSE,
        paging = FALSE,
        ordering = FALSE,
        columnDefs =  list(
            list(targets = c(2), className = 'alignCenter'),
            list(targets = c(1), className = 'highlight')
        )
        
        
    )
    
    
    )
    
    output$insuranceStatus <- renderPlot({
        
        input$getResults
        if(input$getResults == '0') { return() }
        else {
            
            
            insurance <- isolate(read.csv(file = paste("data/", input$year, "/", input$population, "/", input$locationType , "/",
                                                       input$coLocation, ".csv", sep=""), check.names = FALSE, nrows=4, skip=3, header = FALSE, colClasses=c(NA, NA, "NULL")))
            insurance[['V2']] <- as.numeric(sub("%", "", insurance[['V2']]))
            insurance2 <- as.matrix(insurance)
            values <- insurance[,'V2']
            opar <- par(lwd = 0.1)
            mp <- barplot(insurance[,'V2'],
                          main="Insurance Status",
                          ylab="Adults aged 18-64 (%)",
                          ylim= range(pretty(c(0, values))),
                          xlab="Health Insurance",
                          names.arg=c("Uninsured", "Employer-Based", "Medi-Cal/HF", "Other"),
                          col=c("indianred2", "lightskyblue3", "lightskyblue3", "lightskyblue3"),
                          xpd=FALSE)
            text(mp, values, labels=values, pos=3, offset=-1.5, xpd=FALSE, font=2, col="white")
            abline(h=0, col="black", lwd=1)
            
        }})
    
    output$downloadPlot <- downloadHandler(
        # Specify the file name
        filename = function() {
            paste(input$coLocation, "png", sep=".")
        },
        content = function(file) {
            # open the device
            png(file, width = 580, height = 400)
            # create the plot
            input$getResults
            if(input$getResults == '0') { return() }
            else {
                
                
                insurance <- isolate(read.csv(file = paste("data/", input$year, "/", input$population, "/", input$locationType , "/",
                                                           input$coLocation, ".csv", sep=""), check.names = FALSE, nrows=4, skip=3, header = FALSE, colClasses=c(NA, NA, "NULL")))
                insurance[['V2']] <- as.numeric(sub("%", "", insurance[['V2']]))
                insurance2 <- as.matrix(insurance)
                values <- insurance[,'V2']
                opar <- par(lwd = 0.1)
                mp <- barplot(insurance[,'V2'],
                              main="Insurance Status",
                              ylab="Adults aged 18-64 (%)",
                              ylim= range(pretty(c(0, values))),
                              xlab="Health Insurance",
                              names.arg=c("Uninsured", "Employer-Based", "Medi-Cal/HF", "Other"),
                              col=c("indianred2", "lightskyblue3", "lightskyblue3", "lightskyblue3"),
                              xpd=FALSE)
                text(mp, values, labels=values, pos=3, offset=-1.5, xpd=FALSE, font=2, col="white")
                abline(h=0, col="black", lwd=1)
                
            }
            
            # close the device
            dev.off()
        }
    )
    
    
})
