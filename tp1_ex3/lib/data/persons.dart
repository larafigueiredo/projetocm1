import 'package:tp1_ex3/person.dart';

class Persons {
  List<Person> _persons = [];

  List<Person> get list => _persons;

  void add(Person person) {
    _persons.add(person);
  }
}
