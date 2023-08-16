import 'dart:developer';

import 'package:flutter/material.dart';

import '../../model/model_journal.dart';
import '../../repository/database_reposetory.dart';

// ignore: must_be_immutable
class AddReminder extends StatefulWidget {
  ToDoModel? todo;
  AddReminder({Key? key, this.todo}) : super(key: key);

  @override
  State<AddReminder> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddReminder> {
  bool important = false;
  final titleController = TextEditingController();
  final subtitleControler = TextEditingController();


  @override
  void dispose() {
    titleController.dispose();
    subtitleControler.dispose();
    super.dispose();
  }


  void addTodo() async {
    Navigator.pop(context);
    ToDoModel todo = ToDoModel(
        title: titleController.text,
        describtion: subtitleControler.text,
        isImportant: important);
    if (widget.todo == null) {
      await DatabaseRepository.instance.insert(todo: todo);
    } else {
      await DatabaseRepository.instance.update(todo);
    }
    log(titleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text('Title'),
                  hintText: 'Enter title '),
            ),
            const SizedBox(
              height: 36,
            ),
            TextFormField(
              controller: subtitleControler,
              decoration: const InputDecoration(
                label: Text('Description'),
              ),
            ),
            SwitchListTile.adaptive(
              title: const Text('Is your Reminder really important'),
              value: important,
              onChanged: (value) => setState(
                () {
                  important = value;
                },
              ),
            ),
            MaterialButton(
              color: Colors.black,
              height: 50,
              minWidth: double.infinity,
              onPressed: addTodo,
              child: Text(
                widget.todo == null ? 'Add Reminder' : 'Update Reminder',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
