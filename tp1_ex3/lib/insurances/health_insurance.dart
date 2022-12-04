import 'package:tp1_ex3/models/insurance.dart';

//classe de seguro saude que herda de apólice
class HealthInsurance extends Insurance {
  //lista para armazenas doencas
  List<String> diseases;
  //lista para armazenar rede medica
  List<String> medicalNetwork;
  //construtor
  HealthInsurance(
      {required super.insurer,
      required super.policyholder,
      required super.insured,
      required super.insuranceType,
      required super.insuredAmount,
      required super.periodicity,
      required super.chargeAmount,
      required super.startDate,
      required super.endDate,
      required this.diseases,
      required this.medicalNetwork});

  String short() {
    return 'Seguro de Saude | ${insurer.name} | ${policyholder.name}';
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
Doenças:\t\t$diseases
Rede Médica:\t\t$medicalNetwork
------ Informação  Financeira ------
Valor Segurado:\t\t$insuredAmount
Periodicidade:\t\t$periodicity
Prémio:\t\t\t$chargeAmount
Inicio:\t\t\t${(startDate)}
Fim:\t\t\t${(endDate)}""");
  }
}
