# Decision-tree-Credit
# Authors : Thanadol Klainin 6S No.8 | Chalisa Pornsukjantra 6C No.6
# Contents
* Data Preparation
* Exploratory Data Analysis --> Univariate
* Data Cleaning --> Remove NA
* Building Decision tree
* Evaluating model
* Adjusting Complexity parameter

---

##  Data Preparation
> เมื่อทำการ Import data เข้ามาแล้ว ทำการ summary data ดูคร่าว ๆ ก่อนว่า data ในแต่ละ column เป็น type อะไร 

~~~
> summary(credit_df)
      A1                 A2                  A3              A4           
 Length:690         Length:690         Min.   : 0.000   Length:690        
 Class :character   Class :character   1st Qu.: 1.000   Class :character  
 Mode  :character   Mode  :character   Median : 2.750   Mode  :character  
                                       Mean   : 4.759                     
                                       3rd Qu.: 7.207                     
                                       Max.   :28.000                     
      A5                 A6                 A7                  A8        
 Length:690         Length:690         Length:690         Min.   : 0.000  
 Class :character   Class :character   Class :character   1st Qu.: 0.165  
 Mode  :character   Mode  :character   Mode  :character   Median : 1.000  
                                                          Mean   : 2.223  
                                                          3rd Qu.: 2.625  
                                                          Max.   :28.500  
      A9                A10                 A11           A12                A13           
 Length:690         Length:690         Min.   : 0.0   Length:690         Length:690        
 Class :character   Class :character   1st Qu.: 0.0   Class :character   Class :character  
 Mode  :character   Mode  :character   Median : 0.0   Mode  :character   Mode  :character  
                                       Mean   : 2.4                                        
                                       3rd Qu.: 3.0                                        
                                       Max.   :67.0                                        
     A14                 A15                Y            
 Length:690         Min.   :     0.0   Length:690        
 Class :character   1st Qu.:     0.0   Class :character  
 Mode  :character   Median :     5.0   Mode  :character  
                    Mean   :  1017.4                     
                    3rd Qu.:   395.5                     
                    Max.   :100000.0          
~~~

> จากนั้นจะเจอปัญหาอยู่ที่ column A2 และ A14 ที่ข้อมูลจริง ๆ ควรเป็น numeric แต่จริง ๆ แล้วเป็น character ซึ่งเวลานำ model ไป predict จะเกิดปัญหาว่า factors บางตัวอาจจะไม่อยู่ใน training set แต่ไปโผล่ใน test set ซึ่งพอเป็น character มันจะนับว่าเป็น class ใหม่ ทำให้เกิด Error ดังข้อความด้านล่าง 

~~~
Error in model.frame.default(Terms, newdata, na.action = na.action, xlev = attr(object,  : 
  factor A4 has new levels 
~~~

> จึงต้องทำการเปลี่ยน A2 และ A14 เป็น as.numeric(credit_clean$A2) and as.numeric(credit_clean$A14)

### Change character to numeric

~~~
> typeof(credit_df$A2)
[1] "double"
> typeof(credit_df$A14)
[1] "double"
~~~

---

## Exploratory Data Analysis [Univariate]
> ทำการ print data ในแต่ละ column ว่ามีอะไรบ้าง มีจำนวนเท่าไหร่ มี NA ตรงไหนบ้าง
#### Column: A1

~~~
# Groups:   A1 [3]
  A1        n
  <chr> <int>
1 ?        12
2 a       210
3 b       468
~~~

#### Column: A2

~~~
> summary(credit_df$A2)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  13.75   22.60   28.46   31.57   38.23   80.25      12 
~~~

#### Column: A3

~~~
> summary(credit_df$A3)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  0.000   1.000   2.750   4.759   7.207  28.000 
~~~

#### Column: A4

~~~
  A4        n
  <chr> <int>
1 ?         6
2 l         2
3 u       519
4 y       163
~~~

#### Column: A5

~~~
  A5        n
  <chr> <int>
1 ?         6
2 g       519
3 gg        2
4 p       163
~~~

#### Column: A6

~~~
   A6        n
   <chr> <int>
 1 ?         9
 2 aa       54
 3 c       137
 .............
~~~

#### Column: A7

~~~
  A7        n
   <chr> <int>
 1 ?         9
 2 bb       59
 3 dd        6
 .............
~~~

#### Column: A8

~~~
      A8     n
   <dbl> <int>
 1 0        70
 2 0.04     33
 3 0.085    26
~~~

#### Column: A9

~~~
  A9        n
  <chr> <int>
1 f       329
2 t       361
~~~

#### Column: A10

~~~
  A10       n
  <chr> <int>
1 f       395
2 t       295
~~~

#### Column: A11 

~~~
    A11     n
   <int> <int>
 1     0   395
 2     1    71
 3     2    45
 4     3    28
 5     4    15
~~~

### Column: A12

~~~
  A12       n
  <chr> <int>
1 f       374
2 t       316
~~~

#### Column: A13

~~~
  A13       n
  <chr> <int>
1 g       625
2 p         8
3 s        57
~~~
#### Column: A14

~~~
> summary(credit_df$A14)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
      0      75     160     184     276    2000      13 
~~~

#### Column: A15

~~~
> summary(credit_df$A15)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
     0.0      0.0      5.0   1017.4    395.5 100000.0 
~~~

## Data Cleaning  [Remove NA]
> จะเห็นว่ามีข้อมูล '?' และ NA อยู่หลายจุด อย่างแรกที่ทำคือ เปลี่ยน '?' --> NA แล้วกำจัด NA ทีเดียว 

~~~
credit_df[credit_df == '?'] <- NA
credit_clean <- na.omit(credit_df)
~~~

> ก็จะพบว่าจำนวนข้อมูลที่ clean แล้ว เหลือ 653 rows (จากตอนแรก 690 rows) 

~~~
> nrow(credit_clean)
[1] 653
~~~

---
## Building Decision tree
### Training and Test Sets: Splitting Data
> ทำการแบ่งเป็น Training set 70% และ Test set 30% 
> เมื่อนำมา Train model และทำการ Predict ค่าแล้ว นำไปคำนวณ Confusion matrix ได้ค่า Accuracy = 0.8673 และ F1-score = 0.8632 (ซึ่งค่า cp ตอนนี้ใช้ค่า Default = 0.01)

~~~
Confusion Matrix and Statistics

          Reference
Prediction  -  +
         - 88 13
         + 13 82
                                          
               Accuracy : 0.8673  
               F1 : 0.8632      
~~~

> ซึ่งจากค่า Accuracy และ F1-score ที่ได้ก็พบว่าค่อนข้างดีเลยทีเดียว และเมื่อทำการ plot Decision tree ออกมา ก็ได้ตามนี้ (file: Dt_0.01)

![0 01 default](https://user-images.githubusercontent.com/67301601/132957407-36d3661d-bee3-4450-b425-b8adbeff02ec.png)

---

## Adjusting Complexity parameter
> ทำ pruning โดยปรับค่า Complexity parameter จาก 0.001-1 เพื่อหาช่วงที่มี accuracy และ F1 score มากที่สุด โดยพบว่าช่วง 0.02-0.6 มีค่ามากที่สุด คือ accuracy 0.8724 และ F1 score 0.8768

| CP | Accuracy | F1-score |
|----|----------|----------|
| 0.001 |	0.8571 |	0.8495

