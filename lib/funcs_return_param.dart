import 'dart:io';

void show() {
  print("funcoes com return com parametro");

  print(verificarAprovacao(5, 6));

  print(descontar(50, 10));
}

String verificarAprovacao(double nota1, double nota2) {
  var media = (nota1 + nota2) / 2;

  if (media >= 6) {
    return "aprovado";
  } else {
    return "reprovado";
  }
}

double descontar(double salario, double desconto) {
  var saldo = .0;

  saldo += salario;

  if (salario > desconto) {
    saldo -= desconto;
  }

  return saldo;
}
