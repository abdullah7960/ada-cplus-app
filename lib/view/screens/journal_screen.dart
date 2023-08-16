import 'package:flutter/material.dart';
import 'package:openai_ada/view/screens/add_journal.dart';
import 'package:provider/provider.dart';

import '../../model/font_model.dart';
import '../../model/model_journal.dart';
import '../../repository/database_reposetory.dart';
import '../../widgets/journal_widget.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  void initState() {
    initDb();
    getTodos();
    super.initState();
  }

  void initDb() async {
    await DatabaseRepository.instance.database;
  }

  List<ToDoModel> myTodos = [];
  @override
  Widget build(BuildContext context) {
    final fontSizeModel = Provider.of<FontSizeModel>(context);
    int currentIndex = fontSizeModel.caresolSliderValue;
    //for color from index of moode
    Color containerColor;
    if (currentIndex == 0) {
      containerColor = Colors.red;
    } else if (currentIndex == 1) {
      containerColor = Colors.amber;
    } else if (currentIndex == 2) {
      containerColor = Colors.blue;
    } else if (currentIndex == 3) {
      containerColor = Colors.green;
    } else {
      containerColor = Colors.orange;
    }
    return RefreshIndicator(
      onRefresh: () async {
        getTodos();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: containerColor,
          onPressed: gotoAddScreen,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          backgroundColor: containerColor,
          title: const Text('My Journals'),
        ),
        body: myTodos.isEmpty
            ? const Center(child: Text('You don\'t have any journal yet'))
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final todo = myTodos[index];
                  return TodoWidget(
                    todo: todo,
                    onDeletePressed: () {
                      delete(todo: todo, context: context);
                      getTodos();
                    },
                  );
                },
                itemCount: myTodos.length,
              ),
      ),
    );
  }

  void getTodos() async {
    await DatabaseRepository.instance.getAllTodos().then((value) {
      setState(() {
        myTodos = value;
      });
      // ignore: invalid_return_type_for_catch_error
    }).catchError((e) => debugPrint(e.toString()));
  }

  void gotoAddScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddTodoScreen();
    }));
  }

  void delete({required ToDoModel todo, required BuildContext context}) async {
    DatabaseRepository.instance.delete(todo.id!).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Deleted')));
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    });
  }
}
