
## My Step
1. Search datasets from Kaggle
2. Explore the dataset from the original dataset
3. Download Library and dataset
4. Exploratory Data Analysis
5. Cleaning Dataset
6. Define a question
7. Exploratory Data Analysis with Stat


## Step 1 Search datasets from Kaggle

พวกเราเจอ dataset ที่แปลกและน่าสนใจ น่านำมาวิเคราะห์ นั่นคือ dataset ที่เกี่ยวกับข้อมูลของเกม<strong> amongUs</strong> <br>
Dataset from : https://www.kaggle.com/ruchi798/among-us-dataset/version/27?select=User2.csv

## Step 2 Explore the dataset from the original dataset
 <p>Among Us เป็นเกมแนวจับผิด หาคนร้าย ซึ่งในแต่ละคนจะมีการสุ่มบทบาทเป็นของตัวเอง และ มีการเล่น มีการชนะ ได้หลายรูปแบบมาก
 เช่น ฆ่าทุกคน จับคนร้าย ทำภารกิจครบ โหวตออก และอื่นๆอีกมากมาย แต่ละรอบของเกมมีอะไรเกิดที่ไม่ซ้ำกัน ทำให้มีข้อมูลให้เราได้วิเคราะห์ ได้เล่นกับข้อมูลได้หลายอย่าง</p>
 <p>โดยชุดข้อมูลนี้เกี่ยวกับผู้เล่นเกม amongUs เป็นข้อมูลที่บอกว่าระหว่างที่เล่นเขาได้เจอกับอะไรบ้างในรอบๆนั้้น โดยแต่ละรอบก็จะมีข้อมูลที่ไม่เหมือนกัน เช่น ทีมที่อยู่ จำนวนภารกิจ และอื่นๆ.  </p> 
 
#### ใน dataset นี้เป็นข้อมูลของผู้เล่นหนึ่งคนที่เล่นไปทั้งหมด 100 รอบ และมีตัวแปรทั้งหมด 10 ตัว (100 observations with 10 variables.) ตัวแปรประกอบไปด้วย
- Game Completed Date
- Team
- Outcome
- Task Completed
- All Tasks Completed
- Murdered
- Imposter Kills
- Game Length
- Ejected
- Sabotages Fixed
## Step 3 Loading library and dataset
```{R}
#Loading library
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(tidyr)

#Loading DataSet
read.csv("C:\\Users\\Admin\\Desktop\\214mid\\amongUs_original.csv")
amongUs <- read.csv("C:\\Users\\Admin\\Desktop\\214mid\\amongUs_original.csv")
View(amongUs)
```

## Step 4 Exploratory Data Analysis
จากข้อมูล เรามาดูความหมายและลักษณะของตัวแปรทั้ง 10 ตัวแปรกัน
- Game Completed Date = วันที่และเวลาที่เล่น ( มีทั้งวันที่และเวลาในตัวแปรเดียว )
- Team = ทีมที่ผู้เล่นได้รับระหว่างเล่น ( มีสองข้อมูลคือ Crewmate และ Imposter )
- Outcome = ผลลัพท์ของเกมนั้นๆ ( มีสองข้อมูลคือ Win และ Loss )
- Task Completed = จำนวนภารกิจที่เราทำสำเร็จ (เป็นข้อมูลแบบนับจำนวน เป็น ตัวเลข และ -  )
- All Tasks Completed = ผลลัพท์ของภารกิจทั้งหมดว่าผู้เล่นทุกคนทำสำเร็จหรือไม่ ( เป็น Yes และ No )
- Murdered = ถูกฆาตกรรมโดย Imposter หรือไม่  ( เป็น Yes และ No )
- Imposter Kills = จำนวนผู้เล่นที่เราสังหารเมื่อเป็น Imposter (เป็นข้อมูลแบบนับจำนวน เป็น ตัวเลข และ -  )
- Game Length = ระยะเวลาของเกม (เป็นเวลา หน่วยเป็น นาที)
- Ejected = ถูกโหวตออกหรือไม่ ( เป็น Yes และ No )
- Sabotages Fixed = ไปแก้ไขการ Sabotages ของ Imposter หรือ ซ่อมไฟเมื่อ Imposter พัง  (เป็นข้อมูลแบบนับจำนวน เป็น ตัวเลข และ N/A)
<p>หลังจากที่ดูความหมายของตัวแปรทั้งหมดแล้ว เราได้ประเมินได้ว่าบางชื่อของตัวแปรนั้นมีความหมายที่คลุมเครือไป อาจทำให้เข้าใจผิดได้ เช่น
Task Completed กับ All Tasks Completed ถ้าอ่านผ่านๆอาจจะสับสน ภารกิจที่เสร็จ? ภารกิจทั้งหมดที่เสร็จ? จิงๆแล้วความหมายของมันคือ จำนวนภารกิจของเราที่สำเร็จ กับ ภารกิจของทั้งทีมว่าสำเร็จหรือไม่
เราจึงต้องเปลี่ยนชื่อตัวแปรพวกนี้ให้ผู้อ่านได้เข้าใจยิ่งขึ้น </p>
<p> Task Completed , Imposter Kills นั้นมีทั้งตัวเลขและ - ทำให้เวลาทำงานอาจะมีปัญหาได้ ทำให้เราต้องนำ - ออก <p> 
 <p> Sabotages Fixed ที่มีตัวเลข กับ N/A (n/aที่เป็น String) เราจึงต้องนำ N/A ออก </p>
 <p> Game Length นั้นเป็นเวลาที่มาในรูปแบบ String เช่น 13m16s ทำให้เรานำมาคำนวนไม่ได้ เราจึงต้องแปลงเป็น Number <p>
 <p> หลังจากที่มองภาพรวมของ dataset แล้วเราก็มาลองเช็คในตัวโปรแกรมกันว่าตัวแปรแต่ละตัวนั้นมี Type ถูกต้องไหมโดยการใช้คำสั่ง <strong> glimpse(amongUs)</strong> </p>

