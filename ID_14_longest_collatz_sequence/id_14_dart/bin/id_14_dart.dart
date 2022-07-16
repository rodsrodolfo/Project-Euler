import 'package:id_14_dart/id_14_dart.dart' as id_14_dart;

void main(List<String> arguments) {
  List<double> found = [1, len_collatz(1)];
  double collatz;
  for (double i = 2; i < 1000000; i++) {
    collatz = len_collatz(i);
    if (collatz > found[1]) {
      found = [i, collatz];
    }
  }
  print('Number: ${found[0]}');
  print('Length: ${found[1]}');
}

double len_collatz(double num) {
  double len = 1;
  while (num != 1) {
    len += 1;
    if (num % 2 == 0) {
      num = num / 2;
    } else {
      num = 3 * num + 1;
    }
  }
  return len;
}
