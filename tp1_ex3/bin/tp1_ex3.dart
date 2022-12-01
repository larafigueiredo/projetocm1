import 'dart:ffi';
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
  double soma = 0;
  double somaApoliceAtiva = 0;
  double somaApoliceInativa = 0;
  int totalApolices = 0;
  double contaSeguradora = 0;
  double somaSeguradora = 0;
  double mediaSeguradora = 0;
  double contaTipoSeguro = 0;
  double somaTipoSeguro = 0;
  double mediaTipoSeguro = 0;

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
  Person person3 = Person(
      name: 'Bruno',
      birthDate: Date(day: 15, month: 08, year: 1992),
      address: 'Pedroso',
      city: 'Pedroso',
      citizenID: 14244172,
      taxID: 239627105);
  persons.add(person3);
  Insurer insurer1 =
      Insurer(name: 'Allianz', insuranceTypes: [Types.auto, Types.health]);
  Insurer insurer2 = Insurer(
      name: 'Fidelidade',
      insuranceTypes: [Types.auto, Types.health, Types.work]);
  insurers.add(insurer1);
  insurers.add(insurer2);

  insurances.add(Insurance(
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
      insuredAmount: 10000,
      periodicity: Periodicity.monthly,
      chargeAmount: 35.52,
      startDate: Date(day: 10, month: 10, year: 2020),
      endDate: Date(day: 10, month: 10, year: 2024)));

  insurances.add(Insurance(
      insurer: insurer2,
      policyholder: person3,
      insured: person3,
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
      endDate: Date(day: 10, month: 10, year: 2025)));

  while (opcao != 12) {
    print("""
    ------------------ :: MENU :: ------------------
    
    Selecione a opção pretendida:

    1 - Adicionar Nova Apólice
    2 - Adicionar Nova Seguradora
    3 - Ver Todos Clientes
    4 - Ver Todas Seguradoras
    5 - Ver Todas Apólices
    6-  Apolices ativas mostrando segurado e seguradora e tipo de seguro
    7 - Relatório de entidades (tomadores e segurados) com apólices ativas nome e endereco
    8 - Apolices ativas e inativas, e quantidade total
    9 - quantidade de apólices e valor médio segurado por seguradora (apenas apólices ativas)
    10 - quantidade de apólices e valor médio segurado por tipo de seguro (apenas apólices ativas);

    11 - Sair

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
          if (opt == 1)
            persons.update(
                int.parse(cliente), editPerson(persons, int.parse(cliente)));
          if (opt == 2)
            persons.updateDate(int.parse(cliente),
                editDate(persons.list[int.parse(cliente)]!.birthDate));
          if (opt == 3) persons.remove(int.parse(cliente));
        }
        break;
      case 4:
        printMap(insurers.list, "Seguradoras");
        break;
      case 5:
        printMap(insurances.list, "Apólices");
        break;
      case 6:
        double valorPremio;
        insurances.list.entries.forEach((entry) {
          List<String> campos = entry.value.endDate.toString().split('/');
          int dia = int.parse(campos[0]);
          int mes = int.parse(campos[1]);
          int ano = int.parse(campos[2]);
          DateTime endDate = DateTime(ano, mes, dia);
          DateTime hoje = DateTime.now();
          if (hoje.isBefore(endDate)) {
            print(entry.value);
            print(entry.value.insurer.insuranceTypes);
            print(entry.value.insuredAmount);
          }
        });
        break;
      case 7:
        insurances.list.entries.forEach((entry) {
          List<String> campos = entry.value.endDate.toString().split('/');
          int dia = int.parse(campos[0]);
          int mes = int.parse(campos[1]);
          int ano = int.parse(campos[2]);
          DateTime ativa = DateTime(ano, mes, dia);
          DateTime hoje = DateTime.now();
          if (hoje.isBefore(ativa)) {
            print(entry.value.insured.name);
            print(entry.value.insured.birthDate.age());
            print(entry.value.insured.city);
            print(entry.value.policyholder.name);
            print(entry.value.policyholder.birthDate.age());
          }
        });
        break;
      case 8:
        totalApolices = insurances.list.length;
        insurances.list.entries.forEach((entry) {
          List<String> campos = entry.value.endDate.toString().split('/');
          int dia = int.parse(campos[0]);
          int mes = int.parse(campos[1]);
          int ano = int.parse(campos[2]);
          DateTime endDate = DateTime(ano, mes, dia);
          DateTime hoje = DateTime.now();
          if (hoje.isBefore(endDate)) {
            somaApoliceAtiva = somaApoliceAtiva + 1;
          }
        });
        somaApoliceInativa = totalApolices - somaApoliceAtiva;
        print('A quantidade de apólices total é  $totalApolices');
        print('A quantidade de apólices ativas é  $somaApoliceAtiva');
        print('A quantidade de apólices inativas é  $somaApoliceInativa');
        break;
      case 9:
        print("\n-- Indique a seguradora:--");
        String seguradora = stdin.readLineSync() ?? "";
        insurances.list.entries.forEach((entry) {
          List<String> campos = entry.value.endDate.toString().split('/');
          int dia = int.parse(campos[0]);
          int mes = int.parse(campos[1]);
          int ano = int.parse(campos[2]);
          DateTime endDate = DateTime(ano, mes, dia);
          DateTime hoje = DateTime.now();
          totalApolices = insurances.list.length;
          if (hoje.isBefore(endDate)) {
            somaApoliceAtiva = somaApoliceAtiva + 1;
            //sub-menu dos tipos de seguros
            if (entry.value.insurer.name.contains(seguradora)) {
              contaSeguradora++;
              somaSeguradora = somaSeguradora + entry.value.insuredAmount;
            }
          }
        });
        mediaSeguradora = somaSeguradora / contaSeguradora;
        print('A quantidade de apólices da $seguradora é  $contaSeguradora');
        print('A media valor segurado da $seguradora é  $mediaSeguradora');
        break;
      case 10:
        print("\n-- Indique o tipo de Seguro:--");
        String tipoSeguro = stdin.readLineSync() ?? "";
        insurances.list.entries.forEach((entry) {
          List<String> campos = entry.value.endDate.toString().split('/');
          int dia = int.parse(campos[0]);
          int mes = int.parse(campos[1]);
          int ano = int.parse(campos[2]);
          DateTime endDate = DateTime(ano, mes, dia);
          DateTime hoje = DateTime.now();
          totalApolices = insurances.list.length;
          if (hoje.isBefore(endDate)) {
            entry.value.insurer.insuranceTypes.forEach((entryInsurancer) {
              if (entryInsurancer.name.contains(tipoSeguro)) {
                contaTipoSeguro++;
                somaTipoSeguro = somaTipoSeguro + entry.value.insuredAmount;
              }
            });
          }
        });
        mediaTipoSeguro = somaTipoSeguro / contaTipoSeguro;
        print('A quantidade de apólices da auto é  $contaTipoSeguro');
        print('A media valor segurado da auto é  $mediaTipoSeguro');
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
