import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addNotif(myName, officerId, name, violation) async {
  final docUser = FirebaseFirestore.instance.collection('Notifs').doc();

  final json = {
    'myName': myName,
    'myId': FirebaseAuth.instance.currentUser!.uid,
    'officerId': officerId,
    'message': '$myName added a violation to $name for $violation',
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
