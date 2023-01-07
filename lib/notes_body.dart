// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'custom_text_form.dart';

CustomAppBar({
  required final IconData? icon,
 required final String? text,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Text(text!),
        Spacer(),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white.withOpacity(0.1)),
          child: Center(child: Icon(icon)),
        ),
      ],
    ),
  );
}

NotesItem() {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        ListTile(
          title: Text(
            'Flutter Tips',
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 16, bottom: 15),
            child: Text(
              'Flutter build your create Mohamed Zain ',
              style:
                  TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
            ),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                size: 30,
                color: Colors.black,
              )),
        ),
        ListTile(
          trailing: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              '1/2/2023',
              style:
                  TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 12),
            ),
          ),
        )
      ],
    ),
  );
}

BottomEditNote(){
  return ElevatedButton(
    onPressed: (){},
    child: Text('Edit',style: TextStyle(),));
  
}
AddNoteBottom(BuildContext context) {
  return Column(
    children: const [
      SizedBox(
        height: 30,
      ),
      CustomTextForm(
        hint: 'Title',
      ),
      CustomTextForm(
        hint: 'Content',
        maxLines: 5,
      ),
    
    ],
  );
}

const isPrimary = Colors.teal;
