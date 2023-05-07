import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:violation_system/screens/views/officer/tabs/license_tab.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import '../../../../widgets/text_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final searchController = TextEditingController();

  final box = GetStorage();

  String nameSearched = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextBold(
                text: 'Welcome Officer\n      John Doe!',
                fontSize: 32,
                color: Colors.black),
            const SizedBox(
              height: 20,
            ),
            TextRegular(
                text: 'Violation Records', fontSize: 18, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 325,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    nameSearched = value;
                  });
                },
                decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontFamily: 'QRegular'),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
                controller: searchController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Violations')
                    .where('licenseNumber',
                        isGreaterThanOrEqualTo:
                            toBeginningOfSentenceCase(nameSearched))
                    .where('licenseNumber',
                        isLessThan:
                            '${toBeginningOfSentenceCase(nameSearched)}z')
                    .where('status', isEqualTo: 'Accepted')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                    );
                  }

                  final data = snapshot.requireData;
                  return Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          final violationData = data.docs[index];

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LicenseTab(
                                            userDetails: violationData,
                                          )));
                                },
                                title: TextBold(
                                    text: violationData['licenseNumber'],
                                    fontSize: 14,
                                    color: Colors.black),
                                subtitle: TextRegular(
                                    text: violationData['name'],
                                    fontSize: 11,
                                    color: Colors.grey),
                                trailing: const Icon(Icons.arrow_forward),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
