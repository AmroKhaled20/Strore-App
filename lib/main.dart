import 'package:ak_store_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const StroreApp());
}

class StroreApp extends StatelessWidget {
  const StroreApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.id: (context) => HomeScreen()},
      initialRoute: 'Home Screen',
    );
  }
}
