import 'dart:io';

import 'package:tp1_ex3/insurances/auto_insurance.dart';

//editar dados do seguro automovel
AutoInsurance editAutoInsurance(AutoInsurance insurance) {
  print(
      "Se deseja alterar o campo, digite o novo valor. Caso contrário clique <Enter>");

  print("Matrícula (Atual: ${insurance.licensePlate})");
  String matricula = stdin.readLineSync() ?? "";
  if (matricula != "") insurance.licensePlate = matricula;

  print("Marca (Atual: ${insurance.brand})");
  String marca = stdin.readLineSync() ?? "";
  if (marca != "") insurance.brand = marca;

  print("Modelo (Atual: ${insurance.model})");
  String modelo = stdin.readLineSync() ?? "";
  if (modelo != "") insurance.model = modelo;

  print("Número de lugares (Atual: ${insurance.seatCapacity})");
  String numeroLugares = stdin.readLineSync()!;
  if (numeroLugares != "") insurance.seatCapacity = int.parse(numeroLugares);

  print("Ano do Automóvel (Atual: ${insurance.carYear})");
  String anoAutomovel = stdin.readLineSync()!;
  if (anoAutomovel != "") insurance.carYear = int.parse(anoAutomovel);

  print("Valor do Automóvel (Atual: ${insurance.carValuation})");
  String valorAutomovel = stdin.readLineSync()!;
  if (valorAutomovel != "")
    insurance.carValuation = double.parse(valorAutomovel);

  print("Data da Carta de Condução ");
  print("Dia:  (Atual: ${insurance.driverLicenseDate.day})");
  String dia = stdin.readLineSync()!;
  int day = insurance.driverLicenseDate.day;
  if (dia != "") day = int.parse(dia);
  print("Mês:  (Atual: ${insurance.driverLicenseDate.month})");
  String mes = stdin.readLineSync()!;
  int month = insurance.driverLicenseDate.day;
  if (mes != "") month = int.parse(mes);
  print("Ano:  (Atual: ${insurance.driverLicenseDate.year})");
  String ano = stdin.readLineSync()!;
  int year = insurance.driverLicenseDate.year;
  if (ano != "") year = int.parse(ano);

  insurance.driverLicenseDate = DateTime(year, month, day);

  return insurance;
}
