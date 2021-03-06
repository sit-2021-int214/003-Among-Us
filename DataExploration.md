##  Step 1.) Search datasets from Kaggle

พวกเราเจอ dataset ที่แปลกและน่าสนใจ น่านำมาวิเคราะห์ นั่นคือ dataset ที่เกี่ยวกับข้อมูลของเกม<strong> amongUs</strong> <br>
Dataset from : https://www.kaggle.com/ruchi798/among-us-dataset/version/27?select=User2.csv

## Step 2.) Explore the dataset from the original dataset
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

## Data Exploration and Analysis
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
Task Completed กับ All Tasks Completed ถ้าอ่านผ่านๆอาจจะสับสน ภารกิจที่เสร็จ? ภารกิจทั้งหมดที่เสร็จ? จริงๆแล้วความหมายของมันคือ จำนวนภารกิจของเราที่สำเร็จ กับ ภารกิจของทั้งทีมว่าสำเร็จหรือไม่
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
