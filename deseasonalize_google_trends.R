library(forecast)
library(ggplot2)
library(readr)

art <- c("               __", "              / _)", "     _.----._/ /", 
         "    / melanie /", " __/ (  | (  |", "/__.-'|_|--|_|")
cat(art, sep = "\n")

df <- read_csv('data.csv', skip=2)
#Rename data.csv above to something descriptive like keyword_timeperiod_US.csv
#Also name the file you download from Google trends to this.

summary(df)
head(df)
colnames(df) <- c('month','rel_popularity')
head(df)

x <- ts(df$rel_popularity, frequency = 12)
#Be leery of frequency. Shorter times periods downloaded from Google trends report in weeks.
#In the case of weeks, set frequency = 52
plot(x)
stl(x, "periodic")
decomposed <- stl(x, s.window="periodic")
plot(decomposed)
