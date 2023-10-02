import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addnotescreen.dart';
import 'editnotescreen.dart';

import 'note.dart';
import 'noteProvider.dart';

class NoteModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App',style: TextStyle(
          fontSize: 15,
        ),),
      ),
      body: ListView.builder(
        itemCount: noteProvider.notes.length,
        itemBuilder: (context, index) {
          final note = noteProvider.notes[index];

          return Dismissible(
          key: Key(note.id),
    onDismissed: (_) {
    noteProvider.deleteNote(note.id);
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    content: Text('Note deleted'),
    action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
    // If you want to implement undo functionality
    // This is optional
    noteProvider.addNote(note);
    },
    ),
    ),
    );
    },
    background: Container(
    color: Colors.red,
    child: Align(
    alignment: Alignment.centerLeft,
    child: Padding(
    padding: EdgeInsets.all(16),
    child: Icon(
    Icons.delete,
    color: Colors.white,
    ),
    ),
    ),
    ),
    child: Container(
      height: 300,
      child: Card(
        elevation: 5,
        shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),


        ),

        shadowColor: Colors.pink,
        borderOnForeground: true,
        margin: EdgeInsets.all(15),
        
        child: ListTile(
          contentPadding: EdgeInsets.all(12),
        title: Text(note.title,
        style: const TextStyle(

color: Colors.pinkAccent,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 25,
        )),

        subtitle: Column(
          children: [
            SizedBox(height:18),
            Text(note.content, style:TextStyle(
                fontFamily: 'CormorantGaramond',

                fontSize: 15,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,),),
          ],
        ),
        isThreeLine:false,
        trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        IconButton(
        icon: Icon(Icons.edit, color:Colors.blueAccent),
        onPressed: () {
        Navigator.of(context).push(
        MaterialPageRoute(
        builder: (ctx) => EditNoteScreen(note: note),
        ),
        );
        },
        ),
        IconButton(
        icon: Icon(Icons.delete,
        color: Colors.red,),
        onPressed: () {
        showDialog(
        context: context,
        builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey,
        title: Text('Delete Note'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
        content: Text('Are you sure you want to delete this note?'),
        actions: <Widget>[
        TextButton(
        child: Text('Cancel',style: TextStyle(
          color: Colors.black38,
        ),),
        onPressed: () {
        Navigator.of(context).pop();
        },
        ),
        TextButton(
        child: Text('Delete',style: TextStyle(
          color: Colors.black38,),),
        onPressed: () {
        noteProvider.deleteNote(note.id);
        Navigator.of(context).pop();
              },
              ),
              ],
              );
              },
              );
              },
              ),
              ],
              ),
              ),
      ),
    ));
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
        },
        child: Icon(Icons.add,color: Colors.greenAccent,
        ),
      ),
    );
  }
}
