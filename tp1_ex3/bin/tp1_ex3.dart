import 'dart:io';

import 'package:tp1_ex3/data/insurances.dart';
import 'package:tp1_ex3/data/insurers.dart';
import 'package:tp1_ex3/data/persons.dart';
import 'package:tp1_ex3/exceptions/integrity_exception.dart';
import 'package:tp1_ex3/exceptions/unexpected_age_exception.dart';
import 'package:tp1_ex3/models/insurance.dart';
import 'package:tp1_ex3/insurances/auto_insurance.dart';
import 'package:tp1_ex3/insurances/health_insurance.dart';
import 'package:tp1_ex3/insurances/housing_insurance.dart';
import 'package:tp1_ex3/insurances/work_insurance.dart';
import 'package:tp1_ex3/models/insurer.dart';
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
import 'package:tp1_ex3/models/person.dart';

//Listas de Dados
Insurers insurers = Insurers();
Persons persons = Persons();
Insurances insurances = Insurances();

void main(List<String> arguments) {
  //Variáveis
  int somaApoliceAtiva = 0;
  int somaApoliceInativa = 0;
  int totalApolices = 0;
  double contaSeguradora = 0;
  int conta = 0;
  int opcao = 0;
  double somaValorPremio = 0;
  DateTime hoje = DateTime.now();
  String multiplicador = '';
  double premioAnual = 0;

  //Dummy Data
  Person person1 = Person(
      name: 'António Marques',
      birthDate: DateTime(1994, 2, 24),
      address: 'Rua do Acaso, nº 250, 1ºD',
      city: 'Ovar  ',
      citizenID: 12345678,
      taxID: 987654321);
  persons.add(person1);
  Person person2 = Person(
      name: 'Maria Botelho  ',
      birthDate: DateTime(1970, 12, 4),
      address: 'Rua do Cimo do Alto, nº 3',
      city: 'VN Gaia',
      citizenID: 13344555,
      taxID: 222333444);
  persons.add(person2);
  Person person3 = Person(
      name: 'Bruno Monteiro ',
      birthDate: DateTime(1987, 5, 8),
      address: 'Avenida Primeira, 128, 1A',
      city: 'Porto  ',
      citizenID: 13245689,
      taxID: 222777888);
  persons.add(person3);
  Person person4 = Person(
      name: 'Alice Fonseca  ',
      birthDate: DateTime(2010, 10, 8),
      address: 'Avenida Segunda, 1230, 2B',
      city: 'VN Gaia',
      citizenID: 10101010,
      taxID: 202020202);
  persons.add(person4);
  Person person5 = Person(
      name: 'Jose Fonseca   ',
      birthDate: DateTime(1980, 3, 24),
      address: 'Avenida Segunda, 1230, 2B',
      city: 'VN Gaia',
      citizenID: 12121212,
      taxID: 212121212);
  persons.add(person5);
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
      chargeAmount: 350.52,
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
      insuranceType: Types.auto,
      insuredAmount: 15000,
      periodicity: Periodicity.monthly,
      chargeAmount: 35.52,
      startDate: DateTime(2022, 1, 1),
      endDate: DateTime(2023, 1, 1),
      licensePlate: 'AB-23-CF',
      brand: 'Tesla',
      model: 'Model S',
      seatCapacity: 5,
      carYear: 2021,
      carValuation: 35213.82,
      driverLicenseDate: DateTime(2010, 10, 5)));
  insurances.add(HealthInsurance(insurer: insurer1, policyholder: person5, insured: person4, insuranceType: Types.health, insuredAmount: 1300, periodicity: Periodicity.monthly, chargeAmount: 9.9900, startDate: DateTime(2021, 12, 01), endDate: DateTime(2022, 12, 01), diseases: ['Asma'], medicalNetwork: ['TrofaSaude','SNS']));
  insurances.add(WorkInsurance(insurer: insurer1, policyholder: person5, insured: person2, insuranceType: Types.work, insuredAmount: 9000, periodicity: Periodicity.semiannual, chargeAmount: 24.990, startDate: DateTime(2022, 12, 01), endDate: DateTime(2023, 12, 01), companyName: 'Biscates do Jose', address: 'Rua da Cova do Fundo, nº 10', workType: 'Biscates'));
  insurances.add(WorkInsurance(insurer: insurer1, policyholder: person5, insured: person3, insuranceType: Types.work, insuredAmount: 9000, periodicity: Periodicity.semiannual, chargeAmount: 24.990, startDate: DateTime(2022, 06, 01), endDate: DateTime(2023, 06, 01), companyName: 'Biscates do Jose', address: 'Rua da Cova do Fundo, nº 10', workType: 'Biscates'));
  insurances.add(HealthInsurance(insurer: insurer2, policyholder: person5, insured: person4, insuranceType: Types.health, insuredAmount: 1800, periodicity: Periodicity.monthly, chargeAmount: 7.9900, startDate: DateTime(2022, 12, 01), endDate: DateTime(2023, 12, 01), diseases: ['Asma'], medicalNetwork: ['TrofaSaude','SNS']));
  insurances.add(HealthInsurance(insurer: insurer2, policyholder: person5, insured: person5, insuranceType: Types.health, insuredAmount: 1800, periodicity: Periodicity.monthly, chargeAmount: 7.9900, startDate: DateTime(2022, 12, 01), endDate: DateTime(2023, 12, 01), diseases: ['Asma', 'Stress', 'Diabetes'], medicalNetwork: ['TrofaSaude','SNS']));

  //MENU PRINCIPAL
  while (opcao != 9) {
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
        "| 1 - Adicionar Nova Apólice                                                              |");
    print(
        "| 2 - Adicionar Nova Seguradora                                                           |");
    print(
        "| 3 - Ver Todos Clientes                                                                  |");
    print(
        "| 4 - Ver Todas Seguradoras                                                               |");
    print(
        "| 5 - Ver Todas Apólices                                                                  |");
   print(
        "|--------------------------------------- Relatórios --------------------------------------|");
    print(
        "| 6 - Mostrar Dashboard                                                                   |");
    print(
        "| 7 - Relatório de apólices ativas por tipo de seguro e seguradora                        |");
    print(
        "| 8 - Relatório de entidades                                                              |");
    print(
        "|                                                                                         |");
    print(
        "| 9 - Sair                                                                                |");
    print(
        "|-----------------------------------------------------------------------------------------|\n");

    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        //Adiciona uma nova apólice
        try {
          insurances.add(newInsurance(insurers, persons));
        } on UnexpectedAgeException catch (e) {
          //Valida se o policyholder é maior de idade
          print(e.errorMessage());
        } on Exception {
          print('Other error occured');
        }
        break;
      case 2:
        //Adiciona uma nova seguradora
        insurers.add(newInsurer());
        break;
      case 3:
        //Imprime todos os clientes
        printMap(persons.list, "Clientes");
        String cliente = stdin.readLineSync() ?? "";
        if (cliente != "") {
          //Imprime os detalhes de um determinado cliente
          printPerson(cliente);
        }
        break;
      case 4:
        //Imprime todas as seguradoras
        printMap(insurers.list, "Seguradoras");
        String seguradora = stdin.readLineSync() ?? "";
        if (seguradora != "") {
          //Imprime os detalhes de uma determinada seguradora
          printSeguradora(seguradora);
        }
        break;

      case 5:
        //Imprime todas as apólices
        String apolice = "";
        while (apolice == "") {
          printMap(insurances.list, "Apólices");
          apolice = stdin.readLineSync()!;
          if (apolice != "") {
            //Imprime os detalhes de uma determinada apólice
            apolice = printApolice(apolice);
          }
        }
        break;

      case 6:
        //Dashboard de informações gerais sobre apólices
        somaApoliceAtiva = 0;
        totalApolices = insurances.list.length;  //Conta todas as apólices
        insurances.list.values.forEach((entry) {
          if (hoje.isBefore(entry.endDate)) {
            somaApoliceAtiva = somaApoliceAtiva + 1; //verifica quantas são ativas
          }
        });
        somaApoliceInativa = totalApolices - somaApoliceAtiva;  //o restante será inativo
        print("| Apólices Ativas\t| Apólices Inativas \t| Total Apólices");
        print("---------------------------------------------------------------------");
        print("| $somaApoliceAtiva\t\t\t| $somaApoliceInativa\t\t\t| $totalApolices");
        print("---------------------------------------------------------------------");
        print('');
        print("| Tipo de Seguro\t| Apólices Ativas \t| Média Valor Segurado");
        print("---------------------------------------------------------------------");
        for (var type in [Types.auto, Types.health, Types.housing, Types.work]) {
          //ciclo para cada tipo de seguro
          totalApolices = 0;
          contaSeguradora = 0;
          insurances.list.values.where((v) => v.insuranceType == type).forEach((v) { 
            if (hoje.isBefore(v.endDate)) {
              totalApolices += 1; //calcula o total de apolices ativas do tipo de seguro
              contaSeguradora += v.insuredAmount; // calcula o total de valores assegurados
            }
          });
          print("| ${type.toString().replaceAll("Types.", "")}   \t\t| $totalApolices\t\t\t| ${contaSeguradora/totalApolices}"); //imprime a média dos valores assegurados
        }
        print("---------------------------------------------------------------------");
        print('');
        print("| Seguradora\t\t| Apólices Ativas \t| Média Valor Segurado");
        print("---------------------------------------------------------------------");
        for (var insurer in insurers.list.values) {
          //ciclo para cada seguradora
          totalApolices = 0;
          contaSeguradora = 0;
          insurances.list.values.where((v) => v.insurer == insurer).forEach((v) { 
            if (hoje.isBefore(v.endDate)) {
              totalApolices += 1; //calcula o total de apolices ativas do tipo de seguro
              contaSeguradora += v.insuredAmount; // calcula o total de valores assegurados
            }
          });
          print("| ${insurer.name}   \t\t| $totalApolices\t\t\t| ${contaSeguradora/totalApolices}");
        }
        print("---------------------------------------------------------------------");
        print('');
        print("Prima <Enter> para voltar ao Menu");
        stdin.readLineSync();
        break;
      case 7:
        print('Relatório de apólices ativas por tipo de seguro e seguradora\n');
        for (Insurer seguradora in insurers.list.values){
          for (Types tipo in [Types.auto, Types.health, Types.housing, Types.work]){
            somaValorPremio = 0;
            conta = 0;
            insurances.list.values.where((e) => e.insuranceType == tipo && e.insurer == seguradora && hoje.isBefore(e.endDate)).forEach((entry) {
              conta ++;
              if (conta == 1){
                print("|-----------------------------------------------------------------------|");
                print("                 ${seguradora.name} > ${tipo.toString().replaceAll("Types.", "Seguro ")}                                  ");
                print("|-----------------------------------------------------------------------|");
                print("| Tomador do Seguro\tSegurado\tPrémio\txx\tTotal Anual\t|");
                print("|-----------------------------------------------------------------------|");
              }
              switch (entry.periodicity) {
                case Periodicity.monthly:
                  premioAnual = entry.chargeAmount * 12;
                  multiplicador = "(x12)";
                  break;
                case Periodicity.semiannual:
                  premioAnual = entry.chargeAmount * 2;
                  multiplicador = "(x2)";
                  break;
                case Periodicity.yearly:
                  premioAnual = entry.chargeAmount;
                  multiplicador = "";
                  break;
              }
              somaValorPremio = somaValorPremio + premioAnual;
              print(
                  '| ${(entry.policyholder.name)}\t${(entry.insured.name)}\t${(entry.chargeAmount)} €\t$multiplicador\t$premioAnual €\t|');

            });
            if (conta > 0){
              print("|-----------------------------------------------------------------------|");
              print('| Apólices:\t$conta\t\t\tTOTAL ANUAL:\t$somaValorPremio €\t|');
              print('\n');
            }
          }
        }
        print("Prima <Enter> para voltar ao Menu");
        stdin.readLineSync();
        break;

      case 8:
        //Relatório de todas as entidades com apólices ativas
        print('Entidade\t\tIdade\tMorada \n'
            '-------------------------------------------------------------------------------------------------------------\n');
        persons.list.values.forEach((element) {
          if (insurances.list.values.any((e) => (e.policyholder == element || e.insured == element) && hoje.isBefore(e.endDate))){
            print('${(element.name)}\t\t${(age(element.birthDate))}\t${(element.address)}\t\t');
          }
        });
        print('');
        print("Prima <Enter> para voltar ao Menu");
        stdin.readLineSync();
        break;

      case 9:
        print("Programa Finalizado");
        break;

      default:
        print("Opção Inválida");
        break;
      
      
    }
  }
}


