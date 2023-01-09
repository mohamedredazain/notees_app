
import 'package:flutter/material.dart';

import 'custom_text_form.dart';
import 'notes_body.dart';

class AddNoteForm extends StatefulWidget {
  @override
  State<AddNoteForm> createState() => AddNoteFormState();
}

class AddNoteFormState extends State<AddNoteForm> {
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
