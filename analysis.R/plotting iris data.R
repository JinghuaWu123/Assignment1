#install some packages
renv::install(c("tidyverse", "ggpubr")) 
renv::snapshot()

#plot some data
library(tidyverse)
library(ggpubr)

head(iris)
summary(iris)
str(iris)

df <- tbl_df(iris) 
filter(df, Species == "versicolor")
filter(df, Petal.Length > 5)
df %>% 
  group_by(Species) %>%
  summarise(mean(Petal.Length))
#1 Scatter PLot
ggplot(data=df, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

# 2) Box Plot

box <- ggplot(data=df, aes(x=Species, y=Sepal.Length))

box + 
  geom_boxplot(aes(fill=Species)) +
  ylab("Sepal Length") +
  ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)

# 3) Histogram
histogram <- ggplot(data=df, aes(x=Sepal.Width))

histogram +
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) +
  xlab("Sepal Width") + 
  ylab("Frequency") + 
  ggtitle("Histogram of Sepal Width")

# 4) bar plot
bar <- ggplot(data=df, aes(x=Species))

bar +
  geom_bar(aes(fill=Species)) + xlab("Species") + 
  ylab("Count") +
  ggtitle("Bar plot of Sepal Length") 

# 5) Faceting
facet <- ggplot(data=df, aes(Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point(aes(shape=Species), size=1.5) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Faceting") 
# Along columns
facet + facet_grid(. ~ Species)

