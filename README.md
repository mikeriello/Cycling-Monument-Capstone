# Cycling Monuments - Capstone ReadMe

## Table of Contents
- [Background](#background)
- [Driving Thesis](#driving-thesis)
- [Approach](#approach)
- [Sources](#sources)
- [Challenges](#challenges)
- [Conclusion](#conclusion)

## Background
As a lifelong cycling and amateur racer, I've long been aware of and interested in the world of cycling analytics. Whether its using [PJAMM's database](https://pjammcycling.com/) to read about and explore the world's toughest climbs, or reading in awe the latest [Cycling Graphs](https://x.com/cyclinggraphs?lang=en) and power profiles at [Lanterne Rouge Media](https://lanternerouge.com/), I'm happy to know enough for a seat at the table. While this capstone was more or less my initial foray into the topic, I was able to get to combine cycling stats from the [procyclingstats API](https://procyclingstats.readthedocs.io/en/latest/), GPX files from [La Flamme Rouge](https://www.la-flamme-rouge.eu/), and windspeed data from the [Open-Meteo API](https://open-meteo.com/) to document the difficulty of professional cycling's toughest one-day races.  

## Driving Thesis
My aim was to determine which of the Monuments (from 2017 - 2023) was the hardest in terms of **race distance**, **vertical gain**, **windspeed**, and **terrain** or **course features**.

## Approach
(Describe the methodology, tools, and techniques used in your analysis.)
Project planning began with the discovery of [Bram Janseens](#) et al.'s research, *[Geospatial Road Cycling Race Results Data Set](https://arxiv.org/pdf/2410.09055)*. I've included the study's abstract below, but essentially, their aim was to push the envelope — so to speak — on the field of cycling analytics by marrying the results of thousands of professional road races across Men's and Women's Junior, Continental Pro, and World Tour categorizations with detailed geographic information about the courses, specifically route composition as defined by the number of meters of Access Road, Alpine, Asphalt, Cobblestones, Compacted Gravel, Cycleway, Path, Paved, Road, Singletrack, State Road, and Street surface types. 

>> The field of cycling analytics has only recently started to develop due to limited access to open  
>> data sources. Accordingly, research and data sources are very divergent, with large differences  
>> in information used across studies. To improve this, and facilitate further research in the field,  
>> we propose the publication of a data set which links thousands of professional race results  
>> from the period 2017-2023 to detailed geographic information about the courses, an essential  
>> aspect in road cycling analytics. Initial use cases are proposed, showcasing the usefulness in  
>> linking these two data sources.

The [associated datasets](https://figshare.com/articles/dataset/Cycling_Analytics_Data_Sets/24566542) provided me with a solid foundation for my own analysis; however, I needed to sharpen the focus of my capstone and not simply duplicate work. This led me to the Monuments, which are professional cycling's toughest one-day races. With the terrain data, I'd be able to *theoretically* quantify difficulty based on a handful of additional metrics. After a couple of evenings spent webscraping various stats sites, such as FirstCycling and PCS, I was able to find an API that would more efficiently pull data in from the procyclingstats website. This API was created by another citizen analyst, Martin Madzin. Kudos to him for making my life much easier these past few weeks! You can find the API's GitHub [here](https://github.com/themm1/procyclingstats) and its documentation [here](https://procyclingstats.readthedocs.io/en/latest/). Lastly, I wanted to bring in a consistent element of weather data to further quantify difficulty. While PCS includes temperature data for each race, it was very incomplete. Through the combination of the Open-Meteo API and each race's GPX file, I was able generate windspeed measures for each race. 

With these tools in hand, I went about constructing three separate datasheets using various methods of data manipulation/wrangling:
1. The **Terrain Dataset** contains PCS race entry names, a standardized column of Race Names (for joining), Race Tags (which include Spring, Ardennes, Flanders, Cobbled, and Monument classifications), Year, Distance, Net Gain, Lowest Elevation, Highest Elevation, Vertical Gain, Downhill, and the number of meters of Access Road, Alpine, Asphalt, Cobblestones, Compacted Gravel, Cycleway, Path, Paved, Road, Singletrack, State Road, and Street surface types. 

2. The **Baseline Dataset** contains PCS race entry names, a standardized column of Race Names (for joining), Year, Winner, One_day_race specialty points, GC specialty points, Time_trial specialty points, Sprint specialty points, Climber specialty points, Hills specialty points, Team, Winner Time, Avg Speed (km/h), 2nd Place winner, 3rd Place winner, 4th Place winner, 5th Place winner, Time Gaps, Win method, Race date, Race profile, PCS ProfileScore, departure city/town, arrival city/town, Average temperature, and Start time.

3. The **Windspeed Dataset** contains PCS race entry names, a standardized column of Race Names (for joining), Year, Latitude, Longitude, Windspeed (km/h), Wind direction (in degrees), and Cardinal direction. 

## Disclaimers
+ All distance and speed measures represented in the dashboard are metric units.
+ Terrain data was filtered to include only the surface types present in my selected races, i.e., many surface types — such as Alpine, Singletrack, etc., did not show up in the Monuments so they were excluded from analysis.
+ Data was gathered for 15 different races, but my analysis was specific to the Monuments, e.g., Il Lombardia, Liege - Bastonge - Liege, Milan-San Remo, Paris-Roubaix, and Ronde van Vlaanderen.
+ Initially, windspeed data was mapped using latitude and longitude coordinates for every point in a race's GPX file, as well as race date and start time. After realizing that such a large number of points were unnecessary to compute windspeed metrics, I selected three waypoints to represent each race: the start, middle, and end sets of coordinates. This allowed me to more simply average the windspeed metrics for each race. 

  In retrospect, Tableau or Python would have been better suited for visualizing these maps. Power BI's limit on coordinate points truncated Start and Stop waypoints in Liege - Bastogne - Liege, Milan-San Remo,      and Paris-Roubaix, which I manually created in order to indicate race direction and elevate the headwind/tailwind part of my analysis.

## Challenges
My approach to this capstone was unique, in that much of the data used in analysis had to be manually sourced and structured. Fortunately, this process allowed me to develop and refine my skills in working with APIs. However, it also relegated the focus of analysis toward documentation as opposed to exploring trends in difficulty across various surface types, which was part of the initial scope. 

Additionally, there's much more analysis that can be done to more accurately quantify difficulty. Cycling analytics remains something of a black box, with many performance factors yet to be adequately measured and understood. Advancements in bike engineering, aerodynamics, and racers' nutrition regimens have dramatically improved the overall performance of the peloton. While these advancements benefit the sport, they also introduce new variables that make analyzing performance and difficulty more complex and multifaceted.

## Conclusion
To more easily communicate the Key Findings of my analysis, I've included both a summarization of key metrics as well as a tier list, which ranks each race from S to C tiers. 

+ Il Lombardia had the highest total Vertical Gain of the Monuments (topping out at 5K meters/16K feet) and consistently high PCS ProfileScores; race distance was consistently the lowest, hovering around 240 kms or 150 miles. Windspeed was not generally a factor throughout the years and neither was the terrain.
+ Liege - Bastonge - Liege had the second-highest Vertical Gain of the Monuments (4K meters/13K feet) but with smaller and punchier climbs. Windspeed was more of a factor, i.e., in 2023, riders had a tailwind for the majority of the route. Terrain is to the advantage of riders, in that, it is a true road race in the sense that the majority of terrain is wide roads.
+ Milan-San Remo Monument has the most race distance of the Monuments (topping out at 305 kms/189 miles), but Vertical Gain is rather low at 3K meters/11K feet. Windspeed is somewhat nullified in this race, given that the peloton stays together for the majority of the route. Cycleways do play a part in the final kilometers.
+ Paris-Roubaix was the Monument with the lowest PCS ProfileScores and Vertical Gain; however, terrain is the focus in this race. The amount of Cobblestones and Cycleways set this race apart from the others. Windspeed is to the advantage of riders, e.g., most years feature a tailwind of 15 to 16 km/h.
+ Ronde van Vlaanderen includes similar low PCS ProfileScores and Vertical Gain; however, Cobblestones play a big role in the race, as do the sharp and steep climbs. Additionally, most years feature a strong headwind 15 to 16 km/h for the majority of the route.

![Monument Tier List](https://github.com/mikeriello/Cycling-Monument-Capstone/blob/main/images/Monument%20Tier%20List.png)

## Future Research
For this specific project, there is space in the analysis to identify and label climbs as well as Cobblestone and Cycleway sections in the GPX files and map visualizations. This would allow for a stronger conclusion to be made when quantifying the difficulty of these terrain types. Also, expanding the sample size to include one-day races from less traditional cycling nations could uncover events that are just as challenging, if not more so. 

To that end, I believe there is an opportunity for similar analysis to be done for the Life Time Grand Prix, which are a series of professional off-road races in the United States. These events include surface types and terrain better suited to mountain and gravel bikes. Analyzing gravel sizes, types, and geological makeup could help develop course difficulty scores that are specific to off-road racing.
