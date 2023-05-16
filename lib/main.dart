import 'package:dropdown/widgets/BankDropdown.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Bank Branch Dropdown")),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: BankDropdown(),
        ),
      ),
    );
  }
}