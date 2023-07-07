import 'package:flutter/material.dart';

class SetRemindersMenu extends StatefulWidget {
  @override
  SetRemindersMenuState createState() => SetRemindersMenuState();
}

class SetRemindersMenuState extends State<SetRemindersMenu> {
  bool meditationReminder = false;
  bool sleepReminder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Reminders'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Medication Reminder'),
            trailing: Switch(
              value: meditationReminder,
              onChanged: (value) {
                setState(() {
                  meditationReminder = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Sleep Reminder'),
            trailing: Switch(
              value: sleepReminder,
              onChanged: (value) {
                setState(() {
                  sleepReminder = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