```{R}
  $ X.ปฟGame.Completed.Date <chr> "12/13/2020 at 1:46:30 am EST", "12/13/2020 at 1:37:06 am EST", "12/13/2020 at 1:22:~
$ Team                    <chr> "Crewmate", "Crewmate", "Imposter", "Crewmate", "Crewmate", "Imposter", "Crewmate", ~
$ Outcome                 <chr> "Win", "Loss", "Loss", "Win", "Win", "Loss", "Win", "Win", "Loss", "Loss", "Loss", "~
$ Task.Completed          <chr> "4", "8", "-", "5", "9", "-", "7", "-", "7", "6", "3", "-", "7", "2", "5", "4", "-",~
$ All.Tasks.Completed     <chr> "No", "Yes", "-", "No", "Yes", "-", "Yes", "-", "Yes", "No", "No", "-", "Yes", "No",~
$ Murdered                <chr> "Yes", "Yes", "-", "No", "Yes", "-", "No", "-", "No", "No", "No", "-", "No", "No", "~
$ Imposter.Kills          <chr> ..... 
```
  <p> เราจะเห็นได้ว่าข้อมูลที่เราเลือกมาทั้้งหมดนั้นเป็น chr หมดเลย ทำให้เราต้องแปลงไทป์ต่างๆสำหรับการใช้ข้อมูลของเรา </p>
  <p> จาก dataset ของเรา พวกเราได้วิเคราะห์ออกมาว่า ข้อมูลนี้เป็นข้อมูลที่มีการ <strong>แพ้ชนะ</strong> และตัวแปรต่างๆนั้น ก็อาจจะมีผลต่อการแพ้ชนะ ทำให้ข้อมูลต่างๆนั้นมีผลต่อกันและกัน ทำให้เราสามารถตั้งคำถามได้มากมาย เช่น ถ้ามองจากภาพรวม เมื่อเราอยู่ฝ่าย Crewmate และไปดูที่ตัวแปร Task Completed นั้นจะเห็นได้ว่า ยิ่งเราทำ Task มากเท่าไหร่ เรายิ่งมีโอกาศชนะมากยิ่งขึ้น และ ยังพ่วงไปกับตัวแปร All Tasks Complete ที่ยิ่งเราทำ Task มากเท่าไหร่ All Tasks Complete ก็จะสำเร็จ อีกด้วย </p>
  

           
## Step 5 Cleaning Dataset
### Loading library and dataset
```{R}
#Loading library
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(tidyr)

#Loading DataSet
read.csv("C:\\Users\\Admin\\Desktop\\214mid\\amongUs_original.csv")
amongUs <- read.csv("C:\\Users\\Admin\\Desktop\\214mid\\amongUs_original.csv")
View(amongUs)
```



