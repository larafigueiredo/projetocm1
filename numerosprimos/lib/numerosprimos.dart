import 'dart:io';

//metodo para verificar se o numero é primo
bool ePrimo(int n) {
  if (n < 2) return false;
  for (var i = 2; i < n; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

//main principal
void main() {
  //atributos
  int i;
  int soma = 0;
  int somaMedia = 0;
  double media = 0;

  //for para percorrer o intervalo pretendido
  for (i = 101; i < 200; i++) {
    if (ePrimo(i) == true) {
      //mostra os números primos existentes no intervalo
      print((i));
      soma += i;
      somaMedia = somaMedia + 1;
    }
  }
  media = (soma / somaMedia);

  //imprime os resultados das operacoes
  print('A soma dos números primos é $soma');
  print('A média dos números primos é $media');
}
