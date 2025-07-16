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

## Creating a Fullscreen Modal
![alt text](images/image-49.png)  
![alt text](images/image-50.png)   
![alt text](images/image-51.png)  

## Using the Dismissible Widget for Dismissing List Items
Harcamaları sağa veya sola kaydırarak silebiliyoruz.  
![alt text](images/image-52.png)   
![alt text](images/image-53.png)  
![alt text](images/image-54.png)
![alt text](images/image-55.png)  

## Showing & Managing "Snackbars"
Silinen expense'leri geri alabiliyoruz ve hiç expense eklenmemişse sayfada bir yazı olacak
![alt text](images/image-56.png)  
![alt text](images/image-57.png)
![alt text](images/image-58.png)  

## Getting Started with Theming
![alt text](images/image-59.png)    
![alt text](images/image-60.png)  

## Setting & Using a Color Scheme
![alt text](images/image-61.png)    
![alt text](images/image-62.png)  


## Setting Text Themes
![alt text](images/image-63.png)    
![alt text](images/image-64.png)
![alt text](images/image-65.png)    

## Adding Dark Mode
telefonu dark mode'a aldığımızda hata alıyoruz    
![alt text](images/image-66.png)    
![alt text](images/image-67.png)    
sorunu kart temamı açık temadan koyu temaya kopyalayarak çözeceğim   
![alt text](images/image-68.png)    
![alt text](images/image-69.png)    
diğer stiller artık güzel gözükmüyor bunun nedeni de oluşturduğumuz renk şemasının belirli bir seed color kullanmasıdır
![alt text](images/image-70.png)    
![alt text](images/image-71.png)
![alt text](images/image-72.png)

## Using Another Kind of Loop (for-in)
chart için expense.dart dosyasına yeni bir sınıf ekleyelim    
belirli bir kategorideki tüm harcamaları tek bir liste altında toplayarak o kategorideki toplam tutarı hesaplacağız
![alt text](images/image-73.png)

## Adding Alternative Constructor Functions & Filtering Lists
![alt text](images/image-74.png)

## Adding Chart Widgets
lib -> widgets klasörü içine chart klasörü oluşturdum ve içine 2 dosya ekledim:    
chart.dart
``` dart
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

```  

chart_bar.dart  
```dart
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
          ),
        ),
      ),
    );
  }
}

```

![alt text](images/image-75.png)  
![alt text](images/image-76.png)

## Locking the Device Orientiation
Bu şekilde ayarlandığında telefon yan çevrilse bile arayüz dönmüyor.
![alt text](images/image-77.png)   
![alt text](images/image-78.png)

## Updating the UI based on the Available Space
Ama ben cihazımın yatay modda da çalışmasını istiyorum  
İlk olarak yatay modda bu şekilde gözüküyor  
![alt text](images/image-79.png)   
Liste ve grafik yan yana gelecek şekilde ayarlayalım   
![alt text](images/image-80.png)   
![alt text](images/image-81.png)   
![alt text](images/image-82.png)   

## Understanding Size Constraints

## Handling to Screen Overlays like the Soft Keyboard
![alt text](images/image-83.png)   
![alt text](images/image-84.png)  
kaydırılabilir yapalım     
![alt text](images/image-85.png)   
![alt text](images/image-86.png)  

## Understanding "Safe Areas"
```dart
useSafeArea: true,
```   
satırını eklediğim zaman arayüzü etkileyebilecek kamera gibi özelliklerden arayüzün uzak durmasını sağlar.    
![alt text](images/image-87.png)  