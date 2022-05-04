import 'dart:io';

/*
Exercício 01 - implemente as funções
a) Função que solicite um número e realizar validações: 
(1) se é par; (2) maior que zero; (3) se é um número primo. 
função "hospedeira" : solicitar um número

b) Função que solicite a data inicial e retorne quanto tempo passou em: (1) anos; (2) dias; e (3) horas.
c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salarário para: (1) auxiliar; (2) júnior; e (3) pleno.
Exercício 02 - para cada função "hospedeira", defina uma função anônima.
*/

void init() {
  readNum();

  calcTempo(DateTime(2019, 12, 1, 0));
}

void readNum() {
  int n = int.parse(stdin.readLineSync()!);
  numInfo(n, evenCheck);
  numInfo(n, negativeCheck);
  numInfo(n, primeCheck);
}

void calcTempo(DateTime data) {
  var diff = DateTime.now().difference(data);
  print("Dias: ${diff.inDays}");
  print("Horas ${diff.inHours}");
  print("Anos: ${(diff.inDays / 365.25).floorToDouble()}");
}

void evenCheck(int n) {
  print(n.isEven ? "$n é par" : "$n é ímpar");
}

void negativeCheck(int n) {
  print(!n.isNegative ? "$n é maior que 0" : "$n é menor que 0");
}

void primeCheck(int n) {
  for (int i = 1; i < n; i++) {
    // se o numero for divisivel por outro e esse outro não é 1
    if (n % i == 0 && i != 1) {
      print("$n não é número primo");
      break;
    }
    // se for o ultimo loop
    if (i == n - 1) {
      print("$n é número primo");
    }
  }
}

void numInfo(int num, Function(int n) operacao) {
  operacao(num);
}
