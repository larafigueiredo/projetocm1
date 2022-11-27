import 'package:tp1_ex3/insurer.dart';

class Insurers {
  List<Insurer> _insurers = [];

  List<Insurer> get list => _insurers;

  void add(Insurer insurer) {
    _insurers.add(insurer);
  }
}
