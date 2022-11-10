import 'dart:io';
import 'dart:math';

void main() {
//funcao randomica
  Random rand = new Random();
//define limite max e min
  int min = 90, max = 150;
//Getting range
  int num = min + rand.nextInt(max - min);
  print('$num is in the range of $min and $max');
}
