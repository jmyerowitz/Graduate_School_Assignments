library(shiny)
library(shinythemes)
library(plotly)
library(ggplot2)
library(leaflet)
library(dplyr)

traildf <- read.csv("./data/NHMaineCompleteClusteredTrails2.csv")


# Define UI for application
ui <- fluidPage(
    
    #Selecting theme
    theme = shinytheme("cerulean"),
    
    #Title Page
    titlePanel("An In-Depth Look Into Maine and New Hampshire Hiking Trails"),
    
    #Navigation Bar
    navbarPage("Options",
               
               #Intro tab panel
               tabPanel("Intro",
                        h1("Hello There!!"),
                        br(),
                        h3("Welcome to my ShinyApp! This app was developed in order to look closely at hiking trails throughout",
                           "Maine and New Hampshire. I'm an avid hiker, and perhaps you are too! Feel free to use the app",
                           "to discover new trails. For the 'Maine vs. New Hampshire' tab, you can explore trails in either state.",
                           "I have also clustered the trails, so feel free to explore within the clusters in order to find", 
                           "new trails based off the trails that you already like.", "The widgets on the side in those tabs",
                           "will help you filter trails further down based on preference such as trail difficulty and route type,",
                           "amongst other characteristics. Some of the tabs are static, but others can be filtered via widget.",
                           "All plots (with the exception of the maps/leaflets) are plotly based, so they can be selected to view",
                           "certain elements.",
                           "Enjoy!"),
                        h3("All data was obtained via webscraping from", a("https://www.alltrails.com"), ".", 
                           "They're a wonderful site, so feel free to check them out!"),
                        br(),
                        img(src = "file2.jpeg", height = 400, width = 600),
                        img(src = "183.JPG", height = 400, width = 600),
                        img(src = "038.JPG", height = 400, width = 600),
                        br(),
                        h5("Images in order in left to right are: Mt. Washington via Tuckerman's Ravine,",
                           "Lookout over the Atlantic Ocean in Acadia National Park,",
                           "and Knife's Edge on Katahdin in Baxter State Park"),
                        h5("Author: Jordan Myerowitz"),
                        h5("jlt242@wildcats.unh.edu")
               ),
               
               #Second Tab Panel, Maine vs. NH
               tabPanel("Maine vs. New Hampshire",
                        
                        #Sidebar
                        sidebarPanel(
                            h3("How to Use the Widgets"),
                            helpText("Select your inputs below in order to",
                                     "find and visualize trails across",
                                     "New Hampshire and Maine"),
                            radioButtons(inputId = "state", h3("Select State"), 
                                         choices = list("New Hampshire", "Maine"), selected = "New Hampshire"),
                            checkboxGroupInput(inputId = "cluster", h3("Cluster Selection"), choices = c(0,1,2,3,4,5,6), 
                                               selected = c(0,1,2,3,4,5,6)),
                            selectInput(inputId = "difficulty", h3("Trail Difficulty"), 
                                        choices = list("Easy", "Moderate", "Hard"), selected = "Easy"),
                            checkboxGroupInput("checkGroup2", h3("Route Type"),
                                               choices = list("Loop", "Out & Back", "Point to Point"), selected = "Loop"),
                            sliderInput("slider1", h3("Elevation (feet)"), min = 0, max = 46000, value = 46000),
                            sliderInput("slider2", "Distance (miles)", min = 0, max = 170, value = 170),
                            actionButton("submit", "Apply Changes", icon("refresh"))
                        ),
                        
                        #Main Panel Maine vs. NH panel
                        mainPanel(
                            tabsetPanel(
                                tabPanel("Scatterplots",
                                         h3("Scatterplots of Trails by Elevation and Distance"),
                                         h4("This tab can be filtered, so filter away!"),
                                         plotlyOutput("scatterplotwhole"),
                                         plotlyOutput("scatterplotfiltered")),
                                tabPanel("Trail Table",
                                         h3("Table of Filtered Trails"),
                                         h4("This tab can be filtered, so filter away!"),
                                         tableOutput("table")),
                                tabPanel("Mapping the Filtered Trails",
                                         h3("Trails with Their Description"),
                                         h4("This tab can be fitlered, so filter away!"),
                                         h5("Icons made by", a("https://www.flaticon.com/authors/freepik")),
                                         leafletOutput("filteredleaflet"),
                                         h5("Trails with Their Rank"),
                                         leafletOutput("filteredleaflethiking")),
                                tabPanel("Analyzing Clusters by State",
                                         h4("This tab is a static rendering of cluster characteristics of trails.",
                                            "Please choose an option below:"),
                                         radioButtons(inputId = "state1", h4("Please Select Either State to Analyze Cluster Properties"),
                                                      choices = list("New Hampshire", "Maine"), 
                                                      selected = "Maine"),
                                         actionButton("submitstate", "Which State?"),
                                         plotlyOutput("clusteranalysis1"),
                                         plotlyOutput("clusteranalysis2"),
                                         plotlyOutput("clusteranalysis3"),
                                         plotlyOutput("clusteranalysis4"),
                                         plotlyOutput("clusteranalysis5")
                                         
                                         
                                )
                            )
                            
                        )
               ),
               
               #Looking at all the trails as a whole
               tabPanel("Looking at the Trails as a Whole",
                        
                        #Sidebar
                        sidebarPanel(
                            h3("How to Use the Widgets"),
                            helpText("Select your inputs below in order to",
                                     "find and visualize trails across",
                                     "New Hampshire and Maine"),
                            checkboxGroupInput(inputId = "ncluster", h3("Cluster Selection"), choices = c(0,1,2,3,4,5,6), 
                                               selected = c(0,1,2,3,4,5,6)),
                            selectInput(inputId = "ndifficulty", h3("Trail Difficulty"), 
                                        choices = list("Easy", "Moderate", "Hard"), selected = "Easy"),
                            checkboxGroupInput("ncheckGroup2", h3("Route Type"),
                                               choices = list("Loop", "Out & Back", "Point to Point"), selected = "Loop"),
                            sliderInput("nslider1", h3("Elevation (feet)"), min = 0, max = 46000, value = 46000),
                            sliderInput("nslider2", "Distance (miles)", min = 0, max = 170, value = 170),
                            actionButton("nsubmit", "Apply Changes", icon("refresh"))
                            
                        ),
                        
                        #Main panel for all trails
                        mainPanel(
                            tabsetPanel(
                                tabPanel("Scatterplots",
                                         h4("Scatterplots of Trails by Elevation and Distance"),
                                         plotlyOutput("nscatterplotwhole"),
                                         plotlyOutput("nscatterplotfiltered")),
                                tabPanel("Trail Table",
                                         h4("Table of Filtered Trails"),
                                         tableOutput("ntable")),
                                tabPanel("Mapping Trails Across Both states",
                                         h4("Trails with Their Description"),
                                         h5("Icons made by", a("https://www.flaticon.com/authors/freepik")),
                                         leafletOutput("nfilteredleaflet"),
                                         h5("Trails with Their Rank"),
                                         leafletOutput("nfilteredleaflethiking")),
                                tabPanel("Analyzing Clusters in Both States",
                                         h5("Analyzing Cluster Properties for Both Maine and New Hampshire"),
                                         plotlyOutput("nclusteranalysis1"),
                                         plotlyOutput("nclusteranalysis2"),
                                         plotlyOutput("nclusteranalysis3"),
                                         plotlyOutput("nclusteranalysis4"),
                                         plotlyOutput("nclusteranalysis5")
                                         
                                         
                                )
                            )
                        )
               )
               
    )
    
    
)

