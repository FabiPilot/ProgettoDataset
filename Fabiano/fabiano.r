library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(gganimate)
library(gifski)

tesla <- read.csv("D:/Documents/Fabiano/csv/TSLA.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=tesla, aes(x=Date, y=Volume, group=1)) +
  geom_line() +
  scale_y_continuous(labels = label_comma()) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

#-----------------

lucid <- read.csv("D:/Documents/Fabiano/csv/LCID.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=lucid, aes(x=Date, y=Volume, group=1)) +
  geom_line() +
  scale_y_continuous(labels = label_comma()) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

#-----------------

volvo <- read.csv("D:/Documents/Fabiano/csv/VOLV-B.ST.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=volvo, aes(x=Date, y=Volume, group=1)) +
  geom_line() +
  scale_y_continuous(labels = label_comma()) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

#-----------------

nissan <- read.csv("D:/Documents/Fabiano/csv/NSANY.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=nissan, aes(x=Date, y=Volume, group=1)) +
  geom_line() +
  scale_y_continuous(labels = label_comma()) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

#-----------------

bmw <- read.csv("D:/Documents/Fabiano/csv/BMW.DE.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=bmw, aes(x=Date, y=Volume, group=1)) +
  geom_line() +
  scale_y_continuous(labels = label_comma()) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

#-----------------

aptv <- read.csv("D:/Documents/Fabiano/csv/APTV.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=aptv, aes(x=Date, y=Volume, group=1)) +
  geom_line() +
  scale_y_continuous(labels = label_comma()) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

#-----------------

fcau <- read.csv("D:/Documents/Fabiano/csv/FCAU.VI.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=fcau, aes(x=Date, y=Volume, group=1)) +
  geom_line() +
  scale_y_continuous(labels = label_comma()) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))

#-----------------

stats <- read.csv("D:/Documents/Fabiano/csv/Stats.csv", header = FALSE, stringsAsFactors=FALSE)

ggplot(stats, aes(x="", y=V2, fill=V1)) +
  geom_bar(width = 1, stat = "identity") + 
  coord_polar("y", start=0) +
  theme(axis.title.x=element_blank(), axis.title.y=element_blank()) +
  scale_fill_discrete(name="Settore")

#-----------------

average_ghg <- read.csv("D:/Documents/Fabiano/csv/average_ghg.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(average_ghg, aes(fill=Technique, y=Value, x=Material)) +
  scale_fill_discrete(name="") +
  geom_bar(position="stack", stat="identity")

#-----------------

co2grmlo <- read.csv("D:/Documents/Fabiano/csv/co2grmlo.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=co2grmlo, aes(x=Year, y=Annual.Increase, group=1)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = label_comma()) +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ylab("Annual Increase")

#-----------------

comparative_life_cycle <- read.csv("D:/Documents/Fabiano/csv/comparative_life_cycle.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot(data=comparative_life_cycle, aes(fill=Phase, y=Value, x=Vehicle)) +
  scale_fill_discrete(name="") +
  geom_bar(position="stack", stat="identity")

#-----------------

global_sales <- read.csv("D:/Documents/Fabiano/csv/global_sales.csv", header = TRUE, stringsAsFactors=FALSE)

global_sales_anim <- global_sales %>%
  ggplot(aes(x = Nation, y = Value)) +
  #geom_point(aes(color = Nation), size = 6) +
  #geom_line(aes(group = Year)) +
  geom_bar(stat = "identity") +
  theme(legend.position="none") +
  #transition_time(Year)
  transition_manual(frames = Year)

animate(global_sales_anim, duration = 5, fps = 20, width = 600, height = 600, renderer = gifski_renderer())
anim_save("D:/Documents/Gabriele/Fabiano/global_sales.gif")

#-----------------

comparison <- read.csv("D:/Documents/Fabiano/csv/comparison.csv", header = TRUE, stringsAsFactors=FALSE)

ggplot()+
  geom_line(data=comparison,aes(y=ICEV.total.emissions..t.CO2.eq..,x=Mileage..km.,colour="Tesla Model 3"),size=1 )+
  geom_line(data=comparison,aes(y=EV.total.emissions..t.CO2.eq..,x=Mileage..km.,colour="Fiat Punto"),size=1) +
  scale_color_manual(values = c("Tesla Model 3" = "blue", "Fiat Punto" = "red")) +
  scale_x_continuous(labels = label_comma()) +
  scale_y_continuous(labels = label_comma()) +
  xlab("Mileage [km]") +
  ylab("Total emissions in t CO2 eq./vehicle")

#-----------------

carPollution <- read.csv("D:/Downloads/Fabiano/csv/PollutionCars.csv")

ggplot(data=carPollution, aes(x=Anno, y=t.C02, group=1)) +
  geom_line(color="red")+
  geom_point()


