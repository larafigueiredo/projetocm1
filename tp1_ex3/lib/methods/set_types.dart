import 'dart:io';

import 'package:tp1_ex3/insurer.dart';

List<Types> setTypes() {
  String? opt = '';
  List<Types> insuranceTypes = [];

  print("Esta seguradora tem Seguros Automóveis? (y/n) ");
  while (opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n') {
    opt = stdin.readLineSync();
  }
  if (opt == 'y') insuranceTypes.add(Types.auto);
  opt = '';

  print("Esta seguradora tem Seguros Habitação? (y/n) ");
  while (opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n') {
    opt = stdin.readLineSync();
  }
  if (opt == 'y') insuranceTypes.add(Types.housing);
  opt = '';

  print("Esta seguradora tem Seguros de Saúde? (y/n) ");
  while (opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n') {
    opt = stdin.readLineSync();
  }
  if (opt == 'y') insuranceTypes.add(Types.health);
  opt = '';

  print("Esta seguradora tem Seguros de Trabalho? (y/n) ");
  while (opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n') {
    opt = stdin.readLineSync();
  }
  if (opt == 'y') insuranceTypes.add(Types.work);
  opt = '';

  return insuranceTypes;
}
