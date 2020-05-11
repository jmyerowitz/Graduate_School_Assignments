#Loading in libraries (I didn't end up using RSelenium)
library(rvest)
library(tidyverse)

#Checking the working directory and setting the right one
getwd()
setwd("C:/Users/Jordan/Desktop/DATA 900 Web-Scraping")


#I ended up having to download the page with all the Top trails in New Hampshire pre-loaded and downloaded to my 
# computer. As such, the read_html() is set to read an html file on my computer
alltrails <- read_html("C:/Users/Jordan/Desktop/DATA 900 Web-Scraping/Best Trails in New Hampshire _ AllTrails.html")

#Setting object to pipe through for trail urls
currentpage <- alltrails

#Piping through for the url of each trail that I want
trail_links <- currentpage %>%
  html_nodes("li.sortable") %>% #Going through each "sortable" node that's a trail
  html_nodes("a.item-link") %>% #going to that trail link
  html_attr("href") #pull the individual trail link
trail_links

#I tried to do it in one such and experienced time-out errors. I sliced the list to easier to handle sizes. You could try
# to nest the for loop, but that threw an error for me too, so I just played it safe. 
trail_link_1 <- trail_links[1:150]
trail_link_2 <- trail_links[151:300]
trail_link_3 <- trail_links[301:450]
trail_link_4 <- trail_links[451:600]
trail_link_5 <- trail_links[601:750]
trail_link_6 <- trail_links[751:900]
trail_link_7 <- trail_links[901:1050]
trail_link_8 <- trail_links[1051:1196]


#Initializing empty lists to grab each trail Distance, Elevation, Route Type, Description, Name, and Difficulty
Distance <- c()
Elevation <- c()
Route_type <- c()
Description <- c()
Trail_name <- c()
Difficulty <- c()

