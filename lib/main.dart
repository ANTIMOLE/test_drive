import 'package:flutter/material.dart';
import 'package:test_drive/pages/home.dart';

void main() {
  //main entry point
  runApp(const MyApp()); 
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //const sebelum material dipake biar yg biru ilang
      //const dipake karena tidak berubah nilainya sehingga compiler tau nilai yang akan dipakai sebelumnya
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),//biar font dipake di semua
      home:  HomePage()
    );
  }
}

