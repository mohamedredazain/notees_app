// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'notes_body.dart';

class CustomTextForm extends StatelessWidget {
  
  const CustomTextForm({
    Key? key,
    required this.hint, this.maxLines,
  }) : super(key: key);
   final String hint;
     final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 16,left: 16,right: 16),
      child: Column(
        children: [
          TextFormField(
            maxLines: maxLines,
            cursorColor: isPrimary,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:const TextStyle(color: isPrimary,fontSize: 12),
                border: buildBorder(),
                focusedBorder: buildBorder(isPrimary),
              ),
              
          ),
        ],
      ),
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
