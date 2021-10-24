## Part 2: Learning function from Tidyverse

- Function `distinct()` from package [dplyr](https://dplyr.tidyverse.org/articles/base.html)). Select distinct/unique rows.
- Function `pull()` from package [dplyr](https://dplyr.tidyverse.org/articles/base.html)). extracts a variable either by name or position.
- Function `relocate()` from package [dplyr](https://dplyr.tidyverse.org/articles/base.html)). makes it easy to move a set of columns to a new position (by default, the front).


## Example: 

### 1. ใช้ `distinct()` เพื่อหาว่าหนังสือทั้งหมดมีอยู่กี่ประเภท

code:

```
prog_book %>% distinct(Type)
```
result:
```
  Type                               
1 Hardcover            
2 Kindle Edition       
3 Paperback            
4 ebook                
5 Unknown Binding      
6 Boxed Set - Hardcover
```

### 2. ใช้ `pull()` ในการดึง Reviews ออกมา


code:
```
prog_book %>% pull(Reviews)
```
result:
```
prog_book %>% pull(Reviews)
  [1] 3829 1406    0 1658 1325  117 5938 1817 2093    0  160  481   33 1255  593
 [16]  417   80  279  370 2092   27  676   16 1268    0   19  491   48    1    1
 [31]   16   39  356   86  295   57  124   91  530   61  336    0    4  115    0
 [46] 2629  108  120   38  154    9   19 1035  302    0  116  126   17   58  130
 [61]    3   50   78    3    0   22   71  547   11  203   58    1   17   58  259
 [76]  153    2    5   33   11   73    3  279   47  278  125    2  161  161    8
 [91] 2290  118   57   59    2  122   64   21  200   15   75    1    3   52    4
[106]   68   43   18   39  496   18   13   10   47    1   33   23   61   31  395
[121]    8   43  746  464   79   65   66    4   11   53    1  362    1   41   70
[136]  122   55   28  875  452  163  168   59   26   32   92  171    4    0    1
[151]   27    1   52   63   35   11   50    2    6    9  404  134   69    9    1
[166]   13   57  302    8    1    2  275  116   26  164  164    1    0    0   11
[181]  224   13    0  351    9    5   25    0   34   18   15   52   26    1   78
[196]   20   13   62   58    0   17   11   39  150   36  426   92    6   13   36
[211]  191   18    0    5    2    1   48    5   11   35   28    3   39   79   20
[226]   45    0    3   88    3   10   27   28    4   48    6   66    5    0    0
[241]  194    3    4   44    7   21    0    2   25    1   31   38   56   56   15
[256]    2   14   13   16  130    1    0   56    0    0    5    0   22   36    4
[271]    5
```


### 3. ใช้ `relocate()` ในการย้ายคอลัมน์ Book_title, Rating, Reviews และ Price มาไว้ด้านหน้า

code:
```
prog_book %>% relocate(Book_title, Rating, Reviews, Price)
```
result:
```
 Book_title         Rating Reviews Price Description         Number_Of_Pages Type 
   <chr>               <dbl>   <dbl> <dbl> <chr>                         <dbl> <chr>
 1 The Elements of S~   4.17    3829  9.32 "This style manual~             105 Hard~
 2 The Information: ~   4.01    1406 11    "James Gleick, the~             527 Hard~
 3 Responsive Web De~   3.33       0 11.3  "In Responsive Web~              50 Kind~
 4 Ghost in the Wire~   3.97    1658 12.9  "If they were a ha~             393 Hard~
 5 How Google Works     4.06    1325 13.2  "Both Eric Schmidt~             305 Kind~
 6 The Meme Machine     3.84     117 14.2  "What is a meme? F~             288 Pape~
 7 Start with Why: H~   4.09    5938 14.2  "Why do you do wha~             256 Hard~
 8 Algorithms to Liv~   4.15    1817 14.4  "A fascinating exp~             368 Hard~
 9 Weapons of Math D~   3.87    2093 14.5  "A former Wall Str~             259 Hard~
10 ZX Spectrum Games~   4.62       0 14.6  "This book is idea~             128 Pape~
# ... with 261 more rows
```

เมื่อเรียนรู้ Learning function from Tidyverse เสร็จแล้ว ก็ถึงเวลาลงมือทำกันเถอะ [ไปกันเล้ยยย](./TransformAndFindingData.md)
