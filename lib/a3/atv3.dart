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

  mostrarSalario(280, 10, salarioAuxiliar);
  mostrarSalario(280, 10, salarioJunior);
  mostrarSalario(280, 10, salarioPleno);
}

void mostrarSalario(int diasTrabalhados, double valorHora,
    double Function(int dias, double valor) calculoSalario) {
  double salario = calculoSalario(diasTrabalhados, valorHora);
  print("R\$${salario.toStringAsFixed(2)}");
}

// auxiliar trabalha 6 horas por dia
double salarioAuxiliar(int dias, double valor) {
  return dias * (valor * 6);
}

// junior trabalha 8 horas por dia e a cada 12 meses trabalhados tem direito a 13 salario
double salarioJunior(int diasTrabalhados, double valorHora) {
  double salarioDia = valorHora * 8;
  // 12 meses são aprox. 250 dias considerando trabalho de 5 dias por semana
  double bonus13 = (diasTrabalhados ~/ 250) * ((21 * salarioDia));
  return (diasTrabalhados * salarioDia) + bonus13;
}

// pleno trabalha 8 horas por dia, recebe 13 salario e ferias remuneradas
double salarioPleno(int diasTrabalhados, double valorHora) {
  double salarioDia = valorHora * 8;
  double bonus13 = (diasTrabalhados ~/ 250) * ((21 * salarioDia));
  // 12 meses são aprox. 250 dias considerando trabalho de 5 dias por semana
  double ferias = (diasTrabalhados ~/ 250) * ((21 * salarioDia) * 1.333);

  return (diasTrabalhados * salarioDia) + bonus13 + ferias;
}

void calcTempo(DateTime data) {
  var diff = DateTime.now().difference(data);
  print("Dias: ${diff.inDays}");
  print("Horas ${diff.inHours}");
  print("Anos: ${(diff.inDays / 365.25).floorToDouble()}");
}

void readNum() {
  print("Insira um número: ");
  int n = int.parse(stdin.readLineSync()!);
  numInfo(n, evenCheck);
  numInfo(n, negativeCheck);
  numInfo(n, primeCheck);
}

void numInfo(int num, Function(int n) operacao) {
  operacao(num);
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
