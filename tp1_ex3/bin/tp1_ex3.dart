import 'dart:io';

import 'package:tp1_ex3/data/insurances.dart';
import 'package:tp1_ex3/data/insurers.dart';
import 'package:tp1_ex3/data/persons.dart';
import 'package:tp1_ex3/date.dart';
import 'package:tp1_ex3/insurance.dart';
import 'package:tp1_ex3/insurances/auto_insurance.dart';
import 'package:tp1_ex3/insurer.dart';
import 'package:tp1_ex3/methods/edit_date.dart';
import 'package:tp1_ex3/methods/edit_person.dart';
import 'package:tp1_ex3/methods/new_insurance.dart';
import 'package:tp1_ex3/methods/new_insurer.dart';
import 'package:tp1_ex3/person.dart';

void main(List<String> arguments) {
  Insurers insurers = Insurers();
  Persons persons = Persons();
  Insurances insurances = Insurances();
  int opcao = 0;
  Person person1 = Person(
      name: 'Sergio', 
      birthDate: Date(day: 24, month: 02, year: 1994), 
      address: 'Ovar', 
      city: 'Ovar', 
      citizenID: 14244172, 
      taxID: 239627105);
  persons.add(person1);
  Person person2 = Person(
      name: 'Tiago', 
      birthDate: Date(day: 24, month: 02, year: 1994), 
      address: 'Pedroso', 
      city: 'Pedroso', 
      citizenID: 14244172, 
      taxID: 239627105);
  persons.add(person2);
  Insurer insurer1 = Insurer(name: 'Allianz', insuranceTypes: [Types.auto, Types.health]);
  Insurer insurer2 = Insurer(name: 'Fidelidade', insuranceTypes: [Types.auto, Types.health, Types.work]);
  insurers.add(insurer1);
  insurers.add(insurer2);

  insurances.add(
    Insurance(
      insurer: insurer1, 
      policyholder: person1, 
      insured: person2, 
      type: AutoInsurance(
        licensePlate: '20-20-MM', 
        brand: 'Mercedes', 
        model: 'Classe A', 
        seatCapacity: 5, 
        carYear: 2020, 
        carValuation: 30000.52, 
        driverLicenseDate: Date(day: 10, month: 10, year: 2020)), 
      insuredAmount: 27500, 
      periodicity: Periodicity.monthly, 
      chargeAmount: 35.52, 
      startDate: Date(day: 10, month: 10, year: 2020), 
      endDate: Date(day: 10, month: 10, year: 2022)));


  while (opcao != 9) {
    print("""
    ------------------ :: MENU :: ------------------
    
    Selecione a opção pretendida:

    1 - Adicionar Nova Apólice
    2 - Adicionar Nova Seguradora
    3 - Ver Todos Clientes
    4 - Ver Todas Seguradoras
    5 - Ver Todas Apólices

    9 - Sair

    ------------------------------------------------

    Opção : """);

    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        insurances.add(newInsurance(insurers, persons));
        break;
      case 2:
        insurers.add(newInsurer());
        break;
      case 3:
        printMap(persons.list, "Clientes");
        String cliente = stdin.readLineSync() ?? "";
        if (cliente != "") {
          print(persons.list[int.parse(cliente)]);
          print("-----");
          print("1 - Editar Cliente");
          print("2 - Editar Data de Nascimento");
          print("3 - Apagar Cliente");
          print("0 - Voltar");
          int opt = int.parse(stdin.readLineSync()!);
          if (opt==1) persons.update(int.parse(cliente), editPerson(persons, int.parse(cliente)));
          if (opt==2) persons.updateDate(int.parse(cliente), editDate(persons.list[int.parse(cliente)]!.birthDate));
          if (opt==3) persons.remove(int.parse(cliente));
        }
        break;
      case 4:
        printMap(insurers.list, "Seguradoras");
        break;
      case 5:
        printMap(insurances.list, "Apólices");
        break;
      case 9:
        break;
      default:
        print("Opção Inválida");
        break;
    }
  }
}

void printMap(Map dataMap, String typeMap) {
  print('----------- $typeMap -----------\n');
  dataMap.forEach((key, element) {
    print('$key - ${element.short()}');
  });
  print("");
  print("Para mais detalhes, digite o ID. Para avançar, deixe em branco.");
}
