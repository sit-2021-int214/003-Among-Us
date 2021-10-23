# Part 1 : Explore the dataset
### Step 1 : ทำการเรียกใช้ library
```{R}
#Library
library(dplyr)
library(readr)
library(ggplot2)
```
### Step 2 : ทำการ Import Dataset
```{R}
#Import Dataset
Programing_Books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
```
### Step 2 : ทำการ Explore Dataset
```{R}
glimpse(Programing_Books)
```
#### Result
