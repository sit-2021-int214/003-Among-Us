# 003-Among-Us
Original Datasets from: [Among Us Dataset](https://www.kaggle.com/ruchi798/among-us-dataset)


### About's Products Datasets

Among Us, เกมปี 2018 ได้รับความนิยมอย่างมากในช่วงฤดูร้อนปี 2020 นี่คือสถิติต่างๆในเกมของผู้เล่นหนึ่งคนต่อ 100 เกมที่เขาเล่นว่าเขาได้พบเจออะไรบ้าง 
ชุดข้อมูลนี้เป็นเรื่องเกี่ยวกับ
- ทีมที่ผู้เล่นได้รับระหว่างเล่น ( Crewmate vs Imposter )
- ผลลัพท์ของเกมนั้นๆ
- จำนวนภารกิจที่เรานั้นทำสำเร็จ
- ผลลัพท์ของภารกิจทั้งหมดว่าผู้เล่นทุกคนทำสำเร็จหรือไม่
- ถูกฆาตกรรมโดย Imposter หรือไม่ 
- จำนวนผู้เล่นที่เราสังหารเมื่อเป็น Imposter
- ระยะเวลาของเกม
- ถูกโหวตออกหรือไม่
- ไปแก้ไขการ Sabotages ของ Imposter ( ซ่อมไฟเมื่อ Imposter พัง )
## Overview
กลุ่มของเราเลือกชุดข้อมูลนี้เพราะ....
Among Us เป็นเกมนึงที่ได้รับความนิยมอย่างมากในช่วงปี 2020 Among Us เป็นเกมแนวจับผิด หาคนร้าย ซึ่งในแต่ละคนจะมีการสุ่มบทบาทเป็นของตัวเอง และ มีการเล่น มีการชนะ ได้หลายรูปแบบมาก เช่น ฆ่าทุกคน จับคนร้าย ทำภารกิจครบ โหวตออก และอื่นๆอีกมากมาย แต่ละรอบของเกมมีอะไรเกิดที่ไม่ซ้ำกัน ทำให้มีข้อมูลให้เราได้วิเคราะห์ ได้เล่นกับข้อมูลได้หลายอย่าง 

สิ่งที่อยากรู้ : 
1. อัตราชนะของทีมไหนมากกว่ากัน
2. ค่าเฉลี่ยของการทำภารกิจของเรา
3. ต้องทำภารกิจประมาณกี่อัน ภารกิจทั้งทีมถึงจะสำเร็จ , Crewmate win
4. ต้องฆ่า Crewmate ประมาณกี่คน Imposter ถึงชนะ
5. ระยะเวลาของเกมมีผลต่อการชนะของเกมไหม
6. โอกาศกี่เปอร์เซ็นที่เราจะโดน Imposter ฆ่า
7. ใช้เวลาในการเล่นเกมน้อยที่สุดแล้วเกมนั้นชนะ

### Steps 

1. Search datasets from Kaggle
2. Explore the dataset from the original dataset
3. Download Library and dataset
4. Exploratory Data Analysis
5. Cleaning Dataset
6. Define a question


### Tools

- R Language
- R Studio Desktop
- Excel
## Table of Contents
### all of the content
1. [Data Exploration](./DataExploration.md)
2. [Data Cleaning and Data Transformation](./DataCleaning.md)
3. [Define a question and EDA with stat](./DefineQuestion.md)
### Include content
[All Content](./AllStep.md)

## Resources


### Important Files in Repository

- [code_eda.R](./code_eda.R) : Exploratory Data Analysis
- [amongUs_original.csv](./amongUs_original.csv): Original Dataset
- [amongUsCleaned.csv](./amongUs_original.csv): Cleaned Dataset
- [clean-data.R](./clean-data.R): Code Clean Dataset

### References
https://www.youtube.com/watch?v=qsmDfQI4GcM&ab_channel=ContexturesInc.

## About Us
งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี
### Team: สแตทมาปัญญาไม่เกิด (003-Among-Us)


1. ชื่อ นางสาวชลิดาภรณ์ ช่วงดอนไพร StudentID: 63130500018
2. ชื่อ นายณัฎฐกิตติ์ รัตนศิริพรหม StudentID: 63130500028
3. ชื่อ นายธนวัฒน์ แน่จริง StudentID: 63130500051
4. ชื่อ นายนัฐวัฒ รอดสมบุญ StudentID: 63130500069


### Instructor
- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))



