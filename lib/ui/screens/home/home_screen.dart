import 'package:flutter/material.dart';
import 'package:personal_expenses_app/ui/screens/home/components/body.dart';
import 'package:personal_expenses_app/all_export.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final List<Transaction> transactions = [];

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Body(transactions),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return NewTransaction(_addTransactions);
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
