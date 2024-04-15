import 'package:alpha_01/models/note_model.dart';
import 'package:alpha_01/screens/create_note.dart';
import 'package:alpha_01/screens/widgets/note_card.dart';
import 'package:alpha_01/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notepad"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
            note: notes[index],
            index: index,
            onNoteDeleted: onNoteDeleted,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateNote(
              onNewNoteCreated: onNoteCreated,
            ),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void onNoteCreated(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void onNoteDeleted(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
}
