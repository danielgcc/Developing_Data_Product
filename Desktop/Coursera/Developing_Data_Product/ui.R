library(shiny)
library(BH)
library(markdown)
library(data.table)
library(rCharts)
library(dplyr)
library(DT)

shinyUI(
        navbarPage("Daily Acitivty Report",
                   tabPanel("Explora the Data",
                            sidebarPanel(
                                    selectInput(inputId = "n_breaks",
                                                label = "number of bar shown in histogram",
                                                choices = c(10,20,30,40,50),
                                                selected = 20)
                                    ),
                            mainPanel(
                                    tabsetPanel(
                                        tabPanel(p(icon("table"),"Dataset"),
                                                dataTableOutput(outputId="dTable")
                                                ),
                                        tabPanel(p(icon("line-chart"),"Visualize the data"),
                                                plotOutput(outputId ="StepsTakenFrequency", height="300px"),
                                                plotOutput(outputId ="AveDailyPattern", height="300px")
                                                )
                                                )
                                        )
                   )
                   
                 
        )
)