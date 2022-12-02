import 'package:tp1_ex3/insurance.dart';
import 'package:intl/intl.dart';

class AutoInsurance extends Insurance {
  String licensePlate;
  String brand;
  String model;
  int seatCapacity;
  int carYear;
  double carValuation;
  DateTime driverLicenseDate;
  DateFormat formatter = DateFormat('dd/MM/yyyy');

  AutoInsurance({
    required super.insurer,
    required super.policyholder,
    required super.insured,
    required super.insuranceType,
    required super.insuredAmount,
    required super.periodicity,
    required super.chargeAmount,
    required super.startDate,
    required super.endDate,
    required this.licensePlate,
    required this.brand,
    required this.model,
    required this.seatCapacity,
    required this.carYear,
    required this.carValuation,
    required this.driverLicenseDate
  });

  String short() {
    return 'Seguro Auto | ${insurer.name} | ${policyholder.name}';
  }

  @override
  String toString() {
    return("""
--------- Informação Geral ---------
Seguradora:\t\t${insurer.name}
Tomador do Seguro:\t${policyholder.name}
Segurado:\t\t${insured.name}
Tipo Seguro:\t\t$insuranceType
--------- Detalhes Apólice ---------
Matrícula:\t\t$licensePlate
Marca do Carro:\t\t$brand
Modelo do Carro:\t$model
Nº Lugares:\t\t$seatCapacity
Ano do Carro:\t\t$carYear
Valor do Carro:\t\t$carValuation
Data Carta de Condução:\t${formatter.format(driverLicenseDate)}
------ Informação  Financeira ------
Valor Segurado:\t\t$insuredAmount
Periodicidade:\t\t$periodicity
Prémio:\t\t\t$chargeAmount
Inicio:\t\t\t${formatter.format(startDate)}
Fim:\t\t\t${formatter.format(endDate)}""");
  }
}
