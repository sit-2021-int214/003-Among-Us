# Define a question

1. อัตราชนะของทีมไหนมากกว่ากัน
2. ค่าเฉลี่ยของการทำภารกิจที่เราทำได้ในแต่ละตา และ โอกาศที่ทั้งทีมจะทำภารกิจสำเร็จ
3. ต้องทำภารกิจประมาณกี่อันต่อคน ภารกิจทั้งทีมถึงจะสำเร็จ , Crewmate win
4. ต้องฆ่า Crewmate ประมาณกี่คน Imposter ถึงชนะ
5. แสดงสถิติต่างๆที่เกี่ยวกับระยะเวลาในการเล่น
6. โอกาศกี่เปอร์เซ็นที่เราจะโดน Imposter ฆ่า
7. ระหว่าง Crewmate กับ Imposter ทีมไหนใช้เวลาในการเอาชนะได้ไวกว่ากัน


# Exploratory Data Analysis With Stat

## โหลด dataset ที่ clean เรียบร้อยแล้ว และ ลง libery ต่างๆ

```{R}
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

```

### :question: 1. อัตราชนะของทีมไหนมากกว่ากัน
#### 1.1 หาอัตราชนะของทีม Imposter
code
```{R}
ImposterWin <- count(amongUs$Team == "Imposter" & amongUs$ Outcome =="Win" )
AllImposter <- count(amongUs$Team == "Imposter" )

ImposterWin/AllImposter
```
result
```{R}
0.4347826
```
#### 1.2 หาอัตราชนะของทีม Crewmate
code

```{R}
CrewmateWin <- count(amongUs$Team == "Crewmate" & amongUs$ Outcome =="Win" )
AllCrewmate <- count(amongUs$Team == "Crewmate" )

CrewmateWin/AllCrewmate

```
result
```{R}
0.4805195
```

#### สรุปผล
```{R}
อัตราชนะของ Crewmate คือ 48%
อัตราชนะของ Imposter คือ 43%
ดังนั้น Crewmate มีโอกาศชนะมากกว่า 
```
### :question: 2. ค่าเฉลี่ยของการทำภารกิจที่เราทำได้ในแต่ละตา และ โอกาศที่ทั้งทีมจะทำภารกิจสำเร็จ
#### code

```{R}
amongUs$MyTaskCompleted %>% mean(na.rm = TRUE) ##ภารกิจตัวเอง
mean(amongUs$AllTeamTasksCompleted == "Yes") ##โอกาศที่ทั้งทีมจะทำภารกิจสำเร็จ
```
#### result
```{R}
5.818182
0.37
```
#### สรุปผล
```{R}
ในการทำภารกิจ หรือ การเคลีย Task ของเราจาก 100 เกม เราได้สำเร็จภารกิจประมาณ 5.8 ภารกิจ ต่อเกม <br>
และ โอกาศที่ทั้งทีมจะทำภารกิจสำเร็จคือ 37 %
```

### :question: 3. ต้องทำภารกิจประมาณกี่อันต่อคน ภารกิจทั้งทีมถึงจะสำเร็จ , Crewmate win
#### code

```{R}
AllComplet <- amongUs %>% filter(AllTeamTasksCompleted == "Yes") 
AllComplet$MyTaskCompleted %>% mean()
```
#### result
```{R}
7.702703
```
#### สรุปผล
```{R}
หากต้องการให้ชนะโดยการทำภารกิจสำเร็จ ( ถ้าทุกคนในทีมทำภารกิจครบ ทีม Crewmate จะชนะ ) เราต้องทำภารกิจประมาณ  7.7 ภารกิจให้สำเร็จ
```

###  :question: 4. ต้องฆ่า Crewmate ประมาณกี่คน Imposter ถึงชนะ
#### code

