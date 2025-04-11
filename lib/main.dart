import 'package:flutter/material.dart';
import 'package:spring_edge/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         textTheme: ThemeData.light().textTheme.apply(
      bodyColor: Colors.grey,     
      displayColor: Colors.grey, 
       
      ),
      ),
      home:HomeScreen()
    );
  }
}

