enum Types { auto, health, housing, work }

class Insurer {
  String name;
  List<Types> insuranceTypes;

  Insurer({required this.name, required this.insuranceTypes});

  get insuredAmount => null;

  @override
  String toString() {
    return '$name';
  }
}
