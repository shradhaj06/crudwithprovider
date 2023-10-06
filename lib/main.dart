import 'package:flutter/material.dart';
import 'package:poctask/providers/themechangerprovider.dart';

import 'package:provider/provider.dart';
import 'noteModel.dart';
import 'providers/noteProvider.dart';

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
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          title: 'Notes App',
          home: NoteModel(),
        );
      },
    );
  }
}