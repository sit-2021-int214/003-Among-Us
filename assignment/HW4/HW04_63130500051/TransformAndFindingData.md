## Part 3: Transform data with dplyr and finding insight the data

### ✨1. แสดงรายชื่อหนังสือ คำอธิบาย และประเภท ของหนังสือที่มี Rating ตั้งแต่คะแนน 4.5 ขึ้นไป และส่วนใหญ่เป็นประเภทของอะไร
#### code
```
prog_book %>% select(Book_title, Description, Type) %>% filter(prog_book$Rating >= 4.5)
```
#### Result
```
Book_title              Description             Type  
   <fct>                   <fct>                   <fct> 
 1 ZX Spectrum Games Code~ "This book is ideal fo~ Paper~
 2 Your First App: Node.js "A tutorial for real-w~ ebook 
 3 High Performance Brows~ "How prepared are you ~ Paper~
 4 The Elements of Comput~ "This book is based on~ Hardc~
 5 Build Web Applications~ "This book is primaril~ Paper~
 6 C# in Depth             "C# has changed signif~ Paper~
 7 Designing Data-Intensi~ "Want to know how the ~ Paper~
 8 The Linux Programming ~ "The Linux Programming~ Hardc~
 9 Practical Object Orien~ "The Complete Guide to~ Paper~
10 Fluent Python: Clear, ~ "Python's simplicity l~ Paper~
11 CLR via C# (Developer ~ "Dig deep and master t~ Paper~
12 The Art of Computer Pr~ "\"The bible of all fu~ Hardc~
```
#### สรุปผล
```
หนังสือที่มี Rating ตั้งแต่คะแนน 4.5 ขึ้นไปมีทั้งหมด 12 เล่ม และส่วนใหญ่เป็นประเภท Paperback 
```

### ✨2. หนังสือที่มี rating สูงที่สุดคือ
#### code
```
prog_book %>% select(Book_title, Rating) %>% filter(Rating == max(Rating))
```
#### Result
```
Book_title              Rating
  <fct>                    <dbl>
1 Your First App: Node.js      5
```
#### สรุปผล
```
หนังสือที่มี Rating สูงที่สุดคือ Your First App: Node.js โดยมีคะแนน Rating อยู่ที่ 5 คะแนน
```

### ✨3. อยากรู้ว่าหนังสือทั้งหมดมีกี่ประเภท และมีอะไรบ้าง
#### code
```
prog_book %>% distinct(Type) #มี 6 ประเภท

#แต่ละประเภทมีจำนวนกี่เล่ม
prog_book %>% count(Type == "Hardcover")
prog_book %>% count(Type == "Kindle Edition")
prog_book %>% count(Type == "Paperback")
prog_book %>% count(Type == "ebook")
prog_book %>% count(Type == "Boxed Set - Hardcover")
prog_book %>% count(Type == "Unknown Binding")
```
#### Result
```
 Type                 
  <fct>                
1 Hardcover            
2 Kindle Edition       
3 Paperback            
4 ebook                
5 Unknown Binding      
6 Boxed Set - Hardcover
```
#### สรุปผล
```
หนังสือมีทั้งหมด 6 ประเภท ดังนี้
1. Hardcover            
2. Kindle Edition       
3. Paperback            
4. ebook                
5. Unknown Binding      
6. Boxed Set - Hardcover
```

### ✨4. แสดง 10 อันดับหนังสือที่มีราคาถูกที่สุด
#### code
```
toplowprice <- prog_book %>% select(Book_title, Price) %>% arrange(Price)
toplowprice <- head(toplowprice, 10) 
toplowprice

```
#### Result
```
 Book_title                                                   Price
   <fct>                                                        <dbl>
 1 The Elements of Style                                         9.32
 2 The Information: A History, a Theory, a Flood                11   
 3 Responsive Web Design Overview For Beginners                 11.3 
 4 Ghost in the Wires: My Adventures as the World's Most Wante~ 12.9 
 5 How Google Works                                             13.2 
 6 The Meme Machine                                             14.2 
 7 Start with Why: How Great Leaders Inspire Everyone to Take ~ 14.2 
 8 Algorithms to Live By: The Computer Science of Human Decisi~ 14.4 
 9 Weapons of Math Destruction: How Big Data Increases Inequal~ 14.5 
10 ZX Spectrum Games Code Club: Twenty fun games to code and l~ 14.6 
```
#### สรุปผล
```
หนังสือที่มีราคาถูกที่สุดคือ The Elements of Style  มีราคาอยู่ที่ $9.32 
```

### ✨5. แสดงอันดับหนังสือที่มีการ Review มากที่สุด
#### code
```
top_review  <- prog_book %>% select(Book_title, Reviews) %>% slice_max(Reviews, n=5)
top_review
```
#### Result
```
Book_title                                                  Reviews
  <fct>                                                         <dbl>
1 Start with Why: How Great Leaders Inspire Everyone to Take~    5938
2 The Elements of Style                                          3829
3 The Phoenix Project: A Novel About IT, DevOps, and Helping~    2629
4 The Goal: A Process of Ongoing Improvement                     2290
5 Weapons of Math Destruction: How Big Data Increases Inequa~    2093
```
#### สรุปผล
```
หนังสือที่มีการ Review มากที่สุดคือ Start with Why: How Great Leaders Inspire Everyone to Take~ โดยมีคะแนน Review อยู่ที่ 5,938 คะแนน
```

### ✨6. หนังสือที่มีจำนวนหน้าที่มากสุด กับ น้อยสุด มีราคาเท่าไหร่
#### code
```
max_page <- prog_book %>% select(Book_title, Number_Of_Pages, Price) %>%
  filter(Number_Of_Pages == max(Number_Of_Pages))
max_page

min_page <- prog_book %>% select(Book_title, Number_Of_Pages, Price) %>%
  filter(Number_Of_Pages == min(Number_Of_Pages))
min_page

max_page$Price - min_page$Price
```
#### Result
```
#max_page

  Book_title                                    Number_Of_Pages Price
  <fct>                                                   <dbl> <dbl>
1 The Art of Computer Programming, Volumes 1-4~            3168  220.

#min_page
  Book_title                                   Number_Of_Pages Price
  <fct>                                                  <dbl> <dbl>
1 Responsive Web Design Overview For Beginners              50  11.3

```
#### สรุปผล
```
หนังสือที่มีจำนวนหน้าที่มากสุด คือ The Art of Computer Programming, Volumes 1-4~ มีจำนวน 3168 หน้า ราคาอยู่ที่ $220

หนังสือที่มีจำนวนหน้าที่ohvpl6f คือ Responsive Web Design Overview For Beginners มีจำนวน 50 หน้า ราคาอยู่ที่ $50

```
