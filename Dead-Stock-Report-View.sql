/*
----------------------------------------------------------------------------------
PROJE: Ölü Stok Raporu (Dead Stock View)

GÖREV:
    Depo maliyetlerini düþürmek için, sisteme kayýtlý olan ama
    TARÝH BOYUNCA HÝÇ SATILMAMIÞ ürünlerin listesi isteniyor.

MANTIK:
    ITEMS tablosunu sol tarafa (LEFT) alýyoruz.
    ORDERDETAILS ile eþleþtiriyoruz.
    Eþleþmeyenleri (IS NULL) filtreleyerek hiç sipariþ verilmemiþleri buluyoruz.
----------------------------------------------------------------------------------
*/

CREATE VIEW VWDEADSTOCK 
AS
SELECT 
I.ITEMCODE AS UrunKodu,
    I.ITEMNAME AS UrunAdi,
    I.BRAND AS Marka,
    I.UNITPRICE AS Fiyat,
    'HÝÇ SATILMADI' AS Durum -- Sabit bilgilendirme kolonu
FROM ITEMS I 
LEFT JOIN ORDERDETAILS OD ON OD.ITEMID=I.ID WHERE OD.ITEMID IS NULL

