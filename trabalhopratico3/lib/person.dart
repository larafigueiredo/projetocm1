import 'package:tp1_ex3/date.dart';

class Person {
  String name;
  Date birthDate;
  String address;
  String city;
  int citizenID;
  int taxID;

  Person(
      {required this.name,
      required this.birthDate,
      required this.address,
      required this.city,
      required this.citizenID,
      required this.taxID});

  @override
  String toString() {
    return '$name ($city)';
  }
}
