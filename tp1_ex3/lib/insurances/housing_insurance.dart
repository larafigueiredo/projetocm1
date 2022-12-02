import 'package:tp1_ex3/insurance.dart';

class HousingInsurance extends Insurance {
  String address;
  int roomsCapacity;
  bool garage;
  double houseValuation;
  int constructionYear;

  HousingInsurance({
      required super.insurer,
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
}
