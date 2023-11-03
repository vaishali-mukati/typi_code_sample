import 'package:flutter/material.dart';
import 'package:typi_code_sample2/network/apiservice.dart';
import 'package:typi_code_sample2/ui/home_screen.dart';
import 'package:typi_code_sample2/ui/photos/photos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  @override

  void initState() {
    super.initState();
    ApiService().getPhotos().then((value) {
      print('==========value ${value.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typicode sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const HomeScreen(),
    );
  }
}

