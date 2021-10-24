# Library
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)

install.packages("ggplot2")
library(ggplot2)

# Dataset
dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

View(dataset)

dataset$`Order ID` %>% head(10)
dataset %>% arrange(Sales)

MAXsales <- dataset$Sales %>% max()
MINsales <- dataset$Sales %>% min()
MAXsales - MINsales

data.frame(dataset$Sales %>% mean())

dataset$`Customer Name` %>% head(50)

dataset$Sales %>% min()



cc <- dataset %>% head(10) %>% ggplot(aes(x=City))+geom_bar()+ggtitle("Amount of City")+ylab("Sum Of City")
cc

SHSE <- dataset %>% head(15) %>% ggplot(aes(x=State))+geom_bar()+ggtitle("Amount of State")+ylab("Sum Of State")
SHSE
