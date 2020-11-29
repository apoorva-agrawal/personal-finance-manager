import 'package:flutter/material.dart';

class DebtPage extends StatefulWidget {
  @override
  _DebtPageState createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Navigation Bar Working'),
        ),
      ),
    );
  }
}
