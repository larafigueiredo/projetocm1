import 'package:tp1_ex3/date.dart';
import 'package:tp1_ex3/insurance_type.dart';

class AutoInsurance extends InsuranceType {
  String licensePlate;
  String brand;
  String model;
  int seatCapacity;
  int carYear;
  double carValuation;
  Date driverLicenseDate;

  AutoInsurance(
      {required this.licensePlate,
      required this.brand,
      required this.model,
      required this.seatCapacity,
      required this.carYear,
      required this.carValuation,
      required this.driverLicenseDate});
}
