import 'package:tp1_ex3/insurance.dart';

class WorkInsurance extends Insurance {
  String companyName;
  String address;
  String workType;

  WorkInsurance({
    required super.insurer,
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
    required this.workType
  });
}
