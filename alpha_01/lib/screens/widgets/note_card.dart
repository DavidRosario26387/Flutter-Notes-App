import 'package:alpha_01/models/note_model.dart';
import 'package:alpha_01/screens/note_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.note,
      required this.onNoteDeleted,
      required this.index});

  final Note note;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(
                  note: note,
                  index: index,
                  onNoteDeleted: onNoteDeleted,
                )));
      },
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(note.title,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.body,
                style: const TextStyle(
                  fontSize: 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ])),
      ),
    );
  }
}
