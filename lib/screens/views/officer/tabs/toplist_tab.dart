import 'package:flutter/material.dart';
import 'package:violation_system/widgets/text_widget.dart';

class ToplistTab extends StatelessWidget {
  const ToplistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextBold(text: 'Top List', fontSize: 24, color: Colors.black),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Card(
                        child: ListTile(
                          title: TextBold(
                              text: 'Location',
                              fontSize: 14,
                              color: Colors.black),
                          subtitle: TextRegular(
                              text: 'Person who commited the violation',
                              fontSize: 11,
                              color: Colors.grey),
                          trailing: TextRegular(
                              text: 'Date and Time',
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}