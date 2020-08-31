import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widget/new_transaction.dart';
import 'package:personal_expenses_app/widget/transaction_list.dart';
import 'package:personal_expenses_app/constants/constants.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Transaction> transactions = [
    Transaction(
      id: '01',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '01',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];

  void _addTransactions(String _title, double _amount) {
    final _newTransactions = Transaction(
      title: _title,
      amount: _amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      transactions.add(_newTransactions);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: kDefaultColor,
                child: Text('Chart'),
              ),
            ),
            NewTransaction(_addTransactions),
            TransactionList(transactions),
          ],
        ),
      ),
    );
  }
}
