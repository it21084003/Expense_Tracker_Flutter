import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        //can delete with swipe
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context)
              .colorScheme
              .error
              .withOpacity(0.75), //when swipe background color
          margin: EdgeInsets.symmetric(
              // vertical: Theme.of(context).cardTheme.margin!.vertical,
              horizontal: Theme.of(context)
                  .cardTheme
                  .margin!
                  .horizontal), //background color margin ga nay start show
        ),

        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
