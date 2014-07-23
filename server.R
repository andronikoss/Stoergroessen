

source("helpers.R")

shinyServer(function(input, output){
    output$densityPlot <- renderPlot({
        sim <- input$action
        select <- input$Number.of.Samples
        dichte <- reactive({input$checkbox}) 
        stoergroesse(select = select, dichte = dichte(), N = 1000, sim = sim)

        # Download
        output$downloadPlot <- downloadHandler(
            filename = function() { paste("errterm", '.jpeg', sep = '') },
            content = function(file) {
                jpeg(file,width = 1000, height = 600)
                stoergroesse(select = select, dichte = dichte(), N = 1000, sim = sim)
                dev.off()
            })
        
        
    })
})
