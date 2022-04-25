import '../screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey)),
    ),
  );
}
