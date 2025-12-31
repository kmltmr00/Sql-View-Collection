/*
----------------------------------------------------------------------------------
PROJE: Müþteri Segmentasyonu ve Analizi (CRM - Customer Segmentation)


SENARYO:
    Pazarlama departmaný, müþteri sadakatini artýrmak ve doðru kitleye doðru
    kampanyayý çýkmak için müþterileri sýnýflara ayýrmak istiyor.
    
    Patronun Ýstediði Kurallar:
    1. Toplam Harcama 5.000 TL ve üzeriyse      -> 'VIP MÜÞTERÝ'
    2. Toplam Harcama 2.000 TL ile 5.000 TL arasý -> 'SADIK MÜÞTERÝ'
    3. Toplam Harcama 2.000 TL altýndaysa       -> 'STANDART MÜÞTERÝ'

GÖREV:
    vw_CustomerSegmentation adýnda bir View oluþtur.
    Müþterinin Adýný, Þehrini, Toplam Harcamasýný ve SEGMENT adýný getir.

TEKNÝKLER:
    - Conditional Logic (CASE WHEN ... END)
    - Aggregation (SUM, GROUP BY)
    - Multi-Table Joins (Users-Address-Cities-Orders)
----------------------------------------------------------------------------------
*/

CREATE VIEW VWUSERSSEGMENT AS
SELECT
U.NAMESURNAME AS MUSTERI_ADI,
SUM(O.TOTALPRICE) AS TOPLAMSATIS,
CASE 
WHEN SUM(O.TOTALPRICE)>=10000 THEN 'VÝP MÜÞTERÝ'
WHEN SUM(O.TOTALPRICE)<10000 AND SUM(O.TOTALPRICE)>5000 THEN 'SADIK MÜÞTERÝ'
WHEN SUM(O.TOTALPRICE)<5000 THEN  'STANDART MÜÞTERÝ'
END AS SEGMENT
FROM USERS U 
JOIN ADDRESS A ON A.USERID=U.ID
JOIN CITIES CT ON CT.ID=A.CITYID
JOIN ORDERS O ON O.USERID=U.ID
GROUP BY U.NAMESURNAME
