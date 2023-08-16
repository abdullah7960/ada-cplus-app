import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/font_model.dart';
import 'add_remider.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final List<String> reminders = [
    'Buy groceries',
    'Call Mom',
    'Meeting at 3 PM',
    'Pay bills',
    'Exercise',
    'Read a book',
    'Finish project',
  ];
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerColor,
        title: const Text('Reminders'),
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(reminders[index]),
            leading: const Icon(Icons.alarm),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Delete reminder from the list
                // You can implement this functionality as needed.
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: containerColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddReminder();
          }));
          // Implement the functionality to add a new reminder
          // You can use a BottomSheet, Dialog, or another screen to add a reminder.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
