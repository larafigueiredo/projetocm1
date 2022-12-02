import 'dart:io';

import 'package:tp1_ex3/data/insurances.dart';
import 'package:tp1_ex3/data/insurers.dart';
import 'package:tp1_ex3/data/persons.dart';
import 'package:tp1_ex3/insurance.dart';
import 'package:tp1_ex3/insurances/auto_insurance.dart';
import 'package:tp1_ex3/insurances/health_insurance.dart';
import 'package:tp1_ex3/insurances/housing_insurance.dart';
import 'package:tp1_ex3/insurances/work_insurance.dart';
import 'package:tp1_ex3/insurer.dart';
import 'package:tp1_ex3/methods/edit_apolice_finance.dart';
import 'package:tp1_ex3/methods/edit_auto_insurance.dart';
import 'package:tp1_ex3/methods/edit_date.dart';
import 'package:tp1_ex3/methods/edit_health_insurance.dart';
import 'package:tp1_ex3/methods/edit_housing_insurance.dart';
import 'package:tp1_ex3/methods/edit_person.dart';
import 'package:tp1_ex3/methods/edit_work_insurance.dart';
import 'package:tp1_ex3/methods/new_insurance.dart';
import 'package:tp1_ex3/methods/new_insurer.dart';
import 'package:tp1_ex3/methods/new_person.dart';
import 'package:tp1_ex3/methods/set_types.dart';
import 'package:tp1_ex3/person.dart';

Insurers insurers = Insurers();
Persons persons = Persons();
Insurances insurances = Insurances();

