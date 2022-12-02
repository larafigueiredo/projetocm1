
enum Types { auto, health, housing, work }

class Insurer{
  String name;
  List <Types> insuranceTypes;

  Insurer({required this.name, required this.insuranceTypes});

  String short() {
    return name;
  }

  @override
  String toString() {
    String tipos = "";
    insuranceTypes.forEach((element) { tipos += element.toString().replaceAll("Types.", " > "); });
    return("""
Seguradora:\t\t$name
Tipos de Seguro:\t$tipos""");
  }
}