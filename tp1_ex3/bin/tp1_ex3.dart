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
  int somaApoliceAtiva = 0;
  int somaApoliceInativa = 0;
  int totalApolices = 0;
  int contaSeguradora = 0;
  double somaSeguradora = 0;
  double mediaSeguradora = 0;
  int contaTipoSeguro = 0;
  double somaTipoSeguro = 0;
  double mediaTipoSeguro = 0;
  int opcao = 0;
  double somaValorPremio = 0;

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
      driverLicenseDate: DateTime(2020, 10, 10)));

  insurances.add(AutoInsurance(
      insurer: insurer2,
      policyholder: person3,
      insured: person3,
      insuranceType: Types.work,
      insuredAmount: 10000,
      periodicity: Periodicity.monthly,
      chargeAmount: 35.52,
      startDate: DateTime(2021, 10, 10),
      endDate: DateTime(2023, 10, 10),
      licensePlate: '20-20-MM',
      brand: 'Mercedes',
      model: 'Classe A',
      seatCapacity: 5,
      carYear: 2020,
      carValuation: 30000.52,
      driverLicenseDate: DateTime(2020, 10, 10)));

  while (opcao != 11) {
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
        " 1 - Adicionar Nova Apólice                                                              ");
    print(
        " 2 - Adicionar Nova Seguradora                                                            ");
    print(
        " 3 - Ver Todos Clientes                                                                   ");
    print(
        " 4 - Ver Todas Seguradoras                                                                ");
    print(
        " 5 - Ver Todas Apólices                                                                  ");
    print(
        "|-----------------------------------------------------------------------------------------|");
    print(
        "|                                    Dashboard!                                           |");
    print(
        "|-----------------------------------------------------------------------------------------|");
    print(
        " 6 -                                 Mostrar Dashboard                                     ");
    print(
        " 7 - Relatório de entidades (tomadores e segurados) com apólices ativas nome e endereco   ");
    print(
        "11 - Sair                                                                                 ");

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
        // insurances.list.entries.forEach((entry) {
        //   DateTime hoje = DateTime.now();
        //   if (hoje.isBefore(entry.value.endDate)) {
        //     switch (entry.value.periodicity) {
        //       case Periodicity.monthly:
        //         somaValorPremio =
        //             somaValorPremio + (entry.value.chargeAmount * 12);
        //         break;
        //       case Periodicity.semiannual:
        //         somaValorPremio =
        //             somaValorPremio + (entry.value.chargeAmount * 2);
        //         break;
        //       case Periodicity.yearly:
        //         somaValorPremio = somaValorPremio + entry.value.chargeAmount;
        //         break;
        //     }
        //   }
        // });
        // print('O valor do Prêmio Anual é $somaValorPremio €');
        // print('');
        // print("Prima <Enter> para voltar ao Menu");
        // stdin.readLineSync();
        // break;
        totalApolices = insurances.list.length;
        insurances.list.entries.forEach((entry) {
          DateTime hoje = DateTime.now();
          if (hoje.isBefore(entry.value.endDate)) {
            somaApoliceAtiva = somaApoliceAtiva + 1;
          }
        });
        somaApoliceInativa = totalApolices - somaApoliceAtiva;
        print('Total de apólices\tApólices Ativas\t\tApólices Inativas \n'
            '--------------------------------------------------------------------\n');
        print(
            '$totalApolices\t\t\t$somaApoliceAtiva\t\t\t\t$somaApoliceInativa\t\t\t');

        print(
            "\n----------------- Indique a seguradora:------------------------------");
        String seguradora = stdin.readLineSync() ?? "";
        insurances.list.entries.forEach((entry) {
          DateTime hoje = DateTime.now();
          totalApolices = insurances.list.length;
          if (hoje.isBefore(entry.value.endDate)) {
            somaApoliceAtiva = somaApoliceAtiva + 1;
            //sub-menu dos tipos de seguros
            if (entry.value.insurer.name.contains(seguradora)) {
              contaSeguradora++;
              somaSeguradora = somaSeguradora + entry.value.insuredAmount;
            }
          }
        });
        mediaSeguradora = somaSeguradora / contaSeguradora;
        print(
            'Quantidade de Apólices\t\tValor Médio segurado por esta seguradora\n'
            '-----------------------------------------------------------------------\n');
        print('$contaSeguradora\t\t\t\t$mediaSeguradora €');
        //print('A quantidade de apólices da $seguradora é  $contaSeguradora');
        //print('A media valor segurado da $seguradora é  $mediaSeguradora €');
        print('');

        print(
            "\n----------------- Indique o tipo de Seguro:----------------------------");
        String tipoSeguro = stdin.readLineSync() ?? "";
        insurances.list.entries.forEach((entry) {
          DateTime hoje = DateTime.now();
          totalApolices = insurances.list.length;
          if (hoje.isBefore(entry.value.endDate)) {
            entry.value.insurer.insuranceTypes.forEach((entryInsurancer) {
              if (entryInsurancer.name.contains(tipoSeguro)) {
                contaTipoSeguro++;
                somaTipoSeguro = somaTipoSeguro + entry.value.insuredAmount;
              }
            });
          }
        });

        mediaTipoSeguro = somaTipoSeguro / contaTipoSeguro;
        print(
            'Quantidade de Apólices\t\tValor Médio segurado por tipo de Seguro\n'
            '-----------------------------------------------------------------------\n');
        print('$contaTipoSeguro\t\t\t\t$mediaTipoSeguro €');

        print('');
        print("Prima <Enter> para voltar ao Menu");
        stdin.readLineSync();
        break;
      case 7:
        print('          Nome\t\tIdade\tMorada \n'
            '-------------------------------------------------------------------------------------------------------------\n');
        insurances.list.entries.forEach((entry) {
          DateTime hoje = DateTime.now();
          if (hoje.isBefore(entry.value.endDate)) {
            print(
                'Tomador -> ${(entry.value.insured.name)}\t\t${(age(entry.value.insured.birthDate))}\t${(entry.value.insured.address)}\t\t'
                'Segurado -> ${(entry.value.policyholder.name)}\t\t${(age(entry.value.policyholder.birthDate))}\t${(entry.value.policyholder.address)}');
          }
        });
        print('');
        print("Prima <Enter> para voltar ao Menu");
        stdin.readLineSync();
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

