import 'package:cloud_firestore/cloud_firestore.dart';

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
) async {
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
    'lat': 0.00,
    'long': 0.00,
    'id': docUser.id,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
