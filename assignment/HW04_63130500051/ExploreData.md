# Part 1: Explore the dataset
### Step 1: เรียกใช้ library และ import Dataset
```
#Library
library(dplyr)
library(readr)
library(ggplot2)

#Dataset
prog_book <- read_csv("E:\\Desktop\\SIT_KMUTT\\IT2_1_64\\INT214 Stat for IT\\data\\prog_book.csv")

```
result
```
Rows: 271 Columns: 7                                                                                                                                                                         
-- Column specification ------------------------------
Delimiter: ","
chr (3): Book_title, Description, Type
dbl (3): Rating, Number_Of_Pages, Price

i Use `spec()` to retrieve the full column specification for this data.
i Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

### Step 2: ทำการศึกษาข้อมูลในชุดนี้
```
prog_book
```
result
```
# A tibble: 271 x 7
   Rating Reviews Book_title                                                                             Description           Number_Of_Pages Type  Price
    <dbl>   <dbl> <chr>                                                                                  <chr>                           <dbl> <chr> <dbl>
 1   4.17    3829 The Elements of Style                                                                  "This style manual o~             105 Hard~  9.32
 2   4.01    1406 The Information: A History, a Theory, a Flood                                          "James Gleick, the a~             527 Hard~ 11   
 3   3.33       0 Responsive Web Design Overview For Beginners                                           "In Responsive Web D~              50 Kind~ 11.3 
 4   3.97    1658 Ghost in the Wires: My Adventures as the World's Most Wanted Hacker                    "If they were a hall~             393 Hard~ 12.9 
 5   4.06    1325 How Google Works                                                                       "Both Eric Schmidt a~             305 Kind~ 13.2 
 6   3.84     117 The Meme Machine                                                                       "What is a meme? Fir~             288 Pape~ 14.2 
 7   4.09    5938 Start with Why: How Great Leaders Inspire Everyone to Take Action                      "Why do you do what ~             256 Hard~ 14.2 
 8   4.15    1817 Algorithms to Live By: The Computer Science of Human Decisions                         "A fascinating explo~             368 Hard~ 14.4 
 9   3.87    2093 Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy "A former Wall Stree~             259 Hard~ 14.5 
10   4.62       0 ZX Spectrum Games Code Club: Twenty fun games to code and learn                        "This book is ideal ~             128 Pape~ 14.6 
# ... with 261 more rows
```

หรือจะใช้ glimpse()

```
glimpse(prog_book)
```
result
```
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87, 3.95, 3.85, 3.94, 3.75, 4.10, 4.22, 3.~
$ Reviews         <dbl> 3829, 1406, 0, 1658, 1325, 117, 5938, 1817, 2093, 0, 160, 481, 33, 1255, 593, 417, 80, 279, 370, 2092, 27, 676, 16, 1268, 0, 19,~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web Design Overview For Beginners", "Ghost~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the emphasis is on promoting a plain English~
$ Number_Of_Pages <dbl> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, 336, 542, 192, 242, 224, 412, 318, 432,~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "Hardcover", "Hardcover", "Hardcover", "~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14.502941, 14.641176, 15.229412, 15.22941~
```
### จากผลลัพธ์ด้านบนจะเห็นได้ว่ามีข้อมูลทั้งหมด 271 ข้อมูล และตัวแปรทั้งหมด 7 ตัว <br> ซึ่งแต่ละตัวแปรมีความหมาย ดังนี้
- Rating : คะแนนที่ผู้ใช้ให้กับหนังสือ
- Review : จำนวนรีวิวหนังสือ
- Book_title : ชื่อของหนังสือ
- Description : คำอธิบายสั้น ๆ ของหนังสือ
- Number_Of_Pages : จำนวนหน้าของหนังสือ
- Type : ประเภทของหนังสือ เช่น ปกแข็ง, e book, kindle book
- Price : ราคาเฉลี่ยของหนังสือ สกุลเงินเป็น USD คำนวณเฉลี่ยจาก 5 เว็บไซต์

หลังจากที่ดูความหมายของตัวแปรทั้งหมดแล้ว เราได้ประเมินว่าตัวแปรแต่ละตัวสามารถสื่อความหมายได้ และเมื่อเราได้ทำการสำรวจชุดข้อมูลเสร็จแล้ว ขั้นตอนต่อไปก็คือ เรียนรู้การใช้ฟังก์ชันจาก Tidyverse ซึ่งอยู่ใน Part 2 ถ้าพร้อมแล้วก็[ไปกันเล้ยยย!](./LearningFunction.md)
