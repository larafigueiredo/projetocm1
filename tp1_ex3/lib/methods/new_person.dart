import 'dart:io';
import 'package:tp1_ex3/models/person.dart';

Person newPerson() {
  String? opt = '';
  print("Nome Completo: ");
  String name = stdin.readLineSync() ?? "";

  print("Data de Nascimento ");
  print("Dia:  ");
  int dia = int.parse(stdin.readLineSync()!);
  print("Mês: ");
  int mes = int.parse(stdin.readLineSync()!);
  print("Ano: ");
  int ano = int.parse(stdin.readLineSync()!);

  print("Morada: ");
  String morada = stdin.readLineSync() ?? "";

  print("Cidade: ");
  String cidade = stdin.readLineSync() ?? "";

  print("Cartão do Cidadão");
  int cartao = int.parse(stdin.readLineSync()!);

  print("NIF");
  int nif = int.parse(stdin.readLineSync()!);

  DateTime birthDate = DateTime(ano, mes, dia);

  return Person(
      name: name,
      birthDate: birthDate,
      address: morada,
      city: cidade,
      citizenID: cartao,
      taxID: nif);
}