void printMap(Map dataMap, String typeMap) {
  //Método para imprimir os maps
  print('----------- $typeMap -----------\n');
  dataMap.forEach((key, element) {
    print('$key - ${element.short()}');  //O Metodo short é uma versao mais minimalista do toString()
  });
  print("");
  print("Para selecionar, digite o ID. Para voltar, deixe em branco.");
}

//Metodo para calcular idades e diferenças entre meses
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
  //Menu seguradora
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
    //Altera Nome
    print("Nome: (Atual: ${insurers.list[int.parse(seguradora)]!.name})");
    String name = stdin.readLineSync()!;
    insurers.update(int.parse(seguradora), name);
  }
  if (opt == 2) {
    //Altera Tipos de Seguro
    List<Types> types = setTypes();
    insurers.updateTypes(int.parse(seguradora), types);
  }
  
  if (opt == 3) {
    //Remove Seguradora
    try{
      insurers.remove(int.parse(seguradora), insurances);
    } on IntegrityException catch (e, f){
      //Valida se não está associada a nenhuma apólice
      print(e.errorMessage());
      print(f);
    } on Exception {
      print('Other error occured');
    }
  }
}

void printPerson(String cliente) {
  //Menu Entidade (Tomadores e Segurados)
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
    //Edita dados da Pessoa
    persons.update(int.parse(cliente), editPerson(persons, int.parse(cliente)));
  }
  if (opt == 2) {
    //Altera Data de Nascimento
    try {
      persons.updateDate(int.parse(cliente),
          editDate(persons.list[int.parse(cliente)]!.birthDate), insurances);
    } on UnexpectedAgeException catch (e) {
      //Valida se é maior de idade em caso de ser um tomador do seguro (policyholder)
      print(e.errorMessage());
    } on Exception {
      print('Other error occured');
    }

  }
  if (opt == 3){
    //Remove uma Pessoa
    try{
      persons.remove(int.parse(cliente), insurances);
    } on IntegrityException catch (e, f){
      //Valida se não está associada a nenhuma apólice
      print(e.errorMessage());
      print(f);
    } on Exception {
      print('Other error occured');
    }
  } 
}

