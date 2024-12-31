import 'package:flutter/material.dart';
import 'package:login_page/screens/login_screen.dart'; // Import the LoginScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(), // Sets the LoginScreen as the first screen
    );
  }
}
