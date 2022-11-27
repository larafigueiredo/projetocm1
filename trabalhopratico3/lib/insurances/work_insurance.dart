import 'package:tp1_ex3/insurance_type.dart';

class WorkInsurance extends InsuranceType {
  String companyName;
  String address;
  String workType;

  WorkInsurance(
      {required this.companyName,
      required this.address,
      required this.workType});
}
