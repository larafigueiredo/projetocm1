import 'dart:io';

import 'package:tp1_ex3/data/insurers.dart';
import 'package:tp1_ex3/data/persons.dart';
import 'package:tp1_ex3/insurance.dart';
import 'package:tp1_ex3/insurances/auto_insurance.dart';
import 'package:tp1_ex3/insurances/health_insurance.dart';
import 'package:tp1_ex3/insurances/housing_insurance.dart';
import 'package:tp1_ex3/insurances/work_insurance.dart';
import 'package:tp1_ex3/insurer.dart';
import 'package:tp1_ex3/person.dart';

import 'new_person.dart';

Insurance newInsurance(Insurers insurers, Persons persons) {
  var periodicity;
  var customer;
  var insurer;
  int opcao = 0;
  String seguradoras = "";
  Types tipoSeguro = Types.auto;

  while (opcao != 1 && opcao != 2) {
    print("""
    ------------------------------------------------
    
    Selecione a opção pretendida:

    1 - Adicionar Novo Cliente
    2 - Cliente já existente

    ------------------------------------------------""");

    opcao = int.parse(stdin.readLineSync()!);
  }
  if (opcao == 1){
    customer = newPerson();
    persons.add(customer);
  }
  else{
    String clientes = "";
    //Apenas mostra as seguradoras com o tipo de seguro escolhido
    persons.list.forEach((key, element) {
      clientes += '$key - ${element.short()}\n';
    });

  print("""
------------------------------------------------
    
Escolha o Cliente:

$clientes
------------------------------------------------""");
    int cliente = int.parse(stdin.readLineSync()!);
    customer = persons.list[cliente];

  }

  String? opt = "";
  print("O tomador do seguro também é o segurado (y/n) ");
  while (opt!.toLowerCase() != 'y' && opt.toLowerCase() != 'n') {
    opt = stdin.readLineSync();
  }
  Person segurado = customer;
  if (opt == 'n'){
    segurado = newPerson();
    persons.add(segurado);
  } 

  int type = 0;

  while (type < 1 || type > 4) {
    print("""
    ------------------------------------------------
    
    Selecione o tipo de Seguro:

    1 - Seguro Automóvel
    2 - Seguro Habitação
    3 - Seguro Saúde
    4 - Seguro de Trabalho

    ------------------------------------------------""");
    type = int.parse(stdin.readLineSync()!);
  }

  if(type==1) tipoSeguro = Types.auto;
  if(type==2) tipoSeguro = Types.housing;
  if(type==3) tipoSeguro = Types.health;
  if(type==4) tipoSeguro = Types.work;

  //Apenas mostra as seguradoras com o tipo de seguro escolhido
  insurers.list.forEach((key, element) {
    if(element.insuranceTypes.contains(tipoSeguro)) seguradoras += '$key - $element\n';
  });

  print("""
------------------------------------------------
    
Escolha a Seguradora:

$seguradoras
------------------------------------------------""");
  int seguradora = int.parse(stdin.readLineSync()!);
  insurer = insurers.list[seguradora];

  print("Indique o valor segurado na Apólice");
  double valorSegurado = double.parse(stdin.readLineSync()!);

  int periodicidade = 0;

  while (periodicidade < 1 || periodicidade > 3) {
    print("""
    ------------------------------------------------
    
    Selecione a Periodicidade:

    1 - Mensal
    2 - Semi Anual
    3 - Anual
  
    ------------------------------------------------""");

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

  DateTime dataInicio = DateTime(ano, mes, dia);

  print("Data de Fim do Seguro ");
  print("Dia:  ");
  dia = int.parse(stdin.readLineSync()!);
  print("Mês: ");
  mes = int.parse(stdin.readLineSync()!);
  print("Ano: ");
  ano = int.parse(stdin.readLineSync()!);

  DateTime dataFim = DateTime(ano, mes, dia);

  switch (type){
    case 1:
      print("Matrícula");
      String matricula = stdin.readLineSync() ?? "";
      print("Marca");
      String marca = stdin.readLineSync() ?? "";
      print("Modelo");
      String modelo = stdin.readLineSync() ?? "";
      print("Número de lugares");
      int numeroLugares = int.parse(stdin.readLineSync()!);
      print("Ano do Automóvel");
      int anoAutomovel = int.parse(stdin.readLineSync()!);
      print("Valor do Automóvel");
      double valorAutomovel = double.parse(stdin.readLineSync()!);
      print("Data da Carta de Condução ");
      print("Dia:  ");
      int dia = int.parse(stdin.readLineSync()!);
      print("Mês: ");
      int mes = int.parse(stdin.readLineSync()!);
      print("Ano: ");
      int ano = int.parse(stdin.readLineSync()!);
      DateTime dataLicenca = DateTime(ano, mes, dia);

      return AutoInsurance(
        insurer: insurer,
        policyholder: customer,
        insured: segurado,
        insuranceType: tipoSeguro,
        insuredAmount: valorSegurado,
        periodicity: periodicity,
        chargeAmount: valorCobrado,
        startDate: dataInicio,
        endDate: dataFim,
        licensePlate: matricula,
        brand: marca,
        model: modelo,
        seatCapacity: numeroLugares,
        carYear: anoAutomovel,
        carValuation: valorAutomovel,
        driverLicenseDate: dataLicenca,
      );

    case 2:
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

      return HousingInsurance(
        insurer: insurer,
        policyholder: customer,
        insured: segurado,
        insuranceType: tipoSeguro,
        insuredAmount: valorSegurado,
        periodicity: periodicity,
        chargeAmount: valorCobrado,
        startDate: dataInicio,
        endDate: dataFim,
        address: morada,
        roomsCapacity: numeroQuartos,
        garage: garagem,
        houseValuation: valorHabitacao,
        constructionYear: anoConstrucao
      );
      
    case 3:
      String text = " ";
      List<String> doencas = [];
      List<String> redesMedicas = [];
      while (text != "") {
        print(
            "Indique doenças associadas (Para avançar deixe em branco");
        text = stdin.readLineSync() ?? "";
        if (text != "") doencas.add(text);
      }

      text = " ";

      while (text != "") {
        print(
            "Indique as redes médicas associadas (Para avançar deixe em branco");
        text = stdin.readLineSync() ?? "";
        if (text != "") redesMedicas.add(text);
      }

      return HealthInsurance(
        insurer: insurer,
        policyholder: customer,
        insured: segurado,
        insuranceType: tipoSeguro,
        insuredAmount: valorSegurado,
        periodicity: periodicity,
        chargeAmount: valorCobrado,
        startDate: dataInicio,
        endDate: dataFim,
        diseases: doencas, 
        medicalNetwork: redesMedicas
      );
  
    default:
      print("Nome da Empresa");
      String nomeEmpresa = stdin.readLineSync() ?? "";
      print("Morada");
      String morada = stdin.readLineSync() ?? "";
      print("Tipo de Trabalho");
      String tipoTrabalho = stdin.readLineSync() ?? "";

      return WorkInsurance(
        insurer: insurer,
        policyholder: customer,
        insured: segurado,
        insuranceType: tipoSeguro,
        insuredAmount: valorSegurado,
        periodicity: periodicity,
        chargeAmount: valorCobrado,
        startDate: dataInicio,
        endDate: dataFim,
        companyName: nomeEmpresa, 
        address: morada, 
        workType: tipoTrabalho
      );
  }
  
  
}
