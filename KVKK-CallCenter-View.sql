/*
----------------------------------------------------------------------------------
PROJE: KVKK Uyumlu Çaðrý Merkezi Listesi (Safe Customer View)

GÖREV:
    Çaðrý merkezi çalýþanlarý için müþteri listesi oluþturulacak.
    Ancak KVKK gereði kiþisel veriler (Telefon ve Email) maskelenmeli.
    
    1. Ýsim Soyisim: Açýk
    2. Telefon: Ýlk 5 ve son 2 hane açýk (0532*****99)
    3. Email: Ýlk 3 hane ve '@' sonrasý açýk (ali****@gmail.com)
----------------------------------------------------------------------------------
*/
CREATE VIEW VWDDMRESULT AS
SELECT 
NAMESURNAME AS MUSTERIADI,
LEFT(TELNR1,5)+'*****'+RIGHT(TELNR1,2)AS DDMTELNR1,
LEFT(TELNR2,5)+'*****'+RIGHT(TELNR2,2)AS DDMTELNR2,
LEFT(EMAIL,4)+'******'+SUBSTRING(EMAIL,CHARINDEX('@',EMAIL,1))AS DDMEMAIL
FROM USERS


SELECT*FROM VWDDMRESULT
