import 'package:trabalhopratico3/insurance_type.dart';

class HousingInsurance extends InsuranceType{
  String address;
  int roomsCapacity;
  bool garage;
  double houseValuation;
  int constructionYear;

  HousingInsurance({
    required this.address, 
    required this.roomsCapacity, 
    required this.garage, 
    required this.houseValuation,
    required this.constructionYear
  });

  
}