import 'package:car_task/screens/home_page.dart';
import 'package:car_task/server/server.dart';
import 'package:car_task/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/model.dart';  


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(useMaterial3: true) ,
      home: Scaffold(
        
        body:HomeScreen()
        
      ),
    );
  }
}