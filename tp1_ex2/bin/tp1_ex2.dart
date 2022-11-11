import 'dart:io';

import 'package:tp1_ex2/tp1_ex2.dart' as tp1_ex2;
import 'dart:math';

void main(List<String> arguments) {
  var random = Random();
  var aleatorio = 90 + random.nextInt(150 - 90);
  int num, opcao = 0;
  List<int> numeros = [];
  List<int> impares = [];
  for(var i=0; i < aleatorio; i++){
    num = random.nextInt(1000);
    numeros.add(num);
    (num%2!=0) ? impares.add(num) : '';
  }
  impares.sort((b, a) => a.compareTo(b));
  while(opcao!=9){
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
    
    if(opcao==1){
      print("O maior numero é ${maior(numeros)} e o menor numero é ${menor(numeros)}");
    } 
    if(opcao==2){
      print("A amplitude do array é ${amplitude(numeros)}");
    }
    if(opcao==3){
      print("Ímpares ordenados:");
      print(imprime(impares));
    }
    if(opcao==4){
      print(imprime(numeros));
    }
    if(![1,2,3,4].contains(opcao)){
      print("Opção Inválida");
    }
    print("""
          Clique <Enter> para continuar...""");
    stdin.readLineSync();
  }
  

  

  

  

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
