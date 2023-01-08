import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notees_app/notes_body.dart';

import 'notes_app.dart';

void main() async{
  await Hive.initFlutter();

 await Hive.openBox(jNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         darkTheme:ThemeData(brightness: Brightness.dark) ,
      home:const NotesApp() ,
    );
  }}