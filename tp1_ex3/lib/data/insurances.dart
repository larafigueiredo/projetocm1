import 'package:tp1_ex3/insurance.dart';

class Insurances {
  Map <int, Insurance> _insurances = <int, Insurance>{};

  Map <int, Insurance> get list => _insurances;

  void add(Insurance insurance) {
    int key = getMaxKey() + 1;
    _insurances.addEntries([MapEntry(key,insurance)]);
  }

  int getMaxKey(){
    var thevalue=0;

    _insurances.keys.forEach((k){
      if(k>thevalue) {
        thevalue = k;
      }
    });

    return thevalue;
  }
}
