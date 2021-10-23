# Part 3 : Transform data with dplyr and finding insight the data

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
