// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notees_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notees_app/edit_note_view.dart';
import 'add_note_form.dart';
import 'notes_body.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
   bool isLoading =false;
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
                      BlocConsumer<AddNoteCubit,AddNoteState>(
                        listener: (context, state) {
                          if(state is AddNoteFailure){
                           print('Failied ${state.errorMessage}');
                          }if(state is AddNoteSuccess){
                            Navigator.pop(context);
                          }
                         },
                        builder: (context, state) {
                          return ModalProgressHUD(
                            inAsyncCall:state is AddNoteLoading ? true : false,
                            child: AddNoteForm());
                        },
                      ),
                    ],
                  );
                }));
          }),
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            CustomAppBar(text: 'Notes', icon: Icons.search),
            Expanded(child: NotesListView(context)),
          ],
        ),
      ),
    );
  }

  NotesListView(context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView();
        }));
      }),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: NotesItem(),
            );
          })),
    );
  }
}
