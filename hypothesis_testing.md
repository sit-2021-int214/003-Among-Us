

# Analytical Inferential Statistics
## Defind question
ตั้งสมมติฐานว่า เกมที่เราเป็น imposter แล้วชนะ จะต้องเล่นจบภายในเวลาขั้นต่ำ 9 นาที ซึ่งใน เกมที่เราเป็น imposter แล้วชนะมีเวลาเล่นเฉลี่ยอยู่ที่ 8.64 นาที และมีส่วนเบี่ยงเบนมาตรฐาน เท่ากับ 4.998338 นาที ( ถ้ากำหนดค่า alpha เท่ากับ 0.05 )

Step 0: Assign variables

```
ImWin <-amongUs %>% filter(Team == "Imposter" , Outcome =="Win") %>% select(TotalTimePerMin)  #เอาเฉพาะเกมที่ imposter ชนะ
glimpse(ImWin) #ดูข้อมูลที่ได้

#จำนวนตาที่ชนะ
n <- 261 

#ค่าเฉลี่ยของเวลาที่เล่น 
ImWin$TotalTimePerMin %>% mean() 

#หา sd 
sdImWin <- unlist(ImWin) #
sd(sdImWin)
```

Step 1: State the hypothesis

```
Ho:mue>=9
Ha:mue<9
```

Step 2: Level of significance

```
alpha = 0.05 
```

Step 3: Test statistic

```
z <- (mean - 9)/(sd/sqrt(n))
```

Step 4: Finding P-value approach or Critical Value approach

```
# P-value
pvalue <- pnorm(z)
# Critical Value 
zalphaStreams <- qnorm(0.05)
```

Step 5: Compare

```
if(pvalue<=0.05){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(zStreams<=zalphaStreams){
  print("Reject H0")
}else{
  print("Accept H0")
}
```

Step 6: Conclusion
```
เกมที่เราเป็น imposter แล้วชนะ จะต้องเล่นจบภายในเวลาขั้นต่ำ 9 นาที 
```
