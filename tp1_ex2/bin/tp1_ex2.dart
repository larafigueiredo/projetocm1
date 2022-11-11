import 'package:tp1_ex2/tp1_ex2.dart' as tp1_ex2;
import 'dart:math';

void main(List<String> arguments) {
  var random = Random();
  var aleatorio = 90 + random.nextInt(150 - 90);
  var num = 0;
  List<int> numeros = [];
  List<int> impares = [];
  for(var i=0; i < aleatorio; i++){
    num = random.nextInt(1000);
    numeros.add(num);
    (num%2!=0) ? impares.add(num) : '';
  }
  impares.sort((b, a) => a.compareTo(b));
  
  print("O maior numero é ${maior(numeros)} e o menor numero é ${menor(numeros)}");

  print("A amplitude do array é ${amplitude(numeros)}");

  print(imprime(numeros));

  print("Ímpares ordenados:");
  print(imprime(impares));

}

int maior(List<int> numeros){
  var maior = 0;
  for(var i=0; i < numeros.length; i++){
    (numeros[i]>maior) ? maior=numeros[i] : maior=maior;
  }
  return maior;
}

int menor(List<int> numeros){
  var menor = 1001;
  for(var i=0; i < numeros.length; i++){
    (numeros[i]<menor) ? menor=numeros[i] : menor=menor;
  }
  return menor;
}

int amplitude(List<int> numeros){
  var min = menor(numeros);
  var max = maior(numeros);
  return (max-min);
}

String imprime(List<int> numeros){
  var toprint = '';
  for(var i=0; i < numeros.length; i++){
    toprint += '${numeros[i]}';
    toprint += ((i+1)==numeros.length) ? '' : ', ';
  }
  return ('[$toprint]');
}
