import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.all(16), // Her yönden 16 piksel boşluk bırak
        child: Column(
          children: [
            TextField(
              maxLength: 50, // Kullanıcıdan maksimum 50 karakterlik bir başlık (title) girmesi isteniyor.
              decoration: InputDecoration(
                label: Text('Title'),
              ),
            ),

          ],
      )
    );
  }
}