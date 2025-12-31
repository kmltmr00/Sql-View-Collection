# Sql-View-Collection
Bu klasör, gerçek bir **E-Ticaret Veritabanı** senaryosu üzerinde kurgulanmış; raporlama, veri güvenliği (KVKK), müşteri analitiği ve stok yönetimi gibi iş problemlerini çözen **SQL View** çalışmalarını içerir.

## 🎯 Amaç
Karmaşık `JOIN` sorgularını, koşullu mantık yapılarını ve güvenlik filtrelerini soyutlayarak (abstraction), son kullanıcıya veya uygulamaya hazır, performanslı veri setleri sunmak.

## 🛠️ Kullanılan Teknikler
* **Data Masking (KVKK):** String manipülasyonu (`LEFT`, `SUBSTRING`, `CHARINDEX`) ile hassas veri gizleme.
* **Conditional Logic:** `CASE WHEN` yapısı ile dinamik müşteri segmentasyonu.
* **Localization:** `FORMAT` fonksiyonu ile Türkçe tarih/zaman formatlama.
* **Join Types:** Özellikle `LEFT JOIN` ve `IS NULL` mantığı (Anti-Join) ile veri tutarlılık analizleri.

## 📂 Proje Dosyaları ve Senaryolar

| Dosya | Senaryo (Business Case) | Öne Çıkan Teknikler |
| :--- | :--- | :--- |
| `MonthlySales.sql` | **Bölgesel Satış Analizi:** Şehir ve Ay kırılımında ciro takibi. Türkçe ay isimleri ve kronolojik sıralama çözümü. | `FORMAT (tr-TR)`, `DATENAME`, `Sorting Logic` |
| `CustomerSegmentation.sql` | **Müşteri Segmentasyonu (CRM):** Harcama limitlerine göre müşterilerin "VIP", "Sadık" veya "Standart" olarak etiketlenmesi. | **`CASE WHEN`**, `Boundary Analysis` |
| `DeadStock.sql` | **Ölü Stok Raporu:** Depoda duran ama tarih boyunca hiç sipariş edilmemiş ürünlerin tespiti. | **`LEFT JOIN`**, **`IS NULL`** (Anti-Join) |
| `KVKK_SafeList.sql` | **KVKK Uyumlu Müşteri Listesi:** Çağrı merkezi için telefon ve email bilgilerinin maskelenmesi. | `String Functions`, `Dynamic Masking Logic` |
