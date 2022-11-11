import 'package:tp1_ex1/tp1_ex1.dart' as tp1_ex1;

void main(List<String> arguments) {
  List<int> primos = [];
  var testprimo = true;
  var soma = 0;
  var total = 0;

  for(var i = 100; i <= 200; i++){
    testprimo = true;
    for(var j = 2; j < i; j++){
      ( i % j == 0) ? testprimo = false : ''; 
    }
    if(testprimo){
      soma+=i; 
      total+=1;
    }
  }

  var media = soma/total;

  print('A soma dos primos no intervalo [100, 200] é: $soma');
  print('A média dos primos no intervalo [100, 200] é: $media');
}
