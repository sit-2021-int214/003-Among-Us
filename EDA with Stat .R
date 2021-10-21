

##ลงlibraryจต่างๆ
install.packages("plyr")
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
library(plyr)

##โหลดดาต้าที่คลีนแล้วมาใช้
amongUs <- read.csv("C:\\Users\\Admin\\Desktop\\214mid\\amongUsCleaned.csv")
View(amongUs)


# อัตราชนะของทีมไหนมากกว่ากัน
summary(amongUs$Team)

amongUs %>% filter(Team == "Crewmate" , Outcome =="Win")
## Crewmate ชนะ 37 ครั้งจาก 77 เกม

amongUs %>% filter(Team == "Imposter" , Outcome =="Win")
## Imposter ชนะ 10 ครั้งจาก 23 เกม

ImposterWin <- count(amongUs$Team == "Imposter" & amongUs$ Outcome =="Win" )
AllImposter <- count(amongUs$Team == "Imposter" )

ImposterWin/AllImposter


CrewmateWin <- count(amongUs$Team == "Crewmate" & amongUs$ Outcome =="Win" )
AllCrewmate <- count(amongUs$Team == "Crewmate" )

CrewmateWin/AllCrewmate



#ต้องฆ่า Crewmate ประมาณกี่คน Imposter ถึงชนะ

Imposter <- amongUs %>% filter(amongUs$Team == "Imposter" & amongUs$ Outcome =="Win" ) 

Imposter$MyKills %>% mean()

#โอกาศกี่เปอร์เซ็นที่เราจะโดน Imposter ฆ่า
dead <- amongUs %>% filter( Team == "Crewmate") 
mean(dead$Murdered == "Yes")

#ค่าเฉลี่ยของการทำภารกิจที่เราทำได้ในแต่ละตา และ โอกาศที่ทั้งทีมจะทำภารกิจสำเร็จ
amongUs$MyTaskCompleted %>% mean(na.rm = TRUE) ##ภารกิจตัวเอง
mean(amongUs$AllTeamTasksCompleted == "Yes") ##โอกาศที่ทั้งทีมจะทำภารกิจสำเร็จ


# ระหว่าง Crewmate กับ Imposter ทีมไหนใช้เวลาในการเอาชนะได้ไวกว่ากัน
ImWin <-amongUs %>% filter(Team == "Imposter" , Outcome =="Win")
ImWin$TotalTimePerMin %>% mean()
ImWin$TotalTimePerMin %>% max()
ImWin$TotalTimePerMin %>% min()

CreWin <- amongUs %>% filter(Team == "Crewmate" , Outcome =="Win")
CreWin$TotalTimePerMin %>% mean()
CreWin$TotalTimePerMin %>% max()
CreWin$TotalTimePerMin %>% min()


#ค่าเฉลี่ยที่เราจะถูกสุ่มเป็น Crewmate หรือ Imposter ฝั่งไหนมากกว่ากัน
CrewmateWin <- count(amongUs$Team)

77/100

23/100



Cre <- amongUs %>% filter(Team == "Crewmate")  #เวลาเฉลี่ยที่เราเล่นเป็น Crewmate
Cre$TotalTimePerMin %>% mean()

im <- amongUs %>% filter(Team == "Imposter")  #เวลาเฉลี่ยที่เราเล่นเป็น Imposter
im$TotalTimePerMin %>% mean()


die <- amongUs %>% filter(Team == "Crewmate" , Murdered == "Yes")  #เวลาเฉลี่ยที่เราอยู่ในเกมแล้วโดนฆ่า
die$TotalTimePerMin %>% mean()

NotDie <- amongUs %>% filter(Team == "Crewmate" , Murdered == "No")  #เวลาเฉลี่ยที่เราอยู่ในเกมแล้วไม่โดนฆ่าตาย
NotDie$TotalTimePerMin %>% mean()

ImEj <- amongUs %>% filter(Team == "Imposter" , Ejected == "Yes")  #เวลาเฉลี่ยที่เราเป็น Imposter แล้วโดนโหวตออก
ImEj$TotalTimePerMin %>% mean()

CreEj <- amongUs %>% filter(Team == "Crewmate" , Ejected == "Yes")  #เวลาเฉลี่ยที่เราเป็น Crewmate แล้วโดนโหวตออก
CreEj$TotalTimePerMin %>% mean()
