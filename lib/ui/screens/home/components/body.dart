import 'package:flutter/material.dart';
import 'package:personal_expenses_app/all_export.dart';

class Body extends StatelessWidget {
  final List<Transaction> transaction;
  Body(this.transaction);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: kDefaultColor,
                child: Text('Chart'),
              ),
            ),
            TransactionList(transaction),
          ],
        ),
      ),
    );
  }
}
