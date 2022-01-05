library(forecast)
library(ggplot2)
library(readr)

df <- read_csv('10_years_to_present_get_healthy.csv', skip=2)
head(df)
str(df)

# use as.Date( ) to convert strings to dates
#df$date = as.Date(df$date, "%m%d%Y")
summary(df)
head(df)
colnames(df) <- c('month','rel_popularity')
head(df)
df
#decomp <- stl(log(df), s.window="periodic")





#ggplot(data=df) + aes(x=month, y=rel_popularity, group=1) + geom_line()

x <- ts(df$rel_popularity, frequency = 12)
plot(x)
stl(x, "periodic")
decomposed <- stl(x, s.window="periodic")
plot(decomposed)


out <- x-decomposed$time.series[,1]
plot(out)
