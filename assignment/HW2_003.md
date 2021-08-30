# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) หาผู้ทำ survey ว่ามีคนที่ไม่เคยสูบบุหรี่กี่คน
```{R}
table(survey$Smoke == "Never")
```

2.) อยากรู้ว่านักเรียนที่ออกกำลังกายเป็นประจำ มีทั้งหมดกี่คน
```{R}
table(survey$Exer=="Freq")
```

3.) ค่าเฉลี่ยของอายุทั้งหมดใน survey
```{R}
mean(survey$Age)
```

4.) นักเรียนที่กอดอกแล้วแขนขวาอยู่บนแขนซ้าย
```{R}
table(survey$Fold=="R on L")
```

5.) ส่วนสูงที่สูงที่สุดใน survey
```{R}
max(survey$Height,na.rm =TRUE)
```

6.) น้ำหนักหัวใจแมวทุกตัวรวมกัน
```{R}
sum(cats$Hwt)
```


### Team: xxxxxxx

1. ชื่อ นางสาวชลิดาภรณ์ ช่วงดอนไพร     StudentID: 63130500018
2. ชื่อ นายณัฎฐกิตติ์ รัตนศิริพรหม        StudentID: 63130500028
3. ชื่อ นายธนวัฒน์ แน่จริง              StudentID: 63130500051
4. ชื่อ นายนัฐวัฒ รอดสมบุญ            StudentID: 63130500069

