import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';


class NewExpense extends StatefulWidget{
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleContoller = TextEditingController(); // Bu controller, TextField'ın içeriğini takip eder
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  
  // Data picker
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: now,
      firstDate: firstDate, 
      lastDate: now
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // kaydet butonuna basıldığında çalışacak fonksiyon
  void _submitExpenseData() {
    // Eğer kullanıcı sayı yerine harf gibi geçersiz bir şey yazdıysa null döner.
    final enteredAmount = double.tryParse(_amountController
      .text);
    // enteredAmount boşsa (sayı değilse) veya 0'dan küçükse bu değer geçersiz sayılır.
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if(_titleContoller.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
      showDialog(
          context: context, 
          builder: (ctx) => AlertDialog(
            title: const Text('Invalid Input'),
            content: const Text(
              'Please make sure a valid title, amount, data and category was entered.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                }, 
                child: const Text('Okay'),
              ),
            ],
          ),
        );
        return;
    }
    widget.onAddExpense(
      Expense(
        title: _titleContoller.text, 
        amount: enteredAmount, 
        date: _selectedDate!, 
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  //  Controller’ı temizlemek için dispose()
  @override
  void dispose() {
    _titleContoller.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constrains) {
      final width = constrains.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if(width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleContoller,
                          maxLength: 50, // Kullanıcıdan maksimum 50 karakterlik bir başlık (title) girmesi isteniyor.
                          decoration: InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),

                    ],
                  )
                else
                  TextField(
                    controller: _titleContoller,
                    maxLength: 50, // Kullanıcıdan maksimum 50 karakterlik bir başlık (title) girmesi isteniyor.
                    decoration: InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child:TextField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixText: '\$ ',
                          label: Text('Amount'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate == null ?'No date selected': formatter.format(_selectedDate!),),
                          IconButton(
                            onPressed: _presentDatePicker, 
                            icon: const Icon(
                              Icons.calendar_month,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    DropdownButton(
                        value: _selectedCategory, // şu an seçili olan değer
                        // dropdown’da görüntülenecek seçeneklerin listesini tanımlar.
                        items: Category.values // enum’daki tüm değerleri döndürür
                            // .map(...): Her bir enum değeri için bir DropdownMenuItem oluşturur
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(), 
                        // Kullanıcı dropdown’dan farklı bir seçenek seçtiğinde çalışır.
                        onChanged: (value) {
                          if(value == null){
                              return;
                          }
                          setState(() {
                            _selectedCategory = value; //_selectedCategory güncellenir.
                          });
                        },
                    ),
                    const Spacer(),
                    TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  // Bu butona tıklanınca konsola kullanıcıdan alınan başlık yazdırılır.
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: Text('Save Expense'))
                ],)
          
              ],
          )
              ),
        ),
      );

    });
      
  }
}