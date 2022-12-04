import 'dart:io';

import 'package:tp1_ex3/insurances/work_insurance.dart';

//editar dados do seguro trabalho
WorkInsurance editWorkInsurance(WorkInsurance insurance) {
  print(
      "Se deseja alterar o campo, digite o novo valor. Caso contrário clique <Enter>");

  print("Nome da Empresa (Atual: ${insurance.companyName})");
  String nome = stdin.readLineSync() ?? "";
  if (nome != "") insurance.companyName = nome;

  print("Morada (Atual: ${insurance.address})");
  String morada = stdin.readLineSync() ?? "";
  if (morada != "") insurance.address = morada;

  print("Tipo de Trabalho (Atual: ${insurance.workType})");
  String tipoTrabalho = stdin.readLineSync() ?? "";
  if (tipoTrabalho != "") insurance.workType = tipoTrabalho;

  return insurance;
}
