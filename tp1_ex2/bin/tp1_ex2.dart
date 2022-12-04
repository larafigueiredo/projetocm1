import 'dart:io';

import 'package:tp1_ex2/tp1_ex2.dart' as tp1_ex2;
import 'dart:math';

void main(List<String> arguments) {
  var random = Random(); // gera valor randomico
  var aleatorio = 90 +
      random.nextInt(
          150 - 90); //gera numero aleatorio dentre o intervalor de [90;150]
  int num, opcao = 0;
  List<int> numeros = []; //lista para armazenar os numeros
  List<int> impares = []; //lista para armazenar os numeros impares

  for (var i = 0; i < aleatorio; i++) {
    num = random.nextInt(1000);
    numeros.add(num);
    (num % 2 != 0) ? impares.add(num) : '';
  }
  impares.sort((b, a) => a.compareTo(b));
  //menu principal
  while (opcao != 9) {
    print("""
    ------------------ :: MENU :: ------------------
    
    Selecione a opção pretendida:

    1 - Mostrar maior e menor elemento do conjunto
    2 - Mostrar amplitude do conjunto
    3 - Listar números ímpares em ordem decrescente
    4 - Mostrar conjunto completo

    9 - Sair

    Opção : """);

    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        print(
            "O maior numero é ${maior(numeros)} e o menor numero é ${menor(numeros)}");
        break;
      case 2:
        print("A amplitude do array é ${amplitude(numeros)}");
        break;
      case 3:
        {
          print("Ímpares ordenados:");
          print(imprime(impares));
        }
        break;
      case 4:
        print(imprime(numeros));
        break;
      case 9:
        break;
      default:
        print("Opção Inválida");
        break;
    }

    if (opcao != 9) {
      print("""
          Clique <Enter> para continuar...""");
      stdin.readLineSync();
    }
  }
}

//metodo que verifica maior numero do conjunto
int maior(List<int> numeros) {
  var maior = 0;
  for (var i = 0; i < numeros.length; i++) {
    (numeros[i] > maior) ? maior = numeros[i] : maior = maior;
  }
  return maior;
}

//metodo que verifica menor numero do conjunto
int menor(List<int> numeros) {
  var menor = 1001;
  for (var i = 0; i < numeros.length; i++) {
    (numeros[i] < menor) ? menor = numeros[i] : menor = menor;
  }
  return menor;
}

//calcula a amplitude
int amplitude(List<int> numeros) {
  var min = menor(numeros);
  var max = maior(numeros);
  return (max - min);
}

String imprime(List<int> numeros) {
  var toprint = '';
  for (var i = 0; i < numeros.length; i++) {
    toprint += '${numeros[i]}';
    toprint += ((i + 1) == numeros.length) ? '' : ', ';
  }
  return ('[$toprint]');
}
