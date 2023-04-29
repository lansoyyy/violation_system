import 'package:flutter/material.dart';

import '../../../widgets/text_widget.dart';

class OfficerNotifScreen extends StatelessWidget {
  const OfficerNotifScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff6571E0),
        title:
            TextBold(text: 'Notifications', fontSize: 24, color: Colors.white),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Card(
            child: ListTile(
              leading: const Icon(Icons.notifications_active_sharp),
              title: TextBold(
                  text: 'Name of Notification',
                  fontSize: 14,
                  color: Colors.black),
              subtitle: TextRegular(
                  text: 'Date and Time', fontSize: 12, color: Colors.grey),
            ),
          ),
        );
      }),
    );
  }
}