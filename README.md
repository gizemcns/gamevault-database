## 🎮 GameVault Veritabanı Projesi

- Bu proje, Steam / Epic Games benzeri dijital bir oyun dağıtım platformu için tasarlanmış ilişkisel bir veritabanını kapsamaktadır.
Projenin amacı; geliştirici firmalar, oyunlar ve oyun türleri arasındaki ilişkileri doğru şekilde modellemek ve SQL sorguları ile yönetmektir.

## 📌 Proje Kapsamı

- Veritabanı aşağıdaki varlıkları içermektedir:

- Developers: Oyun geliştirici firmalar

- Games: Platformda yer alan oyunlar

- Genres: Oyun türleri

- Games_Genres: Oyunlar ile türler arasındaki Many-to-Many ilişkiyi yöneten ara tablo

## 🧱 Veritabanı Tasarımı

- Veritabanı tasarımı aşağıdaki ilişkilere göre oluşturulmuştur:

- Developers → Games : One-to-Many (1 geliştirici, birçok oyun)

Games ↔ Genres : Many-to-Many (bir oyun birden fazla türe sahip olabilir)

Many-to-Many ilişki, games_genres ara tablosu ile çözülmüştür.

Tüm tablolar Primary Key ve Foreign Key kısıtları kullanılarak ilişkilendirilmiştir.
Silme işlemlerinde veri bütünlüğünü korumak için ON DELETE CASCADE yapısı uygulanmıştır.


## 🛠️ Kullanılan Teknolojiler

- PostgreSQL

- DBeaver (veritabanı yönetimi)

- DrawSQL (ER diyagramı tasarımı)
 
- Git & GitHub (versiyon kontrolü)

## 📂 Proje Dosya Yapısı


 gamevault-database
 /
 │
 ├─ gamevault.sql
 ├─ diagram.png
 └─ README.md


- gamevault.sql :

Tablo oluşturma (DDL)

Veri ekleme (DML)

Güncelleme & silme işlemleri

Raporlama sorguları

- drawsql_pic.png : 

DrawSQL üzerinde oluşturulan ER diyagramı

## ⚙️ Gerçekleştirilen İşlemler

1️⃣ Tablo Oluşturma (DDL)

Developers

Games

Genres

Games_Genres

2️⃣ Veri Ekleme (DML)

10 geliştirici firma

10 oyun türü

10 oyun

Oyun–Tür eşleştirmeleri

3️⃣ Güncelleme ve Silme

Tüm oyunlara %10 indirim uygulanması

Bir oyunun puanının güncellenmesi

Bir oyunun sistemden silinmesi

4️⃣ Raporlama (SELECT & JOIN)

Oyun–Geliştirici listesi

Sadece RPG türündeki oyunlar

500 TL üzeri oyunlar

İsmi içinde “War” geçen oyunlar


## 🎯 Öğrenilen Kazanımlar

-Bu proje sayesinde:

İlişkisel veritabanı tasarımı

One-to-Many ve Many-to-Many ilişkiler

Foreign Key ve CASCADE kullanımı

SQL DDL ve DML komutları

JOIN ile raporlama sorguları

Gerçek hayata uygun veri modeli oluşturma

konularında pratik yapılmıştır.

## ✅ Sonuç

- Bu proje, temel ve orta seviye SQL bilgilerini bir araya getirerek gerçekçi bir veritabanı senaryosu sunmaktadır.
Akademik gereksinimlere uygun şekilde hazırlanmış olup, çalıştırıldığında hatasız sonuç üretmektedir.
