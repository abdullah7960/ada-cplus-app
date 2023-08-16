import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/font_model.dart';


class NotificationScren extends StatefulWidget {
  const NotificationScren({super.key});

  @override
  State<NotificationScren> createState() => _NotificationScrenState();
}

class _NotificationScrenState extends State<NotificationScren> {
   final List<String> notifications = [
    'Reminder: Call Mom at 5 PM',
    'You have a meeting at 3 PM',
    'Don\'t forget to take your medication',
    'Exercise time!',
    'Pay your bills by tomorrow',
    'Read a book for 30 minutes',
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
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            leading: const Icon(Icons.notifications),
          );
        },
      ),
    );
  }
}