import 'package:tp1_ex3/data/insurances.dart';
import 'package:tp1_ex3/exceptions/integrity_exception.dart';
import 'package:tp1_ex3/exceptions/unexpected_age_exception.dart';
import 'package:tp1_ex3/models/person.dart';

class Persons {
  Map <int, Person> _persons = <int, Person>{};

  Map <int, Person> get list => _persons;

  void add(Person person) {
    int key = getMaxKey() + 1;
    _persons.addEntries([MapEntry(key, person)]);
  }

  void remove(int key, Insurances insurances) {
    if ((insurances.list.values.any((s) => s.policyholder == _persons[key] || s.insured == _persons[key]))){
      throw IntegrityException('data/persons[_person list]');
    }
    _persons.removeWhere((k, v) => k == key);
  }
  
  void update(int key, Person person) {
    _persons[key]!.name = person.name;
    _persons[key]!.address = person.address;
    _persons[key]!.city = person.city;
    _persons[key]!.citizenID = person.citizenID;
    _persons[key]!.taxID = person.taxID;
  }

  void updateDate(int key, DateTime date, Insurances insurances) {
    if ((insurances.list.values.any((s) => s.policyholder == _persons[key] && age(date) < 18))){
      throw UnexpectedAgeException('data/persons[_person list]');
    }

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

  int age(DateTime data) {
    DateTime hoje = DateTime.now();
    if (hoje.month < data.month ||
        (hoje.month == data.month && hoje.day < data.day)) {
      return hoje.year - data.year - 1;
    } else {
      return hoje.year - data.year;
    }
  }
}
