/*SENARYO:
    Yönetim kurulu, Türkiye genelindeki maðazalarýn performansýný "Þehir" ve "Ay" 
    bazýnda incelemek istiyor. Ancak veritabanýndaki ham verilerde:
    1. Aylar tarih formatýnda (2023-01-15 gibi) duruyor.
    2. Yönetim, raporu "Ocak, Þubat" þeklinde Türkçe isimlerle istiyor.
    3. Alfabetik sýralama sorunu var (Nisan'ýn Ocak'tan önce gelmesi gibi).*/

    CREATE VIEW VWMONTHLYSALES
    AS
    SELECT
    CT.CITY AS SEHIR,
    DATENAME(MONTH,OD.DATE_) AS AY,
    MONTH(OD.DATE_) AS AYNO,
    SUM(OD.TOTALPRICE) AS TOPLAMSATIS
    FROM ORDERS OD 
    JOIN ADDRESS A ON A.ID=OD.ADDRESSID
    JOIN CITIES CT ON CT.ID=A.CITYID
    GROUP BY CT.CITY,DATENAME(MONTH,DATE_),MONTH(OD.DATE_)
    
    SET LANGUAGE turkish 
    select 
    SEHIR,AY,TOPLAMSATIS
    from VWMONTHLYSALES
    ORDER BY 1,AYNO