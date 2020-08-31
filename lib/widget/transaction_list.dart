import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/constants/constants.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;
  TransactionList(this.transactions);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: _transactionsList());
  }

  Widget _transactionsList() {
    return Container(
      height: 400,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultRadius),
            ),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kDefaultColor),
                ),
                child: Text(transactions[index].amount.toString()),
              ),
              title: Text(transactions[index].title),
              subtitle:
                  Text(DateFormat.yMMMd().format(transactions[index].date)),
            ),
          );
        },
      ),
    );
  }
}
