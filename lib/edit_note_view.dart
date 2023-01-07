// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notees_app/custom_text_form.dart';

import 'notes_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(text: ' Edit Note', icon: Icons.check),
            CustomTextForm
            (hint: 'Titel'
            ),
              CustomTextForm
            (hint: 'Content',
            maxLines: 5,
            ),
            BottomEditNote(),
          ],
        ),
      ),
    );
  }
}