### TransformData
```{R}
amongUs <- amongUs %>% rename(
  
  Date = X.ปฟGame.Completed.Date,
  MyTaskCompleted = Task.Completed,
  AllTeamTasksCompleted = All.Tasks.Completed,
  MyKills = Imposter.Kills,
  TotalTimePerMin = Game.Length,
  MySabotagesFixed = Sabotages.Fixed
  
)
```
### Change data type and remove String
เช็ค type ของ dataset เรา
```{R}
glimpse(amongUs)
```
ผลลัพท์ 
```{R}
$ X.ปฟGame.Completed.Date <chr> "12/13/2020 at 1:46:30 am EST", "12/13/2020 at 1:37:06 am EST", "12/13/2020 at 1:22:~
$ Team                    <chr> "Crewmate", "Crewmate", "Imposter", "Crewmate", "Crewmate", "Imposter", "Crewmate", ~
$ Outcome                 <chr> "Win", "Loss", "Loss", "Win", "Win", "Loss", "Win", "Win", "Loss", "Loss", "Loss", "~
$ Task.Completed          <chr> "4", "8", "-", "5", "9", "-", "7", "-", "7", "6", "3", "-", "7", "2", "5", "4", "-",~
$ All.Tasks.Completed     <chr> "No", "Yes", "-", "No", "Yes", "-", "Yes", "-", "Yes", "No", "No", "-", "Yes", "No",~
$ Murdered                <chr> "Yes", "Yes", "-", "No", "Yes", "-", "No", "-", "No", "No", "No", "-", "No", "No", "~
$ Imposter.Kills          <chr> "-", "-", "1", "-", "-", "3", "-", "2", "-", "-", "-", "2", "-", "-", "-", "-", "1",~
$ Game.Length             <chr> 7m29s, 8m24s, 14m26s, 9m25s, 15ms41, 21m05s, 12m34s, 4m07s, 16m02s, 10m29s, 8m00s, 11m53s, 11m07s~
$ Ejected                 <chr> "No", "No", "No", "No", "No", "Yes", "No", "No", "No", "Yes", "Yes", "Yes", "No", "N~
$ Sabotages.Fixed         <chr> "2", "1", "N/A", "1", "0", "N/A", "1", "N/A", "1", "0", "0", "N/A", "0", "1", "0", "~
```

#### แปลงเป็น numeric
```{R}
##ลบ - ออก
is.numeric(amongUs$MyTaskCompleted)
amongUs$MyTaskCompleted <- amongUs$MyTaskCompleted %>% str_remove("-") %>% as.numeric()

is.numeric(amongUs$MyKills)
amongUs$MyKills <- amongUs$MyKills %>% str_remove("-") %>% as.numeric()

##ลบ N/A ออก
is.numeric(amongUs$MySabotagesFixed)
amongUs$MySabotagesFixed <- amongUs$MySabotagesFixed %>% str_remove("N/A") %>% as.numeric()
```
#### แปลงเป็น factor เพื่อที่จะนำข้อมูลไปคำนวน
```{R}
amongUs$Team <- as.factor(amongUs$Team)
summary(amongUs$Team)

amongUs$Outcome <- as.factor(amongUs$Outcome)
summary(amongUs$Outcome)

amongUs$AllTeamTasksCompleted <- as.factor(amongUs$AllTeamTasksCompleted)
summary(amongUs$AllTeamTasksCompleted)

amongUs$Murdered <- as.factor(amongUs$Murdered)
summary(amongUs$Murdered)

amongUs$Ejected  <- as.factor(amongUs$Ejected)
summary(amongUs$Ejected)


```
#### Game.Length หรือ TotalTimePerMin ใช้ excel ในการแปลงจาก 00m00s เป็น 00.00

โดยการใช้ฟังช์กัน ctrl + H  

![alt text](./timeCleaning.png)

## Step 6 Define a question
1. อัตราชนะของทีมไหนมากกว่ากัน
2. ค่าเฉลี่ยของการทำภารกิจที่เราทำได้ในแต่ละตา และ โอกาศที่ทั้งทีมจะทำภารกิจสำเร็จ
3. ต้องทำภารกิจประมาณกี่อันต่อคน ภารกิจทั้งทีมถึงจะสำเร็จ , Crewmate win
4. ต้องฆ่า Crewmate ประมาณกี่คน Imposter ถึงชนะ
5. แสดงสถิติต่างๆที่เกี่ยวกับระยะเวลาในการเล่น
6. โอกาศกี่เปอร์เซ็นที่เราจะโดน Imposter ฆ่า
7. ระหว่าง Crewmate กับ Imposter ทีมไหนใช้เวลาในการเอาชนะได้ไวกว่ากัน
8. โอกาศที่เราจะถูกสุ่มเป็น Crewmate หรือ Imposter ฝั่งไหนมากกว่ากัน


## Step 7 Exploratory Data Analysis with Stat

### :question: 1. อัตราชนะของทีมไหนมากกว่ากัน
หาอัตราชนะของทีม Imposter
#### code
```{R}
ImposterWin <- count(amongUs$Team == "Imposter" & amongUs$ Outcome =="Win" )
AllImposter <- count(amongUs$Team == "Imposter" )

ImposterWin/AllImposter
```
#### result
```{R}
0.4347826
```
หาอัตราชนะของทีม Crewmate
#### code

```{R}
CrewmateWin <- count(amongUs$Team == "Crewmate" & amongUs$ Outcome =="Win" )
AllCrewmate <- count(amongUs$Team == "Crewmate" )

CrewmateWin/AllCrewmate

```
#### result
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
### :question:  6. โอกาศกี่เปอร์เซ็นที่เราจะโดน Imposter ฆ่า
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

### :question: 8. โอกาศที่เราจะถูกสุ่มเป็น Crewmate หรือ Imposter ฝั่งไหนมากกว่ากัน
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


