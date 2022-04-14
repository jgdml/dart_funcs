import 'dart:io';

void show() {
  print("funcoes sem return com parametro");

  verificarAprovacao(5, 6);
  descontar(50, 10);
}

void verificarAprovacao(double nota1, double nota2) {
  var media = (nota1 + nota2) / 2;

  if (media >= 6) {
    print("aprovado");
  } else {
    print("reprovado");
  }
}

void descontar(double salario, double desconto) {
  var saldo = .0;

  saldo += salario;

  if (salario > desconto) {
    saldo -= desconto;
  }

  print(saldo);
}
