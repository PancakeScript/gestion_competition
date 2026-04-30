import 'package:flutter/material.dart';
import 'package:gestion_competition/api.dart';
import 'package:gestion_competition/pages/equipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String result = 'initial';
  // Nouvelle nouvelle = Nouvelle();
  //
  // int index = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: EquipePage(),
    );
  }
}
