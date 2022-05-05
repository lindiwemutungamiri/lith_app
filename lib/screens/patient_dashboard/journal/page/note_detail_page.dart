import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:lith_app/screens/patient_dashboard/journal/db/notes_database.dart';
import 'package:lith_app/screens/patient_dashboard/journal/model/note.dart';
import 'package:lith_app/screens/patient_dashboard/journal/page/edit_note_page.dart';
import 'package:lith_app/screens/patient_dashboard/journal/page/notes_page.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset("assets/images/readingPic.png",
                        height: 200, width: 300),
                    Text(
                      note.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(note.createdTime),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 200,
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.cyan,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                          child: Text(
                        note.description,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
        floatingActionButton: SpeedDial(
            icon: Icons.arrow_upward_outlined,
            label: const Text('Actions'),
            backgroundColor: Colors.black,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.edit),
                label: 'Edit',
                backgroundColor: Colors.cyan,
                onTap: () {
                  _edit(context);
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.delete),
                label: 'Delete',
                backgroundColor: Colors.cyan,
                onTap: () {
                  _delete(context);
                },
              ),
            ]),
      );

  void _edit(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to edit this journal?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    if (isLoading) return;

                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddEditNotePage(note: note),
                    ));
                    Navigator.of(context).pop();

                    refreshNote();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove this journal?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    await NotesDatabase.instance.delete(widget.noteId);

                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NotesPage()),
                    );
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
}