String printApolice(String apolice) {
  //Menu Apólice
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
  if (opt == 1) {
    //Avança para o menu da Seguradora
    printSeguradora(insurers.list.keys
        .firstWhere((k) =>
            insurers.list[k] == insurances.list[int.parse(apolice)]?.insurer)
        .toString());
  }
  if (opt == 2) {
    //Avança para o menu da Pessoa (Tomador do Seguro)
    printPerson(persons.list.keys
        .firstWhere((k) =>
            persons.list[k] ==
            insurances.list[int.parse(apolice)]?.policyholder)
        .toString());
  }
  if (opt == 3) {
    //Avança para o menu da Pessoa (Segurado)
    printPerson(persons.list.keys
        .firstWhere((k) =>
            persons.list[k] == insurances.list[int.parse(apolice)]?.insured)
        .toString());
  }
  if ([1, 2, 3].contains(opt)) {
    print("Prima <Enter> para voltar");
    stdin.readLineSync();
    return "";
  }
  if (opt == 4) {
    //Altera a pessoa segurada, pedindo informações sobre a nova pessoa segurada
    Person segurado = newPerson();
    insurances.updateInsured(int.parse(apolice), segurado);
  }
  if (opt == 5) {
    //Altera os detalhes da apólice (informação que varia por cada Tipo de Seguro)
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
    //Altera dados Financeiros como periodicidade, prémio ou valor segurado
    insurances.updateFinancial(
        int.parse(apolice), editApoliceFinance(insurances, int.parse(apolice)));
  }
  if (opt == 7) {
    //Transfere para outra seguradora. É mostrada uma lista de todas as seguradoras disponiveis para este seguro.
    printMap(insurers.list, "Seguradoras");
    int seguradora = int.parse(stdin.readLineSync()!);
    insurances.transfer(int.parse(apolice), insurers.list[seguradora]!);
  }
  if (opt == 8) {
    //Adiciona 1 ano à data de término
    insurances.renew(int.parse(apolice));
  }
  if (opt == 9) {
    //O utilizador define uma nova data para o término do seguro, e o programa informa quanto a seguradora tem a devolver ao tomador (varia consoante a periodicidade)
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
