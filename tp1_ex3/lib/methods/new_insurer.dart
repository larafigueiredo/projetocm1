import 'dart:io';

import 'package:tp1_ex3/models/insurer.dart';
import 'package:tp1_ex3/methods/set_types.dart';

Insurer newInsurer() {
  String? opt = '';
  List<Types> insuranceTypes = [];
  print("Nome da seguradora: ");
  String name = stdin.readLineSync() ?? "";

  insuranceTypes = setTypes();

  return Insurer(name: name, insuranceTypes: insuranceTypes);
}
