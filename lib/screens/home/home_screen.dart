import 'package:flutter/material.dart';
import 'package:personal_expenses_app/screens/home/components/body.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Body(),
    );
  }
}
