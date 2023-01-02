import 'package:flutter/material.dart';

import 'notes_body.dart';

class CustomTextForm extends StatelessWidget {
  
  const CustomTextForm({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          cursorColor: isPrimary,
          decoration: InputDecoration(
            hintText: 'Title',
            hintStyle:const TextStyle(color: isPrimary,fontSize: 12),
              border: buildBorder(),
              focusedBorder: buildBorder(isPrimary),
            ),
            
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder([color]){
     return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        width: 1.0,
        color: color?? Colors.white
      )
     );
  } 
}