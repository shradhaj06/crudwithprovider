import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'noteModel.dart';
import 'noteProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        home: NoteModel(),
      ),
    ),
  );
}
