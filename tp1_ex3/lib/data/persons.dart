import 'package:tp1_ex3/date.dart';
import 'package:tp1_ex3/person.dart';

class Persons {
  Map <int, Person> _persons = <int, Person>{};

  Map <int, Person> get list => _persons;

  void add(Person person) {
    int key = getMaxKey() + 1;
    _persons.addEntries([MapEntry(key,person)]);
  }

  void remove(int key) {
    _persons.removeWhere((k, v) => k == key);
  }
  
  void update(int key, Person person) {
    _persons[key]!.name = person.name;
    _persons[key]!.address = person.address;
    _persons[key]!.city = person.city;
    _persons[key]!.citizenID = person.citizenID;
    _persons[key]!.taxID = person.taxID;
  }

  void updateDate(int key, Date date) {
    _persons[key]!.birthDate = date;
  }

  int getMaxKey(){
    var thevalue=0;

    _persons.keys.forEach((k){
      if(k>thevalue) {
        thevalue = k;
      }
    });

    return thevalue;
  }
}
