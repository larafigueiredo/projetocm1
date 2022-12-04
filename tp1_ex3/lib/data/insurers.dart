import 'package:tp1_ex3/data/insurances.dart';
import 'package:tp1_ex3/exceptions/integrity_exception.dart';
import 'package:tp1_ex3/models/insurer.dart';

class Insurers {
  Map<int, Insurer> _insurers = <int, Insurer>{};

  Map<int, Insurer> get list => _insurers;

  void add(Insurer insurer) {
    int key = getMaxKey() + 1;
    _insurers.addEntries([MapEntry(key, insurer)]);
  }

  void remove(int key, Insurances insurances) {
    if ((insurances.list.values.any((s) => s.insurer == _insurers[key]))){
      throw IntegrityException('data/insurers[_insurers list]');
    }
    
    _insurers.removeWhere((k, v) => k == key);
  }

  void update(int key, String name) {
    _insurers[key]!.name = name;
  }

  void updateTypes(int key, List<Types> types) {
    _insurers[key]!.insuranceTypes = types;
  }

  int getMaxKey() {
    var thevalue = 0;

    _insurers.keys.forEach((k) {
      if (k > thevalue) {
        thevalue = k;
      }
    });

    return thevalue;
  }
}
