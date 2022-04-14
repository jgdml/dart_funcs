import 'dart:io';

void show() {
  print("funcoes sem return sem parametro");

  verificarAprovacao();
  descontar();
}

// 2 notas, calcular, media, informar se esta aprovado ou reprovado
void verificarAprovacao() {
  double nota1 = 0;
  double nota2;

  var input = stdin.readLineSync();

  if (input != null) {
    nota1 = double.parse(input);
  }

  nota2 = double.parse(stdin.readLineSync() ?? "0");

  var media = (nota1 + nota2) / 2;

  if (media >= 6) {
    print("aprovado");
  } else {
    print("reprovado");
  }
}

// A1:
// descontar, recebe salario e valor do desconto
// descontar se houver saldo
// informar saldo

void descontar() {
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

  print(saldo);
}

// A2:
// pensar em um projeto unico, grande escopo
// fazer exemplo
// fazer comentarios sobre