```{R}
 Imposter <- amongUs %>% filter(amongUs$Team == "Imposter" & amongUs$ Outcome =="Win" ) 

 Imposter$MyKills %>% mean()

```
#### result
```{R}
2.4
```
#### สรุปผล
```{R}
หากเราได้อยู่ฝั่ง Imposter เราต้องฆ่าผู้เล่นฝั่ง Crewmate ประมาณ 2.4 คน หรือ 3 คน ถึงจะชนะ
```
### :question: 5. แสดงสถิติต่างๆที่เกี่ยวกับระยะเวลาในการเล่น
#### code
```{R}
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
```
#### result
```{R}
#เวลาเฉลี่ยที่เราเล่นเป็น Crewmate
10.42857
#เวลาเฉลี่ยที่เราเล่นเป็น Imposter
9.697826
#เวลาเฉลี่ยที่เราอยู่ในเกมแล้วโดนฆ่า
9.706389
#เวลาเฉลี่ยที่เราอยู่ในเกมแล้วไม่โดนฆ่าตาย
11.06268 
#เวลาเฉลี่ยที่เราเป็น Imposter แล้วโดนโหวตออก
12.182
#เวลาเฉลี่ยที่เราเป็น Crewmate แล้วโดนโหวตออก
10.7675
```
#### สรุปผล
```{R}
1.) หากเราเป็น Cremate จะมีเวลาเล่นอยู่ในเกมได้นานกว่า Imposter
2.) หากเราไม่โดนฆ่าตาย เราจะอยู่ในเกมได้นานมากกว่า
3.) หากเราเป็น Impster เราจะใช้เวลาอยู่ได้นานมากกว่า Cremate ก่อนจะโดนโหวตออกจากยาน
```
### :question: 6. โอกาศกี่เปอร์เซ็นที่เราจะโดน Imposter ฆ่า
#### code
```{R}
dead <- amongUs %>% filter( Team == "Crewmate") 
mean(dead$Murdered == "Yes")
```
#### result
```{R}
0.4675325
```
#### สรุปผล
```{R}
โอกาศที่เราจะโดนฆ่าโดย Imposter นั้นมีถึง 46%
```
### :question: 7. ระหว่าง Crewmate กับ Imposter ทีมไหนใช้เวลาในการเอาชนะได้ไวกว่ากัน
#### code
```{R}
ImWin <-amongUs %>% filter(Team == "Imposter" , Outcome =="Win")
ImWin$TotalTimePerMin %>% mean() #ค่าเฉลี่ยของเวลาที่ Imposter ชนะ
ImWin$TotalTimePerMin %>% max() #เวลาที่ Imposter ใช้นานที่สุดในการเอาชนะ
ImWin$TotalTimePerMin %>% min() #เวลาที่ Imposter ใช้น้อยที่สุดในการเอาชนะ

CreWin <- amongUs %>% filter(Team == "Crewmate" , Outcome =="Win")
CreWin$TotalTimePerMin %>% mean() #ค่าเฉลี่ยของเวลาที่ Crewmate ชนะ
CreWin$TotalTimePerMin %>% max() #เวลาที่ Crewmate ใช้นานที่สุดในการเอาชนะ
CreWin$TotalTimePerMin %>% min() #เวลาที่ Crewmate ใช้น้อยที่สุดในการเอาชนะ

```

#### result
```{R}

 6.438 #ค่าเฉลี่ยของเวลาที่ Imposter ชนะ
 9.15 #เวลาที่ Imposter ใช้นานที่สุดในการเอาชนะ
 3.14 #เวลาที่ Imposter ใช้น้อยที่สุดในการเอาชนะ

 11.30135 #ค่าเฉลี่ยของเวลาที่ Crewmate ชนะ
 26.4 #เวลาที่ Crewmate ใช้นานที่สุดในการเอาชนะ
 3.19  #เวลาที่ Crewmate ใช้น้อยที่สุดในการเอาชนะ
```

#### สรุปผล
```{R}
ในทีม Imposter การใช้เวลาในการเอาชนะที่นานที่สุดคือ 9.15 นาที และไวที่สุดคือ 3.14 นาที เฉลี่ยเวลาในการชนะอยู่ที่ 6.4 นาที
ส่วนในทีม Crewmate การใช้เวลาในการเอาชนะที่นานที่สุดคือ 26.4 นาที และไวที่สุดคือ 3.19  นาที เฉลี่ยเวลาในการชนะอยู่ที่ 11.30135 นาที
ดังนั้นจึงสรุปได้ว่า ทีม Imposter นั้น ใช้เวลาในการเอาชนะไวกว่าทีม Crewmate

```

### :question: 8. ค่าเฉลี่ยที่เราจะถูกสุ่มเป็น Crewmate หรือ Imposter ฝั่งไหนมากกว่ากัน
#### code
```{R}
CrewmateWin <- count(amongUs$Team) ##นับจำนวนแต่ละทีม ได้ cre 77 im 23

77/100   #จำนวนในแต่ละทีมหารด้วยจำนวนทั้งหมด
23/100
```
#### result
```{R}
> CrewmateWin
         x freq
1 Crewmate   77
2 Imposter   23

> 77/100
[1] 0.77
> 23/100
[1] 0.23
```
#### สรุปผล
```{R}
โอกาศที่จะเป็น Crewmate 77%
โอกาศที่จะเป็น Imposter 23% 
ดังนั้นเรามีโอกาศที่จะอยู่ทีม Crewmate มากกว่า
```