# Define server logic
server <- function(input, output) {
    
    
    #Changing variable type for graphs
    traildf$Cluster_number<- as.character(traildf$Cluster_number)
    traildf$Cluster_number_whole<- as.character(traildf$Cluster_number_whole)
    
    
    #--------------------Maine vs. NH tab outputs---------------------------------------------------------------#
    
    #Creating reactive dataframe that works with widgets input 
    df <- eventReactive(input$submit, {
        filter(traildf, State == input$state, Difficulty == input$difficulty, Route_Type == input$checkGroup2, 
               Cluster_number == input$cluster, Elevation_Feet <= input$slider1, Distance_Miles <= input$slider2)
        
    })
    
    #Unfilterable plotly scatterplot
    output$scatterplotwhole <- renderPlotly({
        g1 <- ggplot(traildf, aes(Distance_Miles, Elevation_Feet)) + geom_point(aes(color = Cluster_number_whole))+
            labs(title = "Maine and New Hampshire Trails by Elevation and Distance", x = "Distance (Miles)", 
                 y = "Elevation (Feet)", color = "Cluster Number")
        ggplotly(g1)
        
    })
    
    #Filterable plotly scatterplot
    output$scatterplotfiltered <- renderPlotly({
        g1 <- ggplot(df(), aes(Distance_Miles, Elevation_Feet)) + geom_point(aes(color = Cluster_number))+
            labs(title = paste(input$state, "Trails by Elevation and Distance, Filtered"), x = "Distance (Miles)", 
                 y = "Elevation (Feet)", color = "Cluster Number")
        ggplotly(g1)
        
    })
    
    #Filterable data table
    output$table<-renderTable({df()
    }) 
    
    #Defining colors for clusters
    clustercolor <- colorFactor(topo.colors(7), domain = traildf$Cluster_number)
    
    #Filterable leaflet output
    output$filteredleaflet <- renderLeaflet({ 
        leaflet(df()) %>%
            addTiles() %>%                   
            addCircleMarkers(lat=~Latitude, lng=~Longitude, popup = ~Description, radius = 8, stroke = FALSE,
                             color = ~clustercolor(Cluster_number), fillOpacity = 0.6) %>% 
            addLegend("bottomright", pal = clustercolor, values = ~Cluster_number, title = "Cluster Number")
        
    })
    
    #Defining icon use
    hikingIcon <- makeIcon(
        iconUrl = "https://image.flaticon.com/icons/svg/71/71423.svg",
        iconWidth = 20, iconHeight = 30,
    )
    
    #Defining rank as a character so that is can be shown via pop-up
    traildf$Rank <-as.character(traildf$Rank)
    
    #Leaflet as same trails as above, but with rank
    output$filteredleaflethiking <-renderLeaflet({
        leaflet(df()) %>%
            addTiles() %>%
            addMarkers(lng= ~Longitude, lat= ~Latitude, icon = hikingIcon, popup = ~Rank)
    })
    
    
    #Creating dataframe that is filterable by state only for static graphs of cluster analysis
    statedf <- eventReactive(input$submitstate, {
        filter(traildf, State == input$state)
        
    })
    
    #Analyzing clusters by difficulty
    output$clusteranalysis1 <- renderPlotly({
        g4 <- ggplot(statedf(), aes(Cluster_number)) + geom_bar(aes(fill = Route_Type), position = position_stack(reverse = TRUE)) +
            coord_flip() +
            labs(title = "Cluster Analysis by Route Type", x = "Cluster Number", y = "Number of Trails")
        ggplotly(g4)
        
    })
    
    #Analyzing Clusters by Difficulty
    output$clusteranalysis2 <- renderPlotly({
        g5 <- ggplot(statedf(), aes(Cluster_number)) + geom_bar(aes(fill = Difficulty), position = position_stack(reverse = TRUE)) +
            coord_flip() +
            labs(title = "Cluster Analysis by Difficulty", x = "Cluster Number", y = "Number of Trails")
        ggplotly(g5)
    })
    
    #Analyzing Cluster by Average Elevation
    output$clusteranalysis3 <- renderPlotly({
        g6 <- ggplot(statedf(), aes(Cluster_number, Elevation_Feet, fill = Cluster_number)) + geom_bar(stat = "summary", fun.y = "mean") +
            labs(title = "Average Elevation in Each Cluster", x = "Cluster Number", y = "Elevation (Feet)")
        ggplotly(g6)
    })
    
    #Analyzing Cluster by Average Distance
    output$clusteranalysis4 <- renderPlotly({
        g9 <- ggplot(statedf(), aes(Cluster_number, Distance_Miles, fill = Cluster_number)) + geom_bar(stat = "summary", fun.y = "mean") +
            labs(title = "Average Distance in Each Cluster", x = "Cluster Number", y = "Distance (Miles)")
        ggplotly(g9)
    })
    
    
    #-----------------------Whole trail panel outputs------------------------------------------------------#
    
    #Creating new dataframe that filters without state input
    ndf <- eventReactive(input$nsubmit, {
        filter(traildf, Difficulty == input$ndifficulty, Route_Type == input$ncheckGroup2, 
               Cluster_number_whole == input$ncluster, Elevation_Feet <= input$nslider1, Distance_Miles <= input$nslider2)
        
    })
    
    #Static scatterplot rendering of all the trails
    output$nscatterplotwhole <- renderPlotly({
        g1 <- ggplot(traildf, aes(Distance_Miles, Elevation_Feet)) + geom_point(aes(color = Cluster_number_whole))+
            labs(title = "Maine and New Hampshire Trails by Elevation and Distance", x = "Distance (Feet)", 
                 y = "Elevation (Miles)", color = "Cluster Number")
        ggplotly(g1)
        
    })
    
    #Filterable scatterplots of all the trails
    output$nscatterplotfiltered <- renderPlotly({
        g1 <- ggplot(ndf(), aes(Distance_Miles, Elevation_Feet)) + geom_point(aes(color = Cluster_number))+
            labs(title = "Filtered Trails by Elevation and Distance, Filtered", x = "Distance (Miles)", 
                 y = "Elevation (Feet)", color = "Cluster Number")
        ggplotly(g1)
        
    })
    
    #Data table of filterable data frame
    output$ntable<-renderTable({ndf()
    }) 
    
    #Defining cluster colors for above dataframe
    nclustercolor <- colorFactor(topo.colors(7), domain = traildf$Cluster_number_whole)
    
    
    #Leaflet filterable by widgets
    output$nfilteredleaflet <- renderLeaflet({ 
        leaflet(ndf()) %>%
            addTiles() %>%                   
            addCircleMarkers(lat=~Latitude, lng=~Longitude, popup = ~Description, radius = 8, stroke = FALSE,
                             color = ~clustercolor(Cluster_number_whole), fillOpacity = 0.6) %>% 
            addLegend("bottomright", pal = clustercolor, values = ~Cluster_number_whole, title = "Cluster Number")
        
    })
    
    
    #Same leaflet as above but with rank as the popup
    output$nfilteredleaflethiking <-renderLeaflet({
        leaflet(ndf()) %>%
            addTiles() %>%
            addMarkers(lng= ~Longitude, lat= ~Latitude, icon = hikingIcon, popup = ~Rank)
    })
    
    
    #Analyzing all trails clusters by route type
    output$nclusteranalysis1 <- renderPlotly({
        g4 <- ggplot(traildf, aes(Cluster_number_whole)) + geom_bar(aes(fill = Route_Type), position = position_stack(reverse = TRUE)) +
            coord_flip() +
            labs(title = "Cluster Analysis by Route Type", x = "Cluster Number", y = "Number of Trails")
        ggplotly(g4)
        
    })
    
    #Analyzing Clusters by Difficulty
    output$nclusteranalysis2 <- renderPlotly({
        g5 <- ggplot(traildf, aes(Cluster_number_whole)) + geom_bar(aes(fill = Difficulty), position = position_stack(reverse = TRUE)) +
            coord_flip() +
            labs(title = "Cluster Analysis by Difficulty", x = "Cluster Number", y = "Number of Trails")
        ggplotly(g5)
    })
    
    #Analyzing Cluster by Average Elevation
    output$nclusteranalysis3 <- renderPlotly({
        g6 <- ggplot(traildf, aes(Cluster_number_whole, Elevation_Feet, fill = Cluster_number_whole)) + geom_bar(stat = "summary", fun.y = "mean") +
            labs(title = "Average Elevation in Each Cluster", x = "Cluster Number", y = "Elevation (Feet)")
        ggplotly(g6)
    })
    
    #Analyzing Cluster by Average Distance
    output$nclusteranalysis4 <- renderPlotly({
        g9 <- ggplot(traildf, aes(Cluster_number_whole, Distance_Miles, fill = Cluster_number_whole)) + geom_bar(stat = "summary", fun.y = "mean") +
            labs(title = "Average Distance in Each Cluster", x = "Cluster Number", y = "Distance (Miles)")
        ggplotly(g9)
    })
    
    
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
