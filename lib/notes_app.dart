// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable



import 'package:flutter/material.dart';
import 'package:notees_app/edit_note_view.dart';

import 'custom_text_form.dart';
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
                   _AddNoteForm(),
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

class _AddNoteForm extends StatefulWidget {
  @override
  State<_AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<_AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

 AutovalidateMode _autovalidateMode =AutovalidateMode.disabled;

 String? title , subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.only(top:26,left: 16,right: 16 ),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          children: [
            CustomTextForm(
              onSaved: (value) {
                title =value;
              },
              hint: 'Title',
            ),
            SizedBox(height:16),
            CustomTextForm(
              onSaved: (value){
                subtitle =value;
              },
              hint: 'Content',
              maxLines: 4,
            ),
            SizedBox(height: 20,),
            CustomButton(
         onTap: (() {
            if(_formKey.currentState!.validate()){
              _formKey.currentState!.save();
            }else{
              _autovalidateMode =AutovalidateMode.always;
              setState(() {
                
              });
            }
         })
         ),
        const SizedBox(height: 0,)
          ],
        ),
      ),
    );
  }
}
