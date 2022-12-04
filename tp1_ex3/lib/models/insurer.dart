enum Types { auto, health, housing, work } //tipos de seguros

//classe seguradora
class Insurer {
  String name;
  List<Types> insuranceTypes; //lista com tipos de seguros
  //construtor
  Insurer({required this.name, required this.insuranceTypes});

  get insuredAmount => null;

  String short() {
    return name;
  }

  @override
  String toString() {
    String tipos = "";
    insuranceTypes.forEach((element) {
      tipos += element.toString().replaceAll("Types.", " > ");
    });
    return ("""
Seguradora:\t\t$name
Tipos de Seguro:\t$tipos""");
  }
}
