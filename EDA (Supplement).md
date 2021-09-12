## Exploratory Data Analysis
### Univariate

> ทำการ Univariate ในแต่ละ column ที่ไม่ได้ใส่ข้างบน เพราะคิดว่ามันน่าจะเยอะไปครับ 

#### A1

![A1](https://user-images.githubusercontent.com/67301601/132985356-38e89aaf-b163-41a8-84cf-73aed4fa6c13.png)

#### A2

![A2](https://user-images.githubusercontent.com/67301601/132985578-318fe954-6d1a-423b-b91c-0c23ffe23be1.png)

#### A3

![A3](https://user-images.githubusercontent.com/67301601/132985593-ce603609-2d10-487f-8b28-aed40a7fc69c.png)
![A3 vs A1](https://user-images.githubusercontent.com/67301601/132985800-e71fbe36-47e5-477b-a746-4a429e901408.png)
![A3 vs A4](https://user-images.githubusercontent.com/67301601/132985801-28fdd74c-3afb-41cd-9f9c-5a772e4b5da4.png)


#### A4

![A4](https://user-images.githubusercontent.com/67301601/132985772-1cad1d6a-864b-4de6-b4fb-f5db793fc123.png)

#### A5

![A5](https://user-images.githubusercontent.com/67301601/132985781-57aba285-40fc-4a44-b1d1-878174757066.png)

#### A6

![A6](https://user-images.githubusercontent.com/67301601/132985858-213627e4-37e8-4ccb-9c06-6ae096bae027.png)

#### A7

![A7](https://user-images.githubusercontent.com/67301601/132985897-5f20f38e-a125-4392-9bc4-abb1a5e16aea.png)

#### A8

![A8](https://user-images.githubusercontent.com/67301601/132985905-01f76610-f95c-4b67-b4a4-ad64baaa9504.png)

#### A9

![A9](https://user-images.githubusercontent.com/67301601/132985918-9ef0e24a-3d4a-4ad6-90e4-721d20514087.png)

#### A10

![A10](https://user-images.githubusercontent.com/67301601/132985931-90c6df1a-a6d9-4dc8-a396-a2a6065a3d1f.png)

#### A11

![A11](https://user-images.githubusercontent.com/67301601/132986218-1b2d5046-fdec-4107-a4e5-392d45b07dfe.png)

#### A12

![A12](https://user-images.githubusercontent.com/67301601/132986229-454f8853-cc67-4ed7-8980-6b1a7716d9d7.png)

#### A13

![A13](https://user-images.githubusercontent.com/67301601/132986275-db25d078-e3f2-466a-a78b-a34d86266684.png)

#### A14

![A14](https://user-images.githubusercontent.com/67301601/132986302-eb230b70-c929-4b97-9399-5ad4fe136ea9.png)

#### A15

![A15](https://user-images.githubusercontent.com/67301601/132986307-7e588cdf-af78-44f3-ada8-402c4981fce3.png)

## Multivariate

> check correlation

~~~
cred_num <- select_if(credit_clean, is.numeric)
cor_cred <- cor(cred_num)
cor_cred
library(corrplot)
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(cor_cred, method="color", col=col(200),  
         type="lower", order="original", 
         addCoef.col = "black", # Add coefficient of correlation
         tl.col="black", tl.srt=45) 

~~~


![multivariate](https://user-images.githubusercontent.com/67301601/132986684-3b7ffdbb-1866-4aac-8518-4e052b631643.png)