int age(DateTime data, [String? m, DateTime? old]) {
  DateTime hoje = DateTime.now();
  if (m == "month") {
    if (data.month > old!.month && old.year > data.year) {
      if (old.day >= data.day) {
        return old.month + (12 - data.month);
      } else {
        return old.month + (12 - data.month) - 1;
      }
    } else {
      if (data.month < old.month - 1 ||
          data.month == old.month - 1 && data.day <= old.day) {
        if (old.day >= data.day) {
          return old.month - data.month;
        } else {
          return old.month - data.month - 1;
        }
      } else {
        return 0;
      }
    }
  } else {
    if (hoje.month < data.month ||
        (hoje.month == data.month && hoje.day < data.day)) {
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

void printPerson(String cliente) {
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
    persons.update(int.parse(cliente), editPerson(persons, int.parse(cliente)));
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
  print(
      " 9 - Terminar Apólice"); // altera data de fim e mostra valor a devolver
  print("10 - Eliminar Apólice"); // elimina o registo
  print(" 0 - Voltar");
  print("----------------------------------------");
  int opt = int.parse(stdin.readLineSync()!);
  if (opt == 1)
    printSeguradora(insurers.list.keys
        .firstWhere((k) =>
            insurers.list[k] == insurances.list[int.parse(apolice)]?.insurer)
        .toString());
  if (opt == 2)
    printPerson(persons.list.keys
        .firstWhere((k) =>
            persons.list[k] ==
            insurances.list[int.parse(apolice)]?.policyholder)
        .toString());
  if (opt == 3)
    printPerson(persons.list.keys
        .firstWhere((k) =>
            persons.list[k] == insurances.list[int.parse(apolice)]?.insured)
        .toString());
  if ([1, 2, 3].contains(opt)) {
    print("Prima <Enter> para voltar");
    stdin.readLineSync();
    return "";
  }
  if (opt == 4) {
    Person segurado = newPerson();
    insurances.updateInsured(int.parse(apolice), segurado);
  }
  if (opt == 5) {
    switch (insurances.list[int.parse(apolice)]!.insuranceType) {
      case Types.auto:
        insurances.updateAutoInsurance(
            int.parse(apolice),
            editAutoInsurance(
                insurances.list[int.parse(apolice)] as AutoInsurance));
        break;
      case Types.health:
        insurances.updateHealthInsurance(
            int.parse(apolice),
            editHealthInsurance(
                insurances.list[int.parse(apolice)] as HealthInsurance));
        break;
      case Types.housing:
        insurances.updateHousingInsurance(
            int.parse(apolice),
            editHousingInsurance(
                insurances.list[int.parse(apolice)] as HousingInsurance));
        break;
      case Types.work:
        insurances.updateWorkInsurance(
            int.parse(apolice),
            editWorkInsurance(
                insurances.list[int.parse(apolice)] as WorkInsurance));
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
    insurances.transfer(int.parse(apolice), insurers.list[seguradora]!);
  }
  if (opt == 8) {
    insurances.renew(int.parse(apolice));
  }
  if (opt == 9) {
    DateTime novaData = editDate(insurances.list[int.parse(apolice)]!.endDate);
    int mesesDevolucao =
        age(novaData, "month", insurances.list[int.parse(apolice)]!.endDate);
    insurances.updateEndDate(int.parse(apolice), novaData);
    switch (insurances.list[int.parse(apolice)]!.periodicity) {
      case Periodicity.monthly:
        print("Não existe devolução uma vez que a periodicidade é mensal");
        break;
      case Periodicity.semiannual:
        print(
            "Valor a devolver ($mesesDevolucao meses): ${mesesDevolucao * (insurances.list[int.parse(apolice)]!.chargeAmount / 6).roundToDouble()} €");
        break;
      case Periodicity.yearly:
        print(
            "Valor a devolver ($mesesDevolucao meses): ${mesesDevolucao * (insurances.list[int.parse(apolice)]!.chargeAmount / 12).roundToDouble()} €");
        break;
    }
    print('');
    print("Prima <Enter> para voltar ao Menu");
    stdin.readLineSync();
  }
  if (opt == 10) insurances.remove(int.parse(apolice));
  return " ";
}
