import 'package:trabalhopratico3/insurance_type.dart';

enum Types {autoInsurance, healthInsurance, housingInsurance, workInsurance }

class Insurer{
  String name;
  List <Types> insuranceTypes;

  Insurer({required this.name, required this.insuranceTypes});
}