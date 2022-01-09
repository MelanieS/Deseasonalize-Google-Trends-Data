library(forecast)
library(readr)

art <- c("               __", "              / _)", "     _.----._/ /", 
         "    / melanie /", " __/ (  | (  |", "/__.-'|_|--|_|")
cat(art, sep = "\n")

df <- read_csv('data.csv', skip=2)
head(df)

colnames(df) <- c('month','rel_popularity')
#clean up column titles
head(df)

x <- ts(df$rel_popularity, frequency = 12)
#Be leery of frequency, some reports in weeks
#In the case of weeks, set frequency = 52
plot(x)
stl(x,"periodic")
decomp_x <- stl(x, s.window="periodic")
plot(decomp_x)
#large remainders -20 and +10, detect and remove outliers to minimize noise
#March 2020 (~t=9) can be detected by sight

tsoutliers(x)
#location of outliers and their replacement values

clean <- tsclean(x)
#replace outliers

plot(x,type="l",col="red")
lines(clean,col="green")
#shows where outliers were replaced

stl(clean, "periodic")
decomp_clean <- stl(clean, s.window="periodic")
plot(decomp_clean)
$#much smaller remainders
