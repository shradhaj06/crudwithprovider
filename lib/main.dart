import 'package:flutter/material.dart';
import 'package:poctask/themechangerprovider.dart';
import 'package:provider/provider.dart';
import 'noteModel.dart';
import 'noteProvider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
      ChangeNotifierProvider(create: (context) => NoteProvider(),),
          ChangeNotifierProvider(create: (context)=> ThemeChanger())],
      child: MyApp(),
      ),
    );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.currentTheme,
          title: 'Notes App',
          home: NoteModel(),
        );
      },
    );
  }
}