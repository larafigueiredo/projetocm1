import 'dart:io';

import 'package:tp1_ex3/data/persons.dart';
import 'package:tp1_ex3/date.dart';
import 'package:tp1_ex3/person.dart';

Date editDate(Date date) {
  print("Se deseja alterar o campo, digite o novo valor. Caso contrário clique <Enter>");

  print("Dia: (Atual: ${date.day})");
  String dia = stdin.readLineSync()! + "";
  int day = 0;
  if (dia == "") day = date.day;
  else day = int.parse(dia);

  print("Mês: (Atual: ${date.month})");
  String mes = stdin.readLineSync()! + "";
  int month = 0;
  if (mes == "") month = date.month;
  else month = int.parse(mes);

  print("Ano: (Atual: ${date.month})");
  String ano = stdin.readLineSync()! + "";
  int year = 0;
  if (ano == "") year = date.year;
  else year = int.parse(ano);
  
  return Date(day: day, month: month, year: year);
}
