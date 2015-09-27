library(shiny)
library(BH)
library(markdown)
library(data.table)
library(rCharts)
library(dplyr)
library(DT)
library(ggplot2)
library(doBy)

# Load data
dataset <- read.csv("./data/activity.csv")

# Data Analysis
steps <- tapply(dataset$steps, dataset$date, sum, na.rm = TRUE)
steps_median <- median(steps)
steps_mean <- mean(steps)
##What is the average daily activity pattern?
##Processing Data
steps_by_interval<-as.data.frame(tapply(dataset$steps,  dataset$interval, sum, na.rm = TRUE))
steps_by_interval$intreval <- row.names(steps_by_interval)
names(steps_by_interval) <- c("steps","intreval")

dataTable <- datatable(dataset,option = list(iDisplayLength = 50))

#Shiny server main part
shinyServer(function(input,output){
        
        dataTable <- reactive({
                datatable(dataset,option = list(iDisplayLength = 50))
        })
        output$dTable <- renderDataTable({
                dataTable()
        })
        
        output$StepsTakenFrequency <- renderPlot({
                hist(steps, breaks = as.numeric(input$n_breaks),
                     xlab = "Steps",
                     main = "Steps Taken Frequency")
        })
        
        output$AveDailyPattern <- renderPlot({
                with(steps_by_interval, plot(intreval, steps, main = "Avarage Daily Acitivity", 
                                             type="l", xlab="Interval", ylab="Steps"))
        })
})