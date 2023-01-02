// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'notes_body.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context, 
            builder: ((context) {
              return AddNoteBottom(context);
            }));
          }
          ),child: Icon(Icons.add),
        ),
        body: Column(
          children:  [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children:  [
                  Text('Notas'),
                 Spacer(),
                 IconSearch()  
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }

  NotesListView(){
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder:((context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: NotesItem(),
          );
      })
       );
  }
}