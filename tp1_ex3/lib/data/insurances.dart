import 'package:tp1_ex3/insurance.dart';

class Insurances {
  List<Insurance> _insurances = [];

  List<Insurance> get list => _insurances;

  void add(Insurance insurance) {
    _insurances.add(insurance);
  }
}
