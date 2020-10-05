import 'package:flutter/material.dart';
import 'package:personal_expenses_app/all_export.dart';
import 'reuse_widget/reuse_textfield.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  final _key = GlobalKey<FormState>();

  String _amount, _title;

  void _addTransaction() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      addTransaction(_title, double.parse(_amount));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              ReuseTextField(
                labelText: 'Title',
                onSaved: (newValue) => _title = newValue,
                validator: (value) => value.isEmpty ? 'Title is Empty' : null,
              ),
              SizedBox(
                height: 10,
              ),
              ReuseTextField(
                labelText: 'Amount',
                onSaved: (newValue) => _amount = newValue,
                validator: (value) => value.isEmpty ? 'Amount is Empty' : null,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    _addTransaction();
                  },
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: kDefaultBtnColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
