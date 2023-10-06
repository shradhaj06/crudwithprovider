import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../note.dart';
import '../providers/noteProvider.dart';


class AddNoteScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title',fillColor:Colors.pink,border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
                )
                ),
              ),
            ),
            SizedBox(height: 60),
            TextField(
              style: TextStyle(
                fontSize: 17,
                letterSpacing:0.85,
              ),
              controller: _contentController,
              maxLines:null,
              decoration: InputDecoration(labelText: 'Content',
             //contentPadding: EdgeInsets.only(left:10,top: 60,bottom: 60),


              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),

            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ButtonStyle(

              ),

              onPressed: () {
                final title = _titleController.text;
                final content = _contentController.text;
                if (title.isNotEmpty && content.isNotEmpty) {
                  final note = Note(title: title, content: content);
                  Provider.of<NoteProvider>(context, listen: false).addNote(note);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