void main(List<String> arguments) {
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
  int opcao = 0;
  double somaValorPremio = 0;
  double valorPremio = 0;

  Insurances insurances = Insurances();

  Person person1 = Person(
      name: 'Sergio',
      birthDate: DateTime(1994, 2, 24),
      address: 'Ovar',
      city: 'Ovar',
      citizenID: 14244172,
      taxID: 239627105);
  persons.add(person1);
  Person person2 = Person(
      name: 'Tiago',
      birthDate: DateTime(1994, 2, 24),
      address: 'Pedroso',
      city: 'Pedroso',
      citizenID: 14244172,
      taxID: 239627105);
  persons.add(person2);
  Person person3 = Person(
      name: 'Bruno',
      birthDate: DateTime(1992, 5, 8),
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

  insurances.add(AutoInsurance(
      insurer: insurer1,
      policyholder: person1,
      insured: person2,
      insuranceType: Types.auto,
      insuredAmount: 10000,
      periodicity: Periodicity.yearly,
      chargeAmount: 35.52,
      startDate: DateTime(2022, 10, 10),
      endDate: DateTime(2024, 10, 10),
      licensePlate: '20-20-MM',
      brand: 'Mercedes',
      model: 'Classe A',
      seatCapacity: 5,
      carYear: 2020,
      carValuation: 30000.52,
      driverLicenseDate: DateTime(2020, 10, 10)
  ));

  insurances.add(AutoInsurance(
      insurer: insurer1,
      policyholder: person3,
      insured: person3,
      insuranceType: Types.auto,
      insuredAmount: 10000,
      periodicity: Periodicity.monthly,
      chargeAmount: 35.52,
      startDate: DateTime(2022, 10, 10),
      endDate: DateTime(2024, 10, 10),
      licensePlate: '20-20-MM',
      brand: 'Mercedes',
      model: 'Classe A',
      seatCapacity: 5,
      carYear: 2020,
      carValuation: 30000.52,
      driverLicenseDate: DateTime(2020, 10, 10)
  ));

 insurances.add(AutoInsurance(
      insurer: insurer1,
      policyholder: person3,
      insured: person3,
      insuranceType: Types.auto,
      insuredAmount: 10000,
      periodicity: Periodicity.monthly,
      chargeAmount: 35.52,
      startDate: DateTime(2022, 10, 10),
      endDate: DateTime(2024, 10, 10),
      licensePlate: '20-20-MM',
      brand: 'Mercedes',
      model: 'Classe A',
      seatCapacity: 5,
      carYear: 2020,
      carValuation: 30000.52,
      driverLicenseDate: DateTime(2020, 10, 10)
  ));
  
    insurances.add(AutoInsurance(
      insurer: insurer1,
      policyholder: person1,
      insured: person2,
      insuranceType: Types.auto,
      insuredAmount: 10000,
      periodicity: Periodicity.yearly,
      chargeAmount: 35.52,
      startDate: DateTime(2022, 10, 10),
      endDate: DateTime(2024, 10, 10),
      licensePlate: '20-20-MM',
      brand: 'Mercedes',
      model: 'Classe A',
      seatCapacity: 5,
      carYear: 2020,
      carValuation: 30000.52,
      driverLicenseDate: DateTime(2020, 10, 10)
  ));

  
  while (opcao != 12) {
    print("\n");
    print(
        "|-----------------------------------------------------------------------------------------|");
    print(
        "|                                    Surpresas Existem!                                   |");
    print(
        "|-----------------------------------------------------------------------------------------|");
    print(
        "|------------------------------Selecione a opção pretendida:------------------------------|");
    print(
        "1 - Adicionar Nova Apólice                                                              ");
    print(
        "2- Adicionar Nova Seguradora                                                            ");
    print(
        "3- Ver Todos Clientes                                                                   ");
    print(
        "4- Ver Todas Seguradoras                                                                ");
    print(
        "5- Ver Todas Apólices                                                                   ");
    print(
        "6- Apolices ativas mostrando segurado e seguradora e tipo de seguro                     ");
    print(
        "7- Relatório de entidades (tomadores e segurados) com apólices ativas nome e endereco   ");
    print(
        "8- Apolices ativas e inativas, e quantidade total                                           ");
    print(
        "9- Quantidade de apólices e valor médio segurado por seguradora (apenas apólices ativas)     ");
    print(
        "10 - Quantidade de apólices e valor médio segurado por tipo de seguro (apenas apólices ativas); ");
    print(
        "11- Sair                                                                                         ");

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
          printPerson(cliente);
        }
        break;
      case 4:
        printMap(insurers.list, "Seguradoras");
        String seguradora = stdin.readLineSync() ?? "";
        if (seguradora != "") {
          printSeguradora(seguradora);
        }
        break;

      case 5:
        String apolice = "";
        while (apolice == "") {
          printMap(insurances.list, "Apólices");
          apolice = stdin.readLineSync()!;
          apolice = printApolice(apolice);
        }
        break;

      case 6:
        print("\n-- Digite o tipo de periodicidade: --");
        print("1- Mensal\n2- Semi Anual\n3- Anual");
        int periodicidade = int.parse(stdin.readLineSync()!);
        String converteNomePeriodicidade = '';
        if (periodicidade == 1) {
          converteNomePeriodicidade = 'monthly';
        }
        if (periodicidade == 2) {
          converteNomePeriodicidade = 'semiannual';
        }
        if (periodicidade == 3) {
          converteNomePeriodicidade = 'yearly';
        }
        insurances.list.entries.forEach((entry) {
          List<String> campos = entry.value.endDate.toString().split('/');
          int dia = int.parse(campos[0]);
          int mes = int.parse(campos[1]);
          int ano = int.parse(campos[2]);
          DateTime endDate = DateTime(ano, mes, dia);
          DateTime hoje = DateTime.now();
          if (hoje.isBefore(endDate)) {
            print("\n");
            if (entry.value.periodicity.name
                .contains(converteNomePeriodicidade)) {
              somaValorPremio = somaValorPremio + entry.value.insuredAmount;
            }
          }
        });
        switch (periodicidade) {
          case 1:
            valorPremio = (somaValorPremio * 1);
            break;
          case 2:
            valorPremio = (somaValorPremio * 6);
            break;
          case 3:
            valorPremio = (somaValorPremio * 12);
            break;
          default:
        }
        print('O valor do Prêmio Anual é $valorPremio €');
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
            print(age(entry.value.insured.birthDate));
            print(entry.value.insured.city);
            print(entry.value.policyholder.name);
            print(age(entry.value.policyholder.birthDate));
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
        print('A media valor segurado da $seguradora é  $mediaSeguradora €');
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
        print('A media valor segurado da auto é  $mediaTipoSeguro €');
        break;
      case 11:
        print("Programa Finalizado");
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
  print("Para selecionar, digite o ID. Para voltar, deixe em branco.");
}

int age(DateTime data, [String? m, DateTime? old]){
  DateTime hoje = DateTime.now();
  if (m == "month"){
    if ( data.month > old!.month && old.year > data.year) {
      if(old.day >= data.day) {
        return old.month + (12 - data.month);
      } else {
        return old.month + (12 - data.month) - 1;
      }
    }
    else{
      if (data.month < old.month - 1 || data.month == old.month -1 && data.day <= old.day) {
        if(old.day >= data.day) {
          return old.month - data.month;
        } else {
          return old.month - data.month - 1;
        }
      } else{
        return 0;
      }
    }
  } else {
    if(hoje.month < data.month || (hoje.month == data.month && hoje.day < data.day)) {
      return hoje.year - data.year - 1;
    } else {
      return hoje.year - data.year;
    }
  }
}

void printSeguradora(String seguradora) {
  print("----------------------------------------");
  print(insurers.list[int.parse(seguradora)]);
  print("----------------- MENU -----------------");
  print("1 - Alterar Nome");
  print("2 - Alterar Tipos de Seguro");
  print("3 - Remover Seguradora");
  print("0 - Voltar");
  print("----------------------------------------");
  int opt = int.parse(stdin.readLineSync()!);
  if (opt == 1) {
    print("Nome: (Atual: ${insurers.list[int.parse(seguradora)]!.name})");
    String name = stdin.readLineSync()!;
    insurers.update(int.parse(seguradora), name);
  }
  if (opt == 2) {
    List<Types> types = setTypes();
    insurers.updateTypes(int.parse(seguradora), types);
  }
  if (opt == 3) insurers.remove(int.parse(seguradora));
}

void printPerson(String cliente){
  print("----------------------------------------");
  print(persons.list[int.parse(cliente)]);
  print("----------------- MENU -----------------");
  print("1 - Editar Cliente");
  print("2 - Editar Data de Nascimento");
  print("3 - Apagar Cliente");
  print("0 - Voltar");
  print("----------------------------------------");
  int opt = int.parse(stdin.readLineSync()!);
  if (opt == 1) {
    persons.update(
        int.parse(cliente), editPerson(persons, int.parse(cliente)));
  }
  if (opt == 2) {
    persons.updateDate(int.parse(cliente),
        editDate(persons.list[int.parse(cliente)]!.birthDate));
  }
  if (opt == 3) persons.remove(int.parse(cliente));
}

String printApolice(String apolice) {
  print("----------------------------------------");
  print(insurances.list[int.parse(apolice)]);
  print("----------------- MENU -----------------");
  print(" 1 - Ver Detalhes Seguradora");
  print(" 2 - Ver Detalhes Tomador do Seguro");
  print(" 3 - Ver Detalhes Pessoa Segurada");
  print("----------------------------------------");
  print(" 4 - Alterar Pessoa Segurada");
  print(" 5 - Alterar Detalhes da Apólice");
  print(" 6 - Alterar Informação Financeira");
  print(" 7 - Transferir para outra Seguradora");
  print(" 8 - Renovar 1 ano"); // incrementa 1 ano na data de fim de seguro
  print(" 9 - Terminar Apólice"); // altera data de fim e mostra valor a devolver
  print("10 - Eliminar Apólice"); // elimina o registo
  print(" 0 - Voltar");
  print("----------------------------------------");
  int opt = int.parse(stdin.readLineSync()!);
  if (opt == 1) printSeguradora(insurers.list.keys.firstWhere((k) => insurers.list[k] == insurances.list[int.parse(apolice)]?.insurer).toString());
  if (opt == 2) printPerson(persons.list.keys.firstWhere((k) => persons.list[k] == insurances.list[int.parse(apolice)]?.policyholder).toString());
  if (opt == 3) printPerson(persons.list.keys.firstWhere((k) => persons.list[k] == insurances.list[int.parse(apolice)]?.insured).toString());
  if ([1, 2, 3].contains(opt)){
    print("Prima qualquer tecla para voltar");
    stdin.readLineSync();
    return "";
  } 
  if (opt == 4) {
    Person segurado = newPerson();
    insurances.updateInsured(int.parse(apolice), segurado);
  }
  if (opt == 5) {
    switch (insurances.list[int.parse(apolice)]!.insuranceType){  
      case Types.auto:
        insurances.updateAutoInsurance(int.parse(apolice), editAutoInsurance(insurances.list[int.parse(apolice)] as AutoInsurance));
        break;
      case Types.health:
        insurances.updateHealthInsurance(int.parse(apolice), editHealthInsurance(insurances.list[int.parse(apolice)] as HealthInsurance));
        break;
      case Types.housing:
        insurances.updateHousingInsurance(int.parse(apolice), editHousingInsurance(insurances.list[int.parse(apolice)] as HousingInsurance));
        break;
      case Types.work:
        insurances.updateWorkInsurance(int.parse(apolice), editWorkInsurance(insurances.list[int.parse(apolice)] as WorkInsurance));
        break;
    }
  }
  if (opt == 6) {
    insurances.updateFinancial(
        int.parse(apolice), editApoliceFinance(insurances, int.parse(apolice)));
  }
  if (opt == 7) {
    printMap(insurers.list, "Seguradoras");
    int seguradora = int.parse(stdin.readLineSync()!);
    insurances.transferir(int.parse(apolice), insurers.list[seguradora]!);
  }
  if (opt == 8) {
    insurances.renovar(int.parse(apolice));
  }
  if (opt == 9) {
    DateTime novaData = editDate(insurances.list[int.parse(apolice)]!.endDate);
    int mesesDevolucao = age(novaData, "month", insurances.list[int.parse(apolice)]!.endDate);
    insurances.updateEndDate(int.parse(apolice), novaData);
    switch(insurances.list[int.parse(apolice)]!.periodicity){
      case Periodicity.monthly:
        print("Não existe devolução uma vez que a periodicidade é mensal");
        break;
      case Periodicity.semiannual:
        print("Valor a devolver ($mesesDevolucao meses): ${mesesDevolucao * (insurances.list[int.parse(apolice)]!.chargeAmount / 6).roundToDouble()} €");
        break;
      case Periodicity.yearly:
        print("Valor a devolver ($mesesDevolucao meses): ${mesesDevolucao * (insurances.list[int.parse(apolice)]!.chargeAmount / 12).roundToDouble()} €");
        break;
    }
  }
  if (opt == 10) insurances.remove(int.parse(apolice));
  return " ";
}
