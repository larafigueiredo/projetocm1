import 'package:tp1_ex3/models/insurance.dart';

class HealthInsurance extends Insurance {
  List<String> diseases;
  List<String> medicalNetwork;

  HealthInsurance({
      required super.insurer,
      required super.policyholder,
      required super.insured,
      required super.insuranceType,
      required super.insuredAmount,
      required super.periodicity,
      required super.chargeAmount,
      required super.startDate,
      required super.endDate,
      required this.diseases, 
      required this.medicalNetwork
    });
  
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
