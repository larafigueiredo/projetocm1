import 'dart:io';

import 'package:trabalhopratico3/insurer.dart';


Insurer newInsurer () {
  String? opt = '';
  List <Types> insuranceTypes = [];
  print("Nome da seguradora: ");
  String name = stdin.readLineSync() ?? "";

  print("Esta seguradora tem Seguros Automóveis? (y/n) ");
  while(opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n'){
    opt = stdin.readLineSync();
  }
  if (opt=='y') insuranceTypes.add(Types.auto);
  opt = '';

  print("Esta seguradora tem Seguros Habitação? (y/n) ");
  while(opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n'){
    opt = stdin.readLineSync();
  }
  if (opt=='y') insuranceTypes.add(Types.housing);
  opt = '';

  print("Esta seguradora tem Seguros de Saúde? (y/n) ");
  while(opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n'){
    opt = stdin.readLineSync();
  }
  if (opt=='y') insuranceTypes.add(Types.health);
  opt = '';

  print("Esta seguradora tem Seguros de Trabalho? (y/n) ");
  while(opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n'){
    opt = stdin.readLineSync();
  }
  if (opt=='y') insuranceTypes.add(Types.work);
  opt = '';

  return Insurer(name: name, insuranceTypes: insuranceTypes);
}