import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notees_app/model/note_model.dart';
import 'package:notees_app/notes_body.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note)async{

    emit(AddNoteLoading());
  try{
    var  notesBox =  Hive.box(jNotesBox);
    emit(AddNoteSuccess());
   await notesBox.add(note);
  }catch(e){
    AddNoteFailure(e.toString());
  }
  }
}
