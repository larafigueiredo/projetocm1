import 'package:tp1_ex3/insurer.dart';
import 'package:tp1_ex3/person.dart';

import 'date.dart';
import 'insurance_type.dart';

enum Periodicity { monthly, semiannual, yearly }

class Insurance {
  Insurer insurer; //seguradora
  Person policyholder; //tomador
  Person insured; //segurado
  InsuranceType type;
  double insuredAmount; //valor segurado
  Periodicity periodicity;
  double chargeAmount;
  Date startDate;
  Date endDate;

  Insurance({
    required this.insurer,
    required this.policyholder,
    required this.insured,
    required this.type,
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
