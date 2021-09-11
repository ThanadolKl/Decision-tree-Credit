# Decision-tree-Credit


##  Summary Dataset
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

### as num

~~~
> typeof(credit_df$A2)
[1] "double"
> typeof(credit_df$A14)
[1] "double"
~~~
## Univariate
### A1
~~~
# Groups:   A1 [3]
  A1        n
  <chr> <int>
1 ?        12
2 a       210
3 b       468
~~~
### A2
~~~
  A2     n
   <dbl> <int>
 1  13.8     1
 2  15.2     1
 3  15.8     1
 4  15.8     2
 5  15.9     1
 6  16       2
 7  16.1     2
 8  16.2     1
 9  16.2     2
10  16.3     3
~~~

### A3
~~~
   A3     n
   <dbl> <int>
 1 0        19
 2 0.04      5
 3 0.08      1
 4 0.085     1
 5 0.125     5
 6 0.165     8
 7 0.17      1
 8 0.205     3
 9 0.21      3
10 0.25      6
~~~
### A4
~~~
  A4        n
  <chr> <int>
1 ?         6
2 l         2
3 u       519
4 y       163
~~~
### A5
~~~
  A5        n
  <chr> <int>
1 ?         6
2 g       519
3 gg        2
4 p       163
~~~

### A6
~~~
   A6        n
   <chr> <int>
 1 ?         9
 2 aa       54
 3 c       137
 4 cc       41
 5 d        30
 6 e        25
 7 ff       53
 8 i        59
 9 j        10
10 k        51
11 m        38
12 q        78
13 r         3
14 w        64
15 x        38
~~~