#Looping through each link for the above attributes (but using html_text :)) in the first chunk
for(i in trail_link_1){
  trail_info <- read_html(i)
  distance <- trail_info %>% 
    html_nodes("section#trail-stats") %>% #This section is pulling the distance from the web page
    html_node("span.distance-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Distance <- append(Distance, distance)
  elevation <- trail_info %>% 
    html_nodes("section#trail-stats") %>% #This one is pulling elevation
    html_node("span.elevation-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Elevation <- append(Elevation, elevation)
  route_type <- trail_info %>% 
    html_nodes("section#trail-stats") %>% #And this one is pulling route type
    html_nodes("span.detail-data") %>% 
    nth(3) %>% # I couldn't get it to work without using "nth", something about detail data beginning the other trail stats
    html_text()
  Route_type <- append(Route_type, route_type)
  description <- trail_info %>% 
    html_node("p#auto-overview.xlate-google.line-clamp-4") %>% #pulling the description
    html_text()
  Description <- c(Description, description)
  trail_name <- trail_info %>% 
    html_node("div#title-and-difficulty") %>% #Grabbing the trail name
    html_node("h1.xlate-none") %>% 
    html_text()
  Trail_name <- append(Trail_name, trail_name)
  trail_info <- read_html(i)
  difficulty <- trail_info %>% 
    html_nodes("div#difficulty-and-rating") %>% #Getting the difficulty
    html_node("span.diff") %>% 
    nth(1) %>%  #Using nth again
    html_text() 
  Difficulty <- append(Difficulty, difficulty)

}
#Same for the second chunk
for(i in trail_link_2){
  trail_info <- read_html(i)
  distance <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.distance-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Distance <- append(Distance, distance)
  elevation <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.elevation-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Elevation <- append(Elevation, elevation)
  route_type <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_nodes("span.detail-data") %>% 
    nth(3) %>% 
    html_text()
  Route_type <- append(Route_type, route_type)
  description <- trail_info %>% 
    html_node("p#auto-overview.xlate-google.line-clamp-4") %>% 
    html_text()
  Description <- c(Description, description)
  trail_name <- trail_info %>% 
    html_node("div#title-and-difficulty") %>% 
    html_node("h1.xlate-none") %>% 
    html_text()
  Trail_name <- append(Trail_name, trail_name)
  trail_info <- read_html(i)
  difficulty <- trail_info %>% 
    html_nodes("div#difficulty-and-rating") %>% 
    html_node("span.diff") %>% 
    nth(1) %>% 
    html_text() 
  Difficulty <- append(Difficulty, difficulty)
  
}

#And the 3rd
for(i in trail_link_3){
  trail_info <- read_html(i)
  distance <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.distance-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Distance <- append(Distance, distance)
  elevation <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.elevation-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Elevation <- append(Elevation, elevation)
  route_type <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_nodes("span.detail-data") %>% 
    nth(3) %>% 
    html_text()
  Route_type <- append(Route_type, route_type)
  description <- trail_info %>% 
    html_node("p#auto-overview.xlate-google.line-clamp-4") %>% 
    html_text()
  Description <- c(Description, description)
  trail_name <- trail_info %>% 
    html_node("div#title-and-difficulty") %>% 
    html_node("h1.xlate-none") %>% 
    html_text()
  Trail_name <- append(Trail_name, trail_name)
  trail_info <- read_html(i)
  difficulty <- trail_info %>% 
    html_nodes("div#difficulty-and-rating") %>% 
    html_node("span.diff") %>% 
    nth(1) %>% 
    html_text() 
  Difficulty <- append(Difficulty, difficulty)
  
}

#And the 4th...
for(i in trail_link_4){
  trail_info <- read_html(i)
  distance <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.distance-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Distance <- append(Distance, distance)
  elevation <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.elevation-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Elevation <- append(Elevation, elevation)
  route_type <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_nodes("span.detail-data") %>% 
    nth(3) %>% 
    html_text()
  Route_type <- append(Route_type, route_type)
  description <- trail_info %>% 
    html_node("p#auto-overview.xlate-google.line-clamp-4") %>% 
    html_text()
  Description <- c(Description, description)
  trail_name <- trail_info %>% 
    html_node("div#title-and-difficulty") %>% 
    html_node("h1.xlate-none") %>% 
    html_text()
  Trail_name <- append(Trail_name, trail_name)
  trail_info <- read_html(i)
  difficulty <- trail_info %>% 
    html_nodes("div#difficulty-and-rating") %>% 
    html_node("span.diff") %>% 
    nth(1) %>% 
    html_text() 
  Difficulty <- append(Difficulty, difficulty)
  
}

#And Fifth
for(i in trail_link_5){
  trail_info <- read_html(i)
  distance <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.distance-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Distance <- append(Distance, distance)
  elevation <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.elevation-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Elevation <- append(Elevation, elevation)
  route_type <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_nodes("span.detail-data") %>% 
    nth(3) %>% 
    html_text()
  Route_type <- append(Route_type, route_type)
  description <- trail_info %>% 
    html_node("p#auto-overview.xlate-google.line-clamp-4") %>% 
    html_text()
  Description <- c(Description, description)
  trail_name <- trail_info %>% 
    html_node("div#title-and-difficulty") %>% 
    html_node("h1.xlate-none") %>% 
    html_text()
  Trail_name <- append(Trail_name, trail_name)
  trail_info <- read_html(i)
  difficulty <- trail_info %>% 
    html_nodes("div#difficulty-and-rating") %>% 
    html_node("span.diff") %>% 
    nth(1) %>% 
    html_text() 
  Difficulty <- append(Difficulty, difficulty)
  
}

#The 6th....
for(i in trail_link_6){
  trail_info <- read_html(i)
  distance <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.distance-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Distance <- append(Distance, distance)
  elevation <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.elevation-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Elevation <- append(Elevation, elevation)
  route_type <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_nodes("span.detail-data") %>% 
    nth(3) %>% 
    html_text()
  Route_type <- append(Route_type, route_type)
  description <- trail_info %>% 
    html_node("p#auto-overview.xlate-google.line-clamp-4") %>% 
    html_text()
  Description <- c(Description, description)
  trail_name <- trail_info %>% 
    html_node("div#title-and-difficulty") %>% 
    html_node("h1.xlate-none") %>% 
    html_text()
  Trail_name <- append(Trail_name, trail_name)
  trail_info <- read_html(i)
  difficulty <- trail_info %>% 
    html_nodes("div#difficulty-and-rating") %>% 
    html_node("span.diff") %>% 
    nth(1) %>% 
    html_text() 
  Difficulty <- append(Difficulty, difficulty)
  
}

#The 7th...
for(i in trail_link_7){
  trail_info <- read_html(i)
  distance <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.distance-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Distance <- append(Distance, distance)
  elevation <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.elevation-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Elevation <- append(Elevation, elevation)
  route_type <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_nodes("span.detail-data") %>% 
    nth(3) %>% 
    html_text()
  Route_type <- append(Route_type, route_type)
  description <- trail_info %>% 
    html_node("p#auto-overview.xlate-google.line-clamp-4") %>% 
    html_text()
  Description <- c(Description, description)
  trail_name <- trail_info %>% 
    html_node("div#title-and-difficulty") %>% 
    html_node("h1.xlate-none") %>% 
    html_text()
  Trail_name <- append(Trail_name, trail_name)
  trail_info <- read_html(i)
  difficulty <- trail_info %>% 
    html_nodes("div#difficulty-and-rating") %>% 
    html_node("span.diff") %>% 
    nth(1) %>% 
    html_text() 
  Difficulty <- append(Difficulty, difficulty)
  
}

#And the 8th!
for(i in trail_link_8){
  trail_info <- read_html(i)
  distance <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.distance-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Distance <- append(Distance, distance)
  elevation <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_node("span.elevation-icon") %>% 
    html_node("span.detail-data.xlate-none") %>% 
    html_text() 
  Elevation <- append(Elevation, elevation)
  route_type <- trail_info %>% 
    html_nodes("section#trail-stats") %>% 
    html_nodes("span.detail-data") %>% 
    nth(3) %>% 
    html_text()
  Route_type <- append(Route_type, route_type)
  description <- trail_info %>% 
    html_node("p#auto-overview.xlate-google.line-clamp-4") %>% 
    html_text()
  Description <- c(Description, description)
  trail_name <- trail_info %>% 
    html_node("div#title-and-difficulty") %>% 
    html_node("h1.xlate-none") %>% 
    html_text()
  Trail_name <- append(Trail_name, trail_name)
  trail_info <- read_html(i)
  difficulty <- trail_info %>% 
    html_nodes("div#difficulty-and-rating") %>% 
    html_node("span.diff") %>% 
    nth(1) %>% 
    html_text() 
  Difficulty <- append(Difficulty, difficulty)
  
}


#Created a new list, "Rank", that ranks the trails. As the trail urls were collected in order on a widget/thing that had
# the top trails sequntially, these match the ranks of the trails 
Rank <- seq(1, 1196)

#Cleaning up the list outputs with the stringr library
library(stringr)

# Difficulty was in all caps, putting it in "Title" form
clean_difficulty <- str_to_title(Difficulty)

#Distnace has a "\n" output, fixing that and extracting only the digits and converting to numeric
clean_distance <- str_replace_all(Distance, "[\n\n]", "")
clean_distance_miles <- str_extract(clean_distance, "\\d+\\.*\\d*")
clean_distance_miles1 <- as.numeric(clean_distance_miles)

#Cleaning Elevation, extracting only the digits, and covertin it to numeric.
clean_elevation <- str_replace_all(Elevation, ",", "")
clean_elevation1 <- str_replace_all(clean_elevation, "[\n\n]", "")
clean_elevation2 <-str_extract(clean_elevation1, "\\d+")
clean_elevation_feet <- as.numeric(clean_elevation2)


#Converting all the initialized lists that were web-scraped (and the Rank) into a dataframe. 
traildf <- data.frame(Trail_name, Rank, clean_difficulty, clean_distance_miles1, 
                      clean_elevation_feet, Route_type, Description)

#Giving the columns of the dataframe names
names(traildf) <- c("Trail_Name", "Rank", "Difficulty", "Distance_Miles", "Elevation_Feet", "Route_Type", "Description")

#Exporting the dataframe to a csv file
write.csv(traildf, 'WebProject.csv')

#At this point, I really wanted to get latitude and longitude of the trails, but couldn't figure out how. Eventually,
# I found it hidden away in the html code on each of the urls that I had already scraped! The code for lat and long is 
# below. 


#Intializing empty lists for Latitude and Longitude
Latitude <- c()
Longitude <- c()


#I tried running the code with the same chunks from before (and I tried a nested for loop as well) but something about this
# code made it even more stringent, so I divided it into smaller chunks below: 

trail_1 <- trail_links[1:100]
trail_2 <- trail_links[101:200]
trail_3 <- trail_links[201:300]
trail_4 <- trail_links[301:400]
trail_5 <- trail_links[401:500]
trail_6 <- trail_links[501:600]
trail_7 <- trail_links[601:700]
trail_8 <- trail_links[701:800]
trail_9 <- trail_links[801:900]
trail_10 <- trail_links[901:1000]
trail_11 <- trail_links[1001:1100]
trail_12 <- trail_links[1101:1196]


#Same as above, I ran the for loop in chunks to keep and eye on progress, but also get it to actually run. There are
#12 chunks to scrape latitude and longitude from the 1196 url links.
for(i in trail_1){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% #Navigating to this node had two "meta' lines: The first had the latitude
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% #And the second had longitude
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
 
}


for(i in trail_2){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_3){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_4){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_5){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_6){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_7){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_8){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_9){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_10){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_11){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

for(i in trail_12){
  trail_info <- read_html(i)
  latitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>%
    html_node("meta") %>% 
    nth(1) %>% 
    html_attr("content") 
  Latitude <- append(Latitude, latitude)
  longitude <- trail_info %>% 
    html_nodes("a#sidebar-map") %>% 
    html_nodes("div") %>% 
    html_nodes("meta") %>% 
    nth(2) %>% 
    html_attr("content")
  Longitude <- append(Longitude, longitude)
  
}

#Checking classes of new lists
class(Latitude)
class(Longitude)

#Both are character class, so they need to be converted to numeric

Clean_Latitude <- as.numeric(Latitude)
Clean_Longitude <- as.numeric(Longitude)

# Create a dataframe from the latitude and longtitude

latlongdf <- data.frame(Clean_Latitude, Clean_Longitude)
names(latlongdf) <- c("Latitude", "Longitude")

#My computer shut down on me at one point and I lost all my objects, but I did export a csv with the previous dataframe,
#so I'm going to import it here. 

traildf <- read.csv("WebProject.csv")

#Add Latitude and Longitude
traildf$Latitude <- Clean_Latitude
traildf$Longitude <- Clean_Longitude

#Export CSv
write.csv(traildf, "FinalWebScrape.csv")

#I don't really want to go through the whole clustering thing again, so I'm gonna import that file, add the columns,
# and export that one too.

clusterdf <- read.csv("ClusteredTrails.csv")

clusterdf$Latitude <- Clean_Latitude
clusterdf$Longitude <- Clean_Longitude

write.csv(clusterdf, "FinalClusterTrail.csv")

#Lost it again, so here's an import
clusterdf <- read.csv("FinalClusterTrail.csv")

#---------------Visualizations-----------------------------------------
#Converting cluster column from numeric to categorical
clusterdf$Cluster_number <- as.character(clusterdf$Cluster_number)
library(ggplot2)

#Histogram of Elevation gains for trails
g7 <- ggplot(clusterdf, aes(Elevation_Feet)) + geom_histogram() +
  labs(title = "Distribution of Elevation Gain for New Hampshire Trails", x = "Elevation (Feet)", y = "Number of Trails")
g7

#Histogram of Distance for trails
g8 <- ggplot(clusterdf, aes(Distance_Miles)) + geom_histogram(binwidth = 20) +
  labs(title = "Distribution of Distance for New Hampshire Trails", x = "Distance (Miles)", y = "Number of Trails")
g8


# Scatter plot of Routes by Elevation and Distance 
g1 <- ggplot(clusterdf, aes(Distance_Miles, Elevation_Feet)) + geom_point(aes(color = Cluster_number))+
  labs(title = "New Hampshire Trails by Elevation and Distance", x = "Distance (Feet)", y = "Elevation (Miles)")
g1

#Stacked bar chart of Route Types and Difficulties as fill
g2 <- ggplot(clusterdf, aes(Route_Type, fill = Difficulty)) + geom_bar(position = "stack") +
  ggtitle("Number of Route Types and Difficulties in Each Route Type") +
  xlab("Route Type") +
  ylab("Number of Routes") +
  theme_classic()
g2

#Side bar chart of Routes by Difficulty and Route Type as fill
g3 <- ggplot(clusterdf, aes(Difficulty, fill = Route_Type)) + geom_bar(position = "dodge") +
  ggtitle("Number of Routes By Difficulty and Route Types in Each Difficulty") +
  xlab("Difficulty") +
  ylab("Number of Routes") +
  theme_classic()
g3

#Analyzing Clusters by Route Type
g4 <- ggplot(clusterdf, aes(Cluster_number)) + geom_bar(aes(fill = Route_Type), position = position_stack(reverse = TRUE)) +
  coord_flip() +
  labs(title = "Cluster Analysis by Route Type", x = "Cluster Number", y = "Number of Trails")
g4

#Analyzing Clusters by Difficulty
g5 <- ggplot(clusterdf, aes(Cluster_number)) + geom_bar(aes(fill = Difficulty), position = position_stack(reverse = TRUE)) +
  coord_flip() +
  labs(title = "Cluster Analysis by Difficulty", x = "Cluster Number", y = "Number of Trails")
g5

#Analyzing Cluster by Average Elevation
g6 <- ggplot(clusterdf, aes(Cluster_number, Elevation_Feet, fill = Cluster_number)) + geom_bar(stat = "summary", fun.y = "mean") +
  labs(title = "Average Elevation in Each Cluster", x = "Cluster Number", y = "Elevation (Feet)")
g6

#Analyzing Cluster by Average Distance
g9 <- ggplot(clusterdf, aes(Cluster_number, Distance_Miles, fill = Cluster_number)) + geom_bar(stat = "summary", fun.y = "mean") +
  labs(title = "Average Distance in Each Cluster", x = "Cluster Number", y = "Distance (Miles)")
g9

#Analyzing Cluster by Average Rank
g9 <- ggplot(clusterdf, aes(Cluster_number, Distance_Miles, fill = Cluster_number)) + geom_bar(stat = "summary", fun.y = "mean") +
  labs(title = "Average Distance in Each Cluster", x = "Cluster Number", y = "Distance (Miles)")
g9

nullclusterdf <- clusterdf[is.na(clusterdf$Cluster_number),]
nullclusterdf
#---------------------------Leaflet------------------------------------------------------
library(leaflet)

#All the trails on the map with Name
z1 <- leaflet(clusterdf) %>% 
  addTiles() %>% 
  addMarkers(lat = clusterdf$Latitude, lng = clusterdf$Longitude, popup = clusterdf$Trail_Name)
z1

clustercolor <- colorFactor(topo.colors(7), clusterdf$Cluster_number)


#Leaflet doesn't appear to like null values, so gettin rid of them
xx <- na.omit(clusterdf)

#Creating a leaflet for Clustered trails with their descriptions
z <- xx %>% 
  leaflet() %>%
  addTiles() %>%                   
  addCircleMarkers(lat=xx$Latitude, lng=xx$Longitude, popup = ~Description,
                   color = ~clustercolor(Cluster_number), fillOpacity = 0.6, radius = 0.3) %>% 
  addLegend("bottomright", pal = clustercolor, values = ~Cluster_number, title = "Cluster Number")
z

#Doing it for just hard trails
xhard <- xx %>% 
  filter(Difficulty == "Hard")

z2 <- xhard %>% 
  leaflet() %>%
  addTiles() %>%                   
  addCircleMarkers(lat=xx$Latitude, lng=xx$Longitude, popup = ~Description,
                   color = ~clustercolor(Cluster_number), fillOpacity = 0.6, radius = 0.3) %>% 
  addLegend("bottomright", pal = clustercolor, values = ~Cluster_number, title = "Cluster Number")
z2

#Doing it for just short trails

xshort <- xx %>% 
  filter(Distance_Miles > 3.0)

z3 <- xshort %>% 
  leaflet() %>%
  addTiles() %>%                   
  addCircleMarkers(lat=xx$Latitude, lng=xx$Longitude, popup = ~Description,
                   color = ~clustercolor(Cluster_number), fillOpacity = 0.6, radius = 0.3) %>% 
  addLegend("bottomright", pal = clustercolor, values = ~Cluster_number, title = "Cluster Number")
z3
