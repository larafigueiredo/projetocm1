import 'dart:io';

import 'package:tp1_ex3/data/insurers.dart';
import 'package:tp1_ex3/data/persons.dart';
import 'package:tp1_ex3/date.dart';
import 'package:tp1_ex3/insurance.dart';
import 'package:tp1_ex3/insurance_type.dart';
import 'package:tp1_ex3/insurances/auto_insurance.dart';
import 'package:tp1_ex3/insurances/health_insurance.dart';
import 'package:tp1_ex3/insurances/housing_insurance.dart';
import 'package:tp1_ex3/insurances/work_insurance.dart';
import 'package:tp1_ex3/insurer.dart';
import 'package:tp1_ex3/person.dart';

import 'new_person.dart';

Insurance newInsurance(Insurers insurers) {
  Persons persons = Persons();
  var insuranceType;
  var periodicity;

  int opcao = 0;
  insurers.list.forEach((element) {
    print(element);
  });

  while (opcao != 1 && opcao != 2) {
    print("""
    ------------------ :: MENU :: ------------------
    
    Selecione a opção pretendida:

    1 - Adicionar Novo Cliente
    2 - Cliente já existente

    ------------------------------------------------

    Opção : """);

    opcao = int.parse(stdin.readLineSync()!);
  }
  Person customer = newPerson();
  print("Seguradora");
  String seguradora = stdin.readLineSync() ?? "";

  String? opt = "";
  print("O tomador do seguro também é o segurado (y/n) ");
  while (opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n') {
    opt = stdin.readLineSync();
  }
  Person segurado = customer;
  if (opt == 'n') segurado = newPerson();

  int type = 0;

  while (type < 1 || type > 4) {
    print("""
    ------------------ :: MENU :: ------------------
    
    Selecione o tipo de Seguro:

    1 - Seguro Automóvel
    2 - Seguro Habitação
    3 - Seguro Saúde
    4 - Seguro de Trabalho


    ------------------------------------------------

    Opção : """);

    type = int.parse(stdin.readLineSync()!);

    if (type == 1) {
      print("Matrícula");
      String matricula = stdin.readLineSync() ?? "";
      print("Marca");
      String marca = stdin.readLineSync() ?? "";
      print("Modelo");
      String modelo = stdin.readLineSync() ?? "";
      print("Número de lugares");
      int numeroLugares = int.parse(stdin.readLineSync()!);
      print("Ano do Autmóvel");
      int anoAutomovel = int.parse(stdin.readLineSync()!);
      print("Valor do Autmóvel");
      double valorAutomovel = double.parse(stdin.readLineSync()!);
      print("Data da Carta de Condução ");
      print("Dia:  ");
      int dia = int.parse(stdin.readLineSync()!);
      print("Mês: ");
      int mes = int.parse(stdin.readLineSync()!);
      print("Ano: ");
      int ano = int.parse(stdin.readLineSync()!);
      Date dataLicenca = Date(day: dia, month: mes, year: ano);

      insuranceType = AutoInsurance(
        licensePlate: matricula,
        brand: marca,
        model: modelo,
        seatCapacity: numeroLugares,
        carYear: anoAutomovel,
        carValuation: valorAutomovel,
        driverLicenseDate: dataLicenca,
      );
    }

    if (type == 2) {
      print("Morada");
      String morada = stdin.readLineSync() ?? "";
      print("Número de quartos");
      int numeroQuartos = int.parse(stdin.readLineSync()!);
      opt = "";
      print("A casa tem garagem? (y/n) ");
      while (opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n') {
        opt = stdin.readLineSync();
      }
      bool garagem = false;
      if (opt == 'y') garagem = true;

      print("Valor da Habitacao");
      double valorHabitacao = double.parse(stdin.readLineSync()!);
      print("Ano da Construção");
      int anoConstrucao = int.parse(stdin.readLineSync()!);

      insuranceType = HousingInsurance(
          address: morada,
          roomsCapacity: numeroQuartos,
          garage: garagem,
          houseValuation: valorHabitacao,
          constructionYear: anoConstrucao);
    }
    if (type == 3) {
      String text = " ";
      List<String> doencas = [];
      List<String> redesMedicas = [];
      while (text != "") {
        print(
            "Indique doenças associadas (Caso não haja Doenças, para avançar deixe em branco");
        text = stdin.readLineSync() ?? "";
        if (text != "") doencas.add(text);
      }

      text = " ";

      while (text != "") {
        print(
            "Indique as redes médicas associadas (Caso não haja Redes Médicas, para avançar deixe em branco");
        text = stdin.readLineSync() ?? "";
        if (text != "") redesMedicas.add(text);
      }

      insuranceType =
          HealthInsurance(diseases: doencas, medicalNetwork: redesMedicas);
    }

    if (type == 4) {
      print("Nome da Empresa");
      String nomeEmpresa = stdin.readLineSync() ?? "";
      print("Morada");
      String morada = stdin.readLineSync() ?? "";
      print("Tipo de Trabalho");
      String tipoTrabalho = stdin.readLineSync() ?? "";

      insuranceType = WorkInsurance(
          companyName: nomeEmpresa, address: morada, workType: tipoTrabalho);
    }
  }
  print("Indique o valor segurado na Apólice");
  double valorSegurado = double.parse(stdin.readLineSync()!);

  int periodicidade = 0;

  while (periodicidade < 1 || periodicidade > 3) {
    print("""
    ------------------ :: MENU :: ------------------
    
    Selecione a Periodicidade:

    1 - Mensal
    2 - Semi Anual
    3 - Anual
  

    ------------------------------------------------

    Opção : """);

    periodicidade = int.parse(stdin.readLineSync()!);

    if (periodicidade == 1) {
      periodicity = Periodicity.monthly;
    }
    if (periodicidade == 2) {
      periodicity = Periodicity.semiannual;
    }
    if (periodicidade == 3) {
      periodicity = Periodicity.yearly;
    }
  }
  print("Indique o valor a ser cobrado");
  double valorCobrado = double.parse(stdin.readLineSync()!);

  print("Data de Início do Seguro ");
  print("Dia:  ");
  int dia = int.parse(stdin.readLineSync()!);
  print("Mês: ");
  int mes = int.parse(stdin.readLineSync()!);
  print("Ano: ");
  int ano = int.parse(stdin.readLineSync()!);

  Date dataInicio = Date(day: dia, month: mes, year: ano);

  print("Data de Fim do Seguro ");
  print("Dia:  ");
  dia = int.parse(stdin.readLineSync()!);
  print("Mês: ");
  mes = int.parse(stdin.readLineSync()!);
  print("Ano: ");
  ano = int.parse(stdin.readLineSync()!);

  Date dataFim = Date(day: dia, month: mes, year: ano);
  Insurer insurer = insurers.list[0];

  return Insurance(
      insurer: insurer,
      policyholder: customer,
      insured: segurado,
      type: insuranceType,
      insuredAmount: valorSegurado,
      periodicity: periodicity,
      chargeAmount: valorCobrado,
      startDate: dataInicio,
      endDate: dataFim);
}
