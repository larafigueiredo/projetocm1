import 'dart:io';

import 'package:tp1_ex3/insurances/health_insurance.dart';

HealthInsurance editHealthInsurance(HealthInsurance insurance) {
  String text = " ";
  List<String> doencas = [];
  List<String> redesMedicas = [];
  print("Se deseja alterar o campo, digite o novo valor. Caso contrário clique <Enter>");

  while (text != "") {
    print(
        "Indique doenças associadas (Para avançar deixe em branco");
    text = stdin.readLineSync() ?? "";
    if (text != "") doencas.add(text);
  }

  text = " ";

  while (text != "") {
    print(
        "Indique as redes médicas associadas (Para avançar deixe em branco");
    text = stdin.readLineSync() ?? "";
    if (text != "") redesMedicas.add(text);
  }
  
  insurance.diseases=doencas;
  insurance.medicalNetwork=redesMedicas;
  
  return insurance;
}
