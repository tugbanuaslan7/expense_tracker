# EXPENSE TRACKER

## Starting
Başlangıç olarak, main.dart dosyasında MaterialApp ile uygulamanın başlangıç noktası tanımlandı ve Expenses adlı bir StatefulWidget ana sayfa olarak ayarlandı. Expenses sayfasında şimdilik yalnızca iki metin (The chart, Expenses list...) gösterilerek grafik ve harcama listesinin yer alacağı alanlar belirtildi. 

![alt text](images/image-1.png) 
![alt text](images/image-2.png)   
![alt text](images/image-3.png) 

## Adding an Expense Data Model with a Unique ID & Exploring Initializer Lists
Expense sınıfı oluşturuldu.
- id: Benzersiz kimliği
- title: Başlığı (örneğin "Market alışverişi")
- amount: Harcanan tutar
- date: Harcama tarihi

Bu sınıf, kullanıcıların yaptığı harcamaları başlık, miktar ve tarih bilgileriyle temsil eder. Her harcama için otomatik olarak benzersiz bir kimlik (id) oluşturulur. Bu yapı, gider listesinin yönetilmesi ve her giderin kolayca takip edilebilmesi için temel sağlar.

![alt text](images/image-4.png) 


## Intoducing Enums

Expense nesnelerine de ait olması gereken bir bilgi eksiktir ve bu da bir giderin ait olduğu kategoridir. Bu nedenle
Expense sınıfında kategori bilgilerini de saklamak istiyoruz.

Neden String türünde değil de enum şeklinde sakladık? 

Expense nesnelerinde kategori bilgisini saklamak için String yerine enum (enumeration) yapısını kullanmak, yazılım açısından daha güvenli ve doğru bir yaklaşımdır. Çünkü enum, sadece önceden tanımlanmış sabit değerleri alabilir ve bu da yazım hatalarını önler. Örneğin Category.food gibi bir kullanımda hem yanlış yazım riski ortadan kalkar hem de uygulama daha tutarlı hale gelir.

String türü kullanılsaydı, "food", "Food" veya "FOOD" gibi farklı yazımlar hataya neden olabilirdi. 

![alt text](images/image-5.png) 

## Creating Dummy Data
Çıktı görebilmek için birkaç dummy data eklendi.

![alt text](images/image-6.png) 

## Efficiently Rendering Long Lists with ListView
ExpensesList widget’ının amacı, dışarıdan aldığı gider listesini (List<Expense>) ekranda kaydırılabilir şekilde listelemek ve her gideri kullanıcıya görsel olarak sunmaktır.
Column gibi sabit bir yapı yerine, dinamik ve performanslı bir yapı olan ListView.builder kullanılır.

![alt text](images/image-7.png) 

## Using Lists Inside of Lists

![alt text](images/image-8.png) 
![alt text](images/image-9.png)   
![alt text](images/image-10.png) 

## Creatin a Custom List Item with the Card & Spacer Widgets
Yalnızca giderlerin başlıkların çıktısını alıyoruz, bunun yerine ilgili tüm gider bilgilerin çıktısını almak istiyoruz.

ExpenseItem widget’ı, tek bir gider bilgisini kart yapısıyla kullanıcıya sunmak amacıyla tasarlanmıştır. Bu widget, başlık, tutar ve tarih gibi bilgileri düzenli şekilde göstererek gider listesinin okunabilirliğini artırır.

![alt text](images/image-11.png)   
![alt text](images/image-12.png) 

## Using Icons & Formatting Dates
Expense nesnesinin DateTime türündeki date özelliğini okunabilir kıllalım

```
DateTime.now().toString() 
```
gibi doğrudan yazdırırsan şu tarz bir çıktı verir: "2025-07-11 15:43:12.134979"

``` intl ``` paketindeki ```DateFormat.yMd()``` ile bu tarihin çıktısı: "7/11/2025" gibi sade ve daha kolay anlaşılabilir olur

![alt text](images/image-13.png)   
![alt text](images/image-14.png)  
![alt text](images/image-15.png)


## Setting an AppBar with a Title & Actions

App bar ekleyelim
![alt text](images/image-16.png)  
![alt text](images/image-17.png)

## Adding a Modal Sheet & Understanding Context

'+' butonunu aktifleştirelim

![alt text](images/image-18.png)  
![alt text](images/image-19.png)
![alt text](images/image-20.png)

## Handling User (Text) Input with the TextField Widget 
Alt sayfada gösterilmesi gereken gerçek widget'ı ekleyelim

NewExpense widget'ı kullanıcıdan yeni bir expense girişi almak için bir form alanı oluşturur. Şu anda yalnızca harcama başlığını yazmak için bir TextField içeriyor.

![alt text](images/image-21.png)  
![alt text](images/image-22.png)

## Getting User Input on Every Keystroke
![alt text](images/image-23.png)  
![alt text](images/image-24.png)
![alt text](images/image-25.png)

## Letting Flutter do the Work with TextEditingController
aynı işlevi dshs profösyonel haliyle yapalım  
![alt text](images/image-26.png)

## Adding a New Input
Amount alanı ekleyelim   
![alt text](images/image-27.png)  
![alt text](images/image-28.png)

## Closing The Modal Manually
Cancel butonunu aktifleştirelim  
![alt text](images/image-29.png)

## Showing a Date Picker
Tarih girişi yapabilmek için alan eklendi   
![alt text](images/image-30.png)
![alt text](images/image-31.png)   
![alt text](images/image-32.png)
![alt text](images/image-33.png)

## Working with "Futures" for Handling Data from the Future
Seçilen tarihi nasıl saklayabiliriz?   

![alt text](images/image-34.png)
![alt text](images/image-35.png)   
![alt text](images/image-36.png)
![alt text](images/image-37.png)
![alt text](images/image-38.png)


## Adding a Dropdown Button
Kategori için açılır menü ekleyelim  
![alt text](images/image-39.png)     
![alt text](images/image-40.png)
![alt text](images/image-41.png)

## Combining Conditions with AND and OR Operators
“Save Expense” butonuna basıldığında girilen veri geçerli mi değil mi kontrol edelim.   
![alt text](images/image-42.png)

## Validating User Input & Showing an Error Dialog
Kullanıcı hatalı bilgi girdiğinde (örneğin boş başlık, negatif tutar veya tarih seçilmemişse), uygulama uyarı penceresi (popup) göstersin.

![alt text](images/image-43.png)  
![alt text](images/image-44.png)

## Saving New Expenses

![alt text](images/image-45.png)
![alt text](images/image-46.png)  
![alt text](images/image-47.png)   
![alt text](images/image-48.png)  