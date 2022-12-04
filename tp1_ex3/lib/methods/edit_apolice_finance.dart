import 'dart:io';

import 'package:tp1_ex3/data/insurances.dart';
import 'package:tp1_ex3/models/insurance.dart';

//editar dados financeiros relativos a apólice
Insurance editApoliceFinance(Insurances insurances, int key) {
  Insurance changes = insurances.list[key]!;
  int periodicidade = 0;
  print(
      "Se deseja alterar o campo, digite o novo valor. Caso contrário clique <Enter>");

  print("Valor Assegurado: (Atual: ${changes.insuredAmount})");
  String valorSegurado = stdin.readLineSync()!;
  if (valorSegurado != "") {
    changes.insuredAmount = double.parse(valorSegurado);
  }

  while (periodicidade < 1 || periodicidade > 3) {
    print("""
    ------------------------------------------------
    
    Selecione a Periodicidade (Atual: ${changes.periodicity}):

    1 - Mensal
    2 - Semi Anual
    3 - Anual
  
    ------------------------------------------------""");

    periodicidade = int.parse(stdin.readLineSync()!);

    if (periodicidade == 1) {
      changes.periodicity = Periodicity.monthly;
    }
    if (periodicidade == 2) {
      changes.periodicity = Periodicity.semiannual;
    }
    if (periodicidade == 3) {
      changes.periodicity = Periodicity.yearly;
    }
  }

  print("Valor Cobrado: (Atual: ${changes.chargeAmount})");
  String valorCobrado = stdin.readLineSync()!;
  if (valorCobrado != "") {
    changes.chargeAmount = double.parse(valorCobrado);
  }

  return changes;
}
