

##Å§library¨µèÒ§æ
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

##âËÅ´´ÒµéÒ·Õè¤ÅÕ¹áÅéÇÁÒãªé
amongUs <- read.csv("C:\\Users\\Admin\\Desktop\\214mid\\amongUsCleaned.csv")
View(amongUs)


# ÍÑµÃÒª¹Ð¢Í§·ÕÁäË¹ÁÒ¡¡ÇèÒ¡Ñ¹
summary(amongUs$Team)

amongUs %>% filter(Team == "Crewmate" , Outcome =="Win")
## Crewmate ª¹Ð 37 ¤ÃÑé§¨Ò¡ 77 à¡Á

amongUs %>% filter(Team == "Imposter" , Outcome =="Win")
## Imposter ª¹Ð 10 ¤ÃÑé§¨Ò¡ 23 à¡Á

ImposterWin <- count(amongUs$Team == "Imposter" & amongUs$ Outcome =="Win" )
AllImposter <- count(amongUs$Team == "Imposter" )

ImposterWin/AllImposter


CrewmateWin <- count(amongUs$Team == "Crewmate" & amongUs$ Outcome =="Win" )
AllCrewmate <- count(amongUs$Team == "Crewmate" )

CrewmateWin/AllCrewmate



#µéÍ§¦èÒ Crewmate »ÃÐÁÒ³¡Õè¤¹ Imposter ¶Ö§ª¹Ð

Imposter <- amongUs %>% filter(amongUs$Team == "Imposter" & amongUs$ Outcome =="Win" ) 

Imposter$MyKills %>% mean()

#âÍ¡ÒÈ¡Õèà»ÍÃìà«ç¹·ÕèàÃÒ¨Ðâ´¹ Imposter ¦èÒ
dead <- amongUs %>% filter( Team == "Crewmate") 
mean(dead$Murdered == "Yes")

#¤èÒà©ÅÕèÂ¢Í§¡ÒÃ·ÓÀÒÃ¡Ô¨·ÕèàÃÒ·Óä´éã¹áµèÅÐµÒ áÅÐ âÍ¡ÒÈ·Õè·Ñé§·ÕÁ¨Ð·ÓÀÒÃ¡Ô¨ÊÓàÃç¨
amongUs$MyTaskCompleted %>% mean(na.rm = TRUE) ##ÀÒÃ¡Ô¨µÑÇàÍ§
mean(amongUs$AllTeamTasksCompleted == "Yes") ##âÍ¡ÒÈ·Õè·Ñé§·ÕÁ¨Ð·ÓÀÒÃ¡Ô¨ÊÓàÃç¨


# ÃÐËÇèÒ§ Crewmate ¡Ñº Imposter ·ÕÁäË¹ãªéàÇÅÒã¹¡ÒÃàÍÒª¹Ðä´éäÇ¡ÇèÒ¡Ñ¹
ImWin <-amongUs %>% filter(Team == "Imposter" , Outcome =="Win")
ImWin$TotalTimePerMin %>% mean()
ImWin$TotalTimePerMin %>% max()
ImWin$TotalTimePerMin %>% min()

CreWin <- amongUs %>% filter(Team == "Crewmate" , Outcome =="Win")
CreWin$TotalTimePerMin %>% mean()
CreWin$TotalTimePerMin %>% max()
CreWin$TotalTimePerMin %>% min()


#¤èÒà©ÅÕèÂ·ÕèàÃÒ¨Ð¶Ù¡ÊØèÁà»ç¹ Crewmate ËÃ×Í Imposter ½Ñè§äË¹ÁÒ¡¡ÇèÒ¡Ñ¹
CrewmateWin <- count(amongUs$Team)

77/100

23/100



Cre <- amongUs %>% filter(Team == "Crewmate")  #àÇÅÒà©ÅÕèÂ·ÕèàÃÒàÅè¹à»ç¹ Crewmate
Cre$TotalTimePerMin %>% mean()

im <- amongUs %>% filter(Team == "Imposter")  #àÇÅÒà©ÅÕèÂ·ÕèàÃÒàÅè¹à»ç¹ Imposter
im$TotalTimePerMin %>% mean()


die <- amongUs %>% filter(Team == "Crewmate" , Murdered == "Yes")  #àÇÅÒà©ÅÕèÂ·ÕèàÃÒÍÂÙèã¹à¡ÁáÅéÇâ´¹¦èÒ
die$TotalTimePerMin %>% mean()

NotDie <- amongUs %>% filter(Team == "Crewmate" , Murdered == "No")  #àÇÅÒà©ÅÕèÂ·ÕèàÃÒÍÂÙèã¹à¡ÁáÅéÇäÁèâ´¹¦èÒµÒÂ
NotDie$TotalTimePerMin %>% mean()

ImEj <- amongUs %>% filter(Team == "Imposter" , Ejected == "Yes")  #àÇÅÒà©ÅÕèÂ·ÕèàÃÒà»ç¹ Imposter áÅéÇâ´¹âËÇµÍÍ¡
ImEj$TotalTimePerMin %>% mean()

CreEj <- amongUs %>% filter(Team == "Crewmate" , Ejected == "Yes")  #àÇÅÒà©ÅÕèÂ·ÕèàÃÒà»ç¹ Crewmate áÅéÇâ´¹âËÇµÍÍ¡
CreEj$TotalTimePerMin %>% mean()
