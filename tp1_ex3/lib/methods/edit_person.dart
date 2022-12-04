import 'dart:io';

import 'package:tp1_ex3/data/persons.dart';
import 'package:tp1_ex3/models/person.dart';

//editar dados da pessoa
Person editPerson(Persons persons, int key) {
  print(
      "Se deseja alterar o campo, digite o novo valor. Caso contrário clique <Enter>");

  print("Nome: (Atual: ${persons.list[key]!.name})");
  String name = stdin.readLineSync()!;
  if (name == "") name = persons.list[key]!.name;

  DateTime birthDate = persons.list[key]!.birthDate;

  print("Morada: (Atual: ${persons.list[key]!.address})");
  String address = stdin.readLineSync()!;
  if (address == "") address = persons.list[key]!.address;

  print("Cidade: (Atual: ${persons.list[key]!.city})");
  String city = stdin.readLineSync()!;
  if (city == "") city = persons.list[key]!.city;

  print("CC: (Atual: ${persons.list[key]!.citizenID})");
  String citizen = stdin.readLineSync()!;
  int citizenID = 0;
  if (citizen == "") {
    citizenID = persons.list[key]!.citizenID;
  } else {
    citizenID = int.parse(citizen);
  }

  print("NIF: (Atual: ${persons.list[key]!.taxID})");
  String tax = stdin.readLineSync()!;
  int taxID = 0;
  if (tax == "") {
    taxID = persons.list[key]!.taxID;
  } else {
    taxID = int.parse(tax);
  }

  return Person(
      name: name,
      birthDate: birthDate,
      address: address,
      city: city,
      citizenID: citizenID,
      taxID: taxID);
}
