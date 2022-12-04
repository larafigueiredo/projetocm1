import 'package:tp1_ex3/models/insurance.dart';

//classe de seguro habitacao que herda de apólice
class HousingInsurance extends Insurance {
  //atributos da classe
  String address;
  int roomsCapacity;
  bool garage;
  double houseValuation;
  int constructionYear;
  //construtor
  HousingInsurance(
      {required super.insurer,
      required super.policyholder,
      required super.insured,
      required super.insuranceType,
      required super.insuredAmount,
      required super.periodicity,
      required super.chargeAmount,
      required super.startDate,
      required super.endDate,
      required this.address,
      required this.roomsCapacity,
      required this.garage,
      required this.houseValuation,
      required this.constructionYear});

  String short() {
    return 'Seguro Habitação | ${insurer.name} | ${policyholder.name}';
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
Morada:\t\t$address
Nº Quartos:\t\t$roomsCapacity
Garagem:\t\t$garage
Valor da Habitação:\t$houseValuation
Ano de COnstrução:\t$constructionYear
------ Informação  Financeira ------
Valor Segurado:\t\t$insuredAmount
Periodicidade:\t\t$periodicity
Prémio:\t\t\t$chargeAmount
Inicio:\t\t\t${(startDate)}
Fim:\t\t\t${(endDate)}""");
  }
}
