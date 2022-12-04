import 'package:tp1_ex3/models/insurer.dart';
import 'package:tp1_ex3/models/person.dart';

//enum para o tipo de periodicidade
enum Periodicity { monthly, semiannual, yearly }

//classe apólice
class Insurance {
  //atributos
  Insurer insurer; //seguradora
  Person policyholder; //tomador
  Person insured; //segurado
  double insuredAmount; //valor segurado
  Periodicity periodicity;
  double chargeAmount;
  DateTime startDate;
  DateTime endDate;
  Types insuranceType;
  //construtor
  Insurance({
    required this.insurer,
    required this.policyholder,
    required this.insured,
    required this.insuranceType,
    required this.insuredAmount,
    required this.periodicity,
    required this.chargeAmount,
    required this.startDate,
    required this.endDate,
  });

  @override
  String toString() {
    return '${policyholder.name} (${insurer.name})';
  }
}
