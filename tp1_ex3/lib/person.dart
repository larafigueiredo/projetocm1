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

  String short() {
    return '$name ($city)';
  }

  @override
  String toString() {
    return("""
Nome:\t\t\t$name
Data Nascimento:\t$birthDate
Morada:\t\t\t$address
Cidade:\t\t\t$city
CC:\t\t\t$citizenID
NIF:\t\t\t$taxID""");
  }
}
