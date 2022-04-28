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
  // readNum();
}



void readNum() {
  numInfo(int.parse(stdin.readLineSync()!));
}

void numInfo(int num) {
  print(num.isEven ? "$num é par" : "$num é ímpar");
  print(!num.isNegative ? "$num é maior que 0" : "$num é menor que 0");

  for (int i = 1; i < num; i++) {
    // se o numero for divisivel por outro e esse outro não é 1
    if (num % i == 0 && i != 1) {
      print("$num não é número primo");
      break;
    }
    // se for o ultimo loop
    if (i == num - 1) {
      print("$num é número primo");
    }
  }
}
