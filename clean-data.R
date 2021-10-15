install.packages("dplyr")
install.packages("stringr")
install.packages("tidyr")
install.packages("assertive")
install.packages("readr")
install.packages("tidyr")

library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(tidyr)

# Step 1: Load data

read.csv("C:\\Users\\Admin\\Desktop\\214mid\\amongUs_original.csv")
amongUs <- read.csv("C:\\Users\\Admin\\Desktop\\214mid\\amongUs_original.csv")
View(amongUs)

# Step 2: Change to tibble
amongUs <- as_tibble(amongUs)
glimpse(amongUs)

# Step 3: TransformData

amongUs <- amongUs %>% rename(
  
  Date = X.ปฟGame.Completed.Date,
  MyTaskCompleted = Task.Completed,
  AllTeamTasksCompleted = All.Tasks.Completed,
  MyKills = Imposter.Kills,
  TotalTimePerMin = Game.Length,
  MySabotagesFixed = Sabotages.Fixed
  
)

# Step 4: Cleaning Data
## Change data type

glimpse(amongUs) ###เช็ค data type ของข้อมูล

### ทกคอลัมเป็น chr

# ลบ - แปลงเป็น numeric
is.numeric(amongUs$MyTaskCompleted)
amongUs$MyTaskCompleted <- amongUs$MyTaskCompleted %>% str_remove("-") %>% as.numeric()

is.numeric(amongUs$MyKills)
amongUs$MyKills <- amongUs$MyKills %>% str_remove("-") %>% as.numeric()


#แปลงเป็นfactor
amongUs$Team <- as.factor(amongUs$Team)
summary(amongUs$Team)

amongUs$Outcome <- as.factor(amongUs$Outcome)
summary(amongUs$Outcome)

amongUs$AllTeamTasksCompleted <- as.factor(amongUs$AllTeamTasksCompleted)
summary(amongUs$AllTeamTasksCompleted)

amongUs$Murdered <- as.factor(amongUs$Murdered)
summary(amongUs$Murdered)

### คอลัม time ไป clean ใน excel โดยใช้ ctrl + H ######

amongUs$Ejected  <- as.factor(amongUs$Ejected)
summary(amongUs$Ejected)

is.numeric(amongUs$MySabotagesFixed)
amongUs$MySabotagesFixed <- amongUs$MySabotagesFixed %>% str_remove("N/A") %>% as.numeric()
