import 'package:tp1_ex1/tp1_ex1.dart' as tp1_ex1;

void main(List<String> arguments) {
  List<int> primos = []; //lista para inserir os numeros primos
  //atributos
  var testprimo = true;
  var soma = 0;
  var total = 0;
  //percorre o intervalo ]100; 200[
  for (var i = 101; i < 200; i++) {
    testprimo = true;
    //verifica se o numero é primo
    for (var j = 2; j < i; j++) {
      (i % j == 0) ? testprimo = false : '';
    }
    if (testprimo) {
      soma += i;
      total += 1;
    }
  }
  //calcula a media dos numeros primos
  var media = soma / total;
  //mostra os resultados das operacoes
  print('A soma dos primos no intervalo ]100, 200[ é: $soma');
  print('A média dos primos no intervalo ]100, 200[ é: $media');
}
