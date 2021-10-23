# Part 1 : Explore the dataset
### Step 1 : ทำการเรียกใช้ Library
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
```
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.…
$ Reviews         <chr> "3,829", "1,406", "0", "1,658", "1,325", "117", "5…
$ Book_title      <chr> "The Elements of Style", "The Information: A Histo…
$ Description     <chr> "This style manual offers practical advice on impr…
$ Number_Of_Pages <int> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 3…
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardc…
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.1647…
```

ผลลัพธ์ที่ได้คือ เรามีข้อมูลอยู่ 271 แถว และมีคอลัมน์อยู่ 7 คอลัมน์ ซึ่งแต่ละคอลัมน์มีข้อมูล ดังนี้
- Rating : คะแนนที่ผู้อ่านประเมินให้กับหนังสือ
- Reviews : จำนวนคนรีวิวหนังสือ
- Book_title : ชื่อของหนังสือ
- Description : รายละเอียดของหนังสือ
- Number_Of_Pages : จำนวนหน้าของหนังสือ
- Type : ประเภทของหนังสือ
- Price : ราคาของหนังสือ
