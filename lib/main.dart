import 'package:flutter/material.dart';
import 'package:utsav_cloudrevels_prec/view/list_view.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListViewScreen(),
    );
  }
}
