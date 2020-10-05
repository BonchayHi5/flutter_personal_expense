import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/all_export.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: _transactionsList());
  }

  Widget _transactionsList() {
    return Container(
      height: 400,
      child: widget.transactions.isEmpty
          ? Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      'https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('No transactions added yet! '),
                ],
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: widget.transactions.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(
                      () {
                        widget.transactions.removeAt(index);
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('transactions removed'),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                    ),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kDefaultColor),
                        ),
                        child:
                            Text(widget.transactions[index].amount.toString()),
                      ),
                      title: Text(widget.transactions[index].title),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(widget.transactions[index].date)),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
