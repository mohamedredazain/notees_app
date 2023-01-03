// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
