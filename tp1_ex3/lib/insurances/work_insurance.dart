import 'package:tp1_ex3/models/insurance.dart';

//classe de seguro de trabalho que herda de apólice
class WorkInsurance extends Insurance {
  //atributos da classe
  String companyName;
  String address;
  String workType;
  //construtor
  WorkInsurance(
      {required super.insurer,
      required super.policyholder,
      required super.insured,
      required super.insuranceType,
      required super.insuredAmount,
      required super.periodicity,
      required super.chargeAmount,
      required super.startDate,
      required super.endDate,
      required this.companyName,
      required this.address,
      required this.workType});

  String short() {
    return 'Seguro de Trabalho | ${insurer.name} | ${policyholder.name}';
  }

  @override
  String toString() {
    return ("""
--------- Informação Geral ---------
Seguradora:\t\t${insurer.name}
Tomador do Seguro:\t${policyholder.name}
Segurado:\t\t${insured.name}
Tipo Seguro:\t\t$insuranceType
--------- Detalhes Apólice ---------
Nome Empresa:\t\t$companyName
Morada:\t\t$address
Tipo Trabalho:\t\t$workType
------ Informação  Financeira ------
Valor Segurado:\t\t$insuredAmount
Periodicidade:\t\t$periodicity
Prémio:\t\t\t$chargeAmount
Inicio:\t\t\t${(startDate)}
Fim:\t\t\t${(endDate)}""");
  }
}
