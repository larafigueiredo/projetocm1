import 'dart:io';

import 'package:tp1_ex3/insurances/housing_insurance.dart';

HousingInsurance editHousingInsurance(HousingInsurance insurance) {
  String? opt = "";
  print("Se deseja alterar o campo, digite o novo valor. Caso contrário clique <Enter>");

  print("Morada (Atual: ${insurance.address})");
  String morada = stdin.readLineSync() ?? "";
  if(morada != "") insurance.address = morada;

  print("Número de quartos (Atual: ${insurance.roomsCapacity})");
  String numeroQuartos = stdin.readLineSync()!;
  if(numeroQuartos != "") insurance.roomsCapacity = int.parse(numeroQuartos);

  print("A casa tem garagem? (y/n) (Atual: ${insurance.garage})");
  while (opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n') {
    opt = stdin.readLineSync();
  }
  if (opt == 'y') insurance.garage = true;
  if (opt == 'n') insurance.garage = false;

  print("Ano de Construção (Atual: ${insurance.constructionYear})");
  String anoConstrucao = stdin.readLineSync()!;
  if(anoConstrucao != "") insurance.constructionYear = int.parse(anoConstrucao);

  print("Valor da Habitação (Atual: ${insurance.houseValuation})");
  String valorHabitacao = stdin.readLineSync()!;
  if(valorHabitacao != "") insurance.houseValuation = double.parse(valorHabitacao);  
  
  return insurance;
}
