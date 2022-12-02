import 'package:tp1_ex3/insurance.dart';

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
}
