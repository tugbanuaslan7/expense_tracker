import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expenses> {
  // _registeredExpenses listesi ile bazı örnek harcamalar tutuluyor
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course', 
      amount: 19.99, 
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema', 
      amount: 15.69, 
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  // Yeni gider ekleme formunu (modal ekran) açar.
  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense); // geri alırsak aynı sıraya koymak istiyoruz bu yüzde kaydedildi
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); // Kullanıcı aynı anda birkaç gider silerse, Önceki silme işlemlerine ait eski "Undo" butonları çakışmaz
    // SnackBar, kullanıcının silme işlemini fark etmesini ve geri alabilmesini sağlar.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'), // expense yoksa ekranın ortasında bu yazu gösterilir
    );

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add)
          ),
        ],
      ),
      
      body: width < 600 
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                 Expanded(
                  child: mainContent,
                ),
              ],
          )
        : Row(children: [
            Expanded(
              child: Chart(expenses: _registeredExpenses),
            ),
                 Expanded(
                  child: mainContent,
                ),
              ],),
    );
  }
}