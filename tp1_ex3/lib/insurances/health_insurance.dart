import 'package:trabalhopratico3/insurance_type.dart';

class HealthInsurance extends InsuranceType{
  List <String> diseases;
  List <String> medicalNetwork;

  HealthInsurance({
    required this.diseases,
    required this.medicalNetwork
  });

  
}