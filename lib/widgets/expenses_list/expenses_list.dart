import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key, 
    required this.expenses,
  });

  final List<Expense> expenses; // Bu liste, Expense nesnelerinden oluşur.

  @override
  Widget build(BuildContext context){
    // return Column(); --> birbirinin üzerinde görüntülenmesi gereken birden fazla öge olduğunda kullanılır
    // ancak gider listesinde olduğu gibi oldukça uzun olabilecek belirsiz uzunlukta listeler varsa Column Widget kullanılmaz
    // ListView.builder, uzun ve kaydırılabilir listeler için en uygun çözümdür.
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}