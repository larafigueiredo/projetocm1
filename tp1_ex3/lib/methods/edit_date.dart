import 'dart:io';


DateTime editDate(DateTime date) {
  print("Se deseja alterar o campo, digite o novo valor. Caso contrário clique <Enter>");

  print("Dia: (Atual: ${date.day})");
  String dia = stdin.readLineSync()!;
  int day = 0;
  if (dia == "") {
    day = date.day;
  } else {
    day = int.parse(dia);
  }

  print("Mês: (Atual: ${date.month})");
  String mes = stdin.readLineSync()!;
  int month = 0;
  if (mes == "") {
    month = date.month;
  } else {
    month = int.parse(mes);
  }

  print("Ano: (Atual: ${date.year})");
  String ano = stdin.readLineSync()!;
  int year = 0;
  if (ano == "") {
    year = date.year;
  } else {
    year = int.parse(ano);
  }
  
  return DateTime(year, month, day);
}
