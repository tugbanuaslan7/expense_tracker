import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key, 
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses; // Bu liste, Expense nesnelerinden oluşur.
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context){
    // return Column(); --> birbirinin üzerinde görüntülenmesi gereken birden fazla öge olduğunda kullanılır
    // ancak gider listesinde olduğu gibi oldukça uzun olabilecek belirsiz uzunlukta listeler varsa Column Widget kullanılmaz
    // ListView.builder, uzun ve kaydırılabilir listeler için en uygun çözümdür.
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75), 
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}