import 'package:flutter/material.dart';
import 'package:typi_code_sample2/network/apiservice.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const Text('Flutter app'),
    );
  }
}

