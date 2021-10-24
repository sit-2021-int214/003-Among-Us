#Library
library(dplyr)
library(readr)
library(ggplot2)

#Import Dataset
Programing_Books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(Programing_Books)
glimpse(Programing_Books)

#1หนังสือที่มี Rating สูงที่สุด 5 อันดับแรก
Programing_Books %>% select(Book_title, Rating) %>%
  slice_max(Rating, n=5)

#2หาหนังสือที่มี ราคาถูกที่สุด 3 เล่ม
Programing_Books %>% 
  select(Book_title,Price) %>% slice_min(Price, n=3)

#3แสดงหนังสือเล่มที่มีการ Review มากที่สุด และน้อยที่สุด
Programing_Books %>% filter(Reviews == max(Programing_Books$Reviews) | Reviews == min(Programing_Books$Reviews)) %>% 
  select(Book_title, Reviews) %>% arrange(desc(Reviews))


#4แสดงประเภทของหนังสือที่มีจำนวนหน้ามกกว่า 1000
Programing_Books %>% 
  filter(Number_Of_Pages > 1000) %>%
  select(Type,Number_Of_Pages)

#5แสดงหนังสือที่มีราคามากกว่า 15 และมีจำนวนหน้าน้อยที่สุด
Programing_Books %>% select(Book_title, Number_Of_Pages, Price) %>%
  filter(Price > 15) %>% slice_min(Number_Of_Pages)


#6หาว่าหนังสือแต่ละประเภท มีจำนวนหนังสือที่มีราคามากกว่าค่าเฉลี่ยของราคาอยู่ประเภทละกี่เล่ม
Programing_Books %>% 
  filter(Price > mean(Price)) %>% group_by(Type) %>% count()

#กราฟ1
ggplot(Programing_Books,aes(x=Rating)) + geom_bar()

#กราฟ2
Programing_Books %>% ggplot(aes(x= Type,y=Rating))+geom_point(aes(color= Type))

                  
                  
