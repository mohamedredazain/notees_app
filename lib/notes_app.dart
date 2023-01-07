// ignore_for_file: prefer_const_constructors, non_constant_identifier_names



import 'package:flutter/material.dart';
import 'package:notees_app/edit_note_view.dart';

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
              return Column(
                children: [
                   AddNoteBottom(context),
                   BottomEditNote()
                ],
              );
            }));
            
          }
          ),child: Icon(Icons.add),
         
        ),
        body: Column(
            children:  [
              CustomAppBar(
                text: 'Notes',
                icon: Icons.search
              ),
              Expanded(child: NotesListView(context)),
            ],
          ),
        ),
      
    );
  }
  NotesListView(context){
    return  GestureDetector(
          onTap: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return EditNoteView();
            }));
          }),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder:((context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: NotesItem(),
            );
        })
         ),
    );
  }
}
