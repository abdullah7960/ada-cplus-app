import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the plugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

class NotificationModel {
  final String title;
  final String body;

  NotificationModel({required this.title, required this.body});
}

List<NotificationModel> notificationList = [
  NotificationModel(
    title: 'Reminder',
    body: 'Don\'t forget your appointment!',
  ),
  NotificationModel(
    title: 'New Message',
    body: 'You have a new message from John.',
  ),
  // Add more notifications as needed
];

class NotificationScreen extends StatelessWidget {
  

  const NotificationScreen({super.key, required this.notifications});
final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Screen'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(notifications[index].title),
            subtitle: Text(notifications[index].body),
            // Customize the ListTile as needed
          );
        },
      ),
    );
  }
}