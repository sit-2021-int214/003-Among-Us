# Part 2 : Learning function from Tidyverse & Transform data with dplyr and finding insight the data

#### 1. หนังสือที่มี Rating สูงที่สุด 5 อันดับแรก
#### Code
```{R}
Programing_Books %>% select(Book_title, Rating) %>%
  slice_max(Rating, n=5)
```
#### Result
```{R}
Book_title                                                                                                   Rating
1 Your First App: Node.js                                                                                     5.00
2 The Art of Computer Programming, Volumes 1-4a Boxed Set                                                     4.77
3 Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems    4.72
4 Build Web Applications with Java: Learn every aspect to build web applications from scratch                 4.67
5 Fluent Python: Clear, Concise, and Effective Programming                                                    4.67
```
#### 2. หาหนังสือที่มี ราคาถูกที่สุด 2 เล่ม
#### Code
```{R}
Programing_Books %>%select(Book_title,Price) %>% 
  slice_min(Price, n=3)
```
#### Result
```{R}
 Book_title                                       Price
1 The Elements of Style                           9.323529
2 The Information: A History, a Theory, a Flood   11.000000
3 Responsive Web Design Overview For Beginners    11.267647           
```
#### 3. แสดงหนังสือเล่มที่มีการ Review มากที่สุด และน้อยที่สุด
#### Code
```{R}
Programing_Books %>% filter(Reviews == max(Programing_Books$Reviews) | Reviews == min(Programing_Books$Reviews)) %>% 
  select(Book_title, Reviews) %>% arrange(desc(Reviews))
```
#### Result
```{R}
Book_title                                                                                                     Reviews
1 Essential Scrum: A Practical Guide to the Most Popular Agile Process                                         92
2 The C++ Programming Language                                                                                 92
3 Responsive Web Design Overview For Beginners                                                                 0
4 ZX Spectrum Games Code Club: Twenty fun games to code and learn                                              0
5 Game Programming Golden Rules                                                                                0
6 Beginners Guide On PHP Programming: Quick And Easy Guide To Learn PHP With My-SQL                            0
7 Python Programming Books Set: Python Programming for Beginners & Complete Guide for Python Programming       0
8 Your First App: Node.js                                                                                      0
9 Python Programming For Beginners: Quick And Easy Guide For Python Programmers                                0
10 Building an FPS Game with Unity                                                                             0
11 Advanced Game Programming: A Gamedev.Net Collection                                                         0
12 Basic Proof Theory                                                                                          0
13 Cross-Platform Game Programming (Game Development) (Charles River Media Game Development)                   0
14 Lambda-Calculus, Combinators and Functional Programming                                                     0
15 The Calculus of Computation: Decision Procedures with Applications to Verification                          0
16 Communication Networks: Fundamental Concepts and Key Architectures                                          0
17 Genetic Programming II: Automatic Discovery of Reusable Programs                                            0
18 Game Programming Gems 2                                                                                     0
19 Game Programming Gems 5                                                                                     0
20 A First Course in Logic: An Introduction to Model Theory, Proof Theory, Computability, and Complexity       0
21 Game Programming Gems 6                                                                                     0
22 Game Programming Gems 4                                                                                     0
23 Game Programming Gems 3                                                                                     0
24 3D Game Engine Architecture: Engineering Real-Time Applications with Wild Magic (The Morgan Kaufmann Series in Interactive 3d Technology)       0
```
#### 4. แสดงประเภทของหนังสือที่มีจำนวนหน้ามากกว่า 1000
#### Code
```{R}
Programing_Books %>% 
  filter(Number_Of_Pages > 1000) %>%
  select(Type,Number_Of_Pages)
```
#### Result
```{R}
    Type            Number_Of_Pages
1  Paperback            1200
2  Paperback            1008
3  Hardcover            1506
4  Paperback            1214
5  Hardcover            1040
6  Hardcover            1142
7  Hardcover            1180
8  Hardcover            1052
9  Hardcover            1056
10 Paperback            1136
11 Hardcover            1136
12 Hardcover            1132
13 Hardcover            1040
14 Hardcover            1235
15 Paperback            1040
16 Hardcover            3168          
```
#### 5. แสดงหนังสือที่มีราคามากกว่า 15 และมีจำนวนหน้าน้อยที่สุด
#### Code
```{R}
Programing_Books %>% select(Book_title, Number_Of_Pages, Price) %>%
  filter(Price > 15) %>% slice_min(Number_Of_Pages)
```
#### Result
```{R}
    Book_title Number_Of_Pages                                Price
1 The Principles of Object-Oriented JavaScript             120 27.24412 
```
#### 6. หาว่าหนังสือแต่ละประเภท มีจำนวนหนังสือที่มีราคามากกว่าค่าเฉลี่ยของราคาอยู่ประเภทละกี่เล่ม
#### Code
```{R}
Programing_Books %>% 
filter(Price > mean(Price)) %>% group_by(Type) %>% count()
```
#### Result
```{R}
     Type                   n
1 Boxed Set - Hardcover     1
2 ebook                     3
3 Hardcover                61
4 Paperback                40
```
