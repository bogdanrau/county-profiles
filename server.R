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
    data <- data.frame()
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
        column.searchable = 1,
        searching = TRUE,
        paging = TRUE,
        pageLength = 6,
        ordering = FALSE,
        columnDefs =  list(
            list(targets = c(2), className = 'alignCenter'),
            list(targets = c(1), className = 'highlight')
        ),
        lengthMenu = c(5,10,15,20)
        
        
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
            text(mp, values, labels=values, pos=3, offset=-1, xpd=FALSE, font=2, col="white")
            abline(h=0, col="black", lwd=1)
            
        }}, width = "auto", height = 330)
    
    output$downloadPlot <- downloadHandler(
        # Specify the file name
        filename = function() {
            paste(input$coLocation, "png", sep=".")
        },
        content = function(file) {
            # open the device
            png(file, width = 1740, height = 990, res = 220)
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
                text(mp, values, labels=values, pos=3, offset=-1, xpd=FALSE, font=2, col="white")
                abline(h=0, col="black", lwd=1)
                
            }
            
            # close the device
            dev.off()
        }
    )
    
    output$downloadTable <- downloadHandler(
        
        filename = function() {
            paste(input$coLocation, "csv", sep=".")
        },
        
        content = function(file) {
            
            
                data <- ## Create data by concatenating different values from the input fields
                    read.csv(file = paste("data/", input$year, "/", input$population, "/", input$locationType, "/",
                                          input$coLocation, ".csv", sep=""), check.names = FALSE)
                
            
            
            write.csv(data, file, row.names=FALSE)
        }
        
        )
    
    output$downloadPDF <- renderUI({
        downloadUrl <- paste0('http://healthpolicy.ucla.edu/health-profiles/adults/Documents/2012-2013/Counties/', input$coLocation, '.pdf')
        tags$a(tags$i(' Download Report (.pdf)', class = 'fa fa-file-pdf-o'), href=downloadUrl, inline = TRUE, class = 'btn btn-default shiny-download-link  shiny-bound-output', target = '_blank')
    })
    
})
