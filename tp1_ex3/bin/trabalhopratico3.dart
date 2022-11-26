

import 'dart:io';

import 'package:trabalhopratico3/data/insurers.dart';
import 'package:trabalhopratico3/insurer.dart';
import 'package:trabalhopratico3/methods/new_insurance.dart';
import 'package:trabalhopratico3/methods/new_insurer.dart';

void main(List<String> arguments) {
  Insurers insurers = Insurers();
  int opcao = 0;

  while (opcao!=9) {
    print("""
    ------------------ :: MENU :: ------------------
    
    Selecione a opção pretendida:

    1 - Adicionar Nova Apólice
    2 - Adicionar Nova Seguradora
    3 - Modificar/Apagar Apólice
    4 - Modificar/Apagar Seguradora

    9 - Sair

    ------------------------------------------------

    Opção : """);

    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao){
      case 1: newInsurance();
        break;
      case 2: insurers.add(newInsurer());
        break;
      case 3: printStudents(insurers.list);
        break;
      case 9: break;
      default: print("Opção Inválida");
        break;
    }

  }

  
}

void printStudents(List<Insurer> insurers){
  print('----- SUMMARY (finally block) -----');
  insurers.forEach((element) {print(element);});
}
