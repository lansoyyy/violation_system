import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:violation_system/services/add_notif.dart';

Future addViolation(
    car,
    name,
    gender,
    age,
    violation,
    licenseNumber,
    plateNumber,
    vehicleDescription,
    location,
    evidence,
    owner,
    myName,
    myNumber,
    myAddress,
    fee) async {
  final docUser = FirebaseFirestore.instance.collection('Violations').doc();

  final json = {
    'name': name,
    'gender': gender,
    'car': car,
    'age': age,
    'violation': violation,
    'licenseNumber': licenseNumber,
    'plateNumber': plateNumber,
    'vehicleDescription': vehicleDescription,
    'location': location,
    'id': docUser.id,
    'dateTime': DateTime.now(),
    'officerId': FirebaseAuth.instance.currentUser!.uid,
    'status': 'Pending',
    'evidence': evidence,
    'owner': owner,
    'myName': myName,
    'fee': fee,
    'paid': false,
    'day': DateTime.now().day,
    'month': DateTime.now().month,
    'myNumber': myNumber,
    'myAddress': myAddress
  };

  addNotif(myName, FirebaseAuth.instance.currentUser!.uid, name, violation);

  await docUser.set(json);
}
