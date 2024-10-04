import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:laboratorio1_inicioflutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working!");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Mine',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 227, 46),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(displayLarge: TextStyle(fontFamily: 'Mine')),
      ),
      home: const MyHomePage(),
    );
  }
}
