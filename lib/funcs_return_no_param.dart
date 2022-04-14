import 'dart:io';

void show() {
  print("funcoes com return sem parametro");

  print(verificarAprovacao());

  print(descontar());
}

String verificarAprovacao() {
  double nota1 = 0;
  double nota2;

  var input = stdin.readLineSync();

  if (input != null) {
    nota1 = double.parse(input);
  }

  nota2 = double.parse(stdin.readLineSync() ?? "0");

  var media = (nota1 + nota2) / 2;

  if (media >= 6) {
    return "aprovado";
  } else {
    return "reprovado";
  }
}

double descontar() {
  double salario;
  double desconto;
  var saldo = .0;

  print("digite o salario: ");
  salario = double.parse(stdin.readLineSync() ?? "0");

  print("digite o desconto: ");
  desconto = double.parse(stdin.readLineSync() ?? "0");

  saldo += salario;

  if (salario > desconto) {
    saldo -= desconto;
  }

  return saldo;
}
