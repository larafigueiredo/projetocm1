import 'package:tp1_ex3/insurer.dart';

class Insurers {
  Map <int, Insurer> _insurers = <int, Insurer>{};

  Map <int, Insurer> get list => _insurers;

  void add(Insurer insurer) {
    int key = getMaxKey() + 1;
    _insurers.addEntries([MapEntry(key,insurer)]);
  }

  int getMaxKey(){
    var thevalue=0;

    _insurers.keys.forEach((k){
      if(k>thevalue) {
        thevalue = k;
      }
    });

    return thevalue;
  }


}
