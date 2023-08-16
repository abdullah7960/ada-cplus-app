

class Reminder {
  final String title;
  final String description;
  final DateTime dateTime;
  bool isNotificationEnabled;
  bool isDismissed;
  DateTime? snoozeDateTime;

  Reminder({
    required this.title,
    required this.description,
    required this.dateTime,
    this.isNotificationEnabled = true,
    this.isDismissed = false,
    this.snoozeDateTime,
  });

  // Factory method to create a Reminder from a JSON map
  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.parse(json['dateTime']),
      isNotificationEnabled: json['isNotificationEnabled'],
      isDismissed: json['isDismissed'],
      snoozeDateTime: json['snoozeDateTime'] != null
          ? DateTime.parse(json['snoozeDateTime'])
          : null,
    );
  }

  // Convert Reminder object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'isNotificationEnabled': isNotificationEnabled,
      'isDismissed': isDismissed,
      'snoozeDateTime': snoozeDateTime?.toIso8601String(),
    };
  }
}
