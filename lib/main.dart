import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notees_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notees_app/model/note_model.dart';
import 'package:notees_app/notes_body.dart';

import 'notes_app.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(
    NoteModelAdapter()
  );
 await Hive.openBox(jNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) =>AddNoteCubit())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
           darkTheme:ThemeData(brightness: Brightness.dark) ,
        home:const NotesApp() ,
      ),
    );
  }}