
enum Types { auto, health, housing, work }

class Insurer{
  String name;
  List <Types> insuranceTypes;

  Insurer({required this.name, required this.insuranceTypes});

  @override
  String toString() {
    String tipos = '';
    insuranceTypes.forEach((e) { tipos += e.toString(); });
    return '$name ($tipos)';
  }
}