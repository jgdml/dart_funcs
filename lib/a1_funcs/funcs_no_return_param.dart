import 'dart:io';

void show() {
  print("funcoes sem return com parametro");

  verificarAprovacao(5, 6);
  descontar(50, 10);
  calcularValorSkin(2, 4);
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

void calcularValorSkin(int armaId, int raridadeId) {
  int precoBase = 800;

  var raridades = <String>["Comum", "Raro", "Épico", "Lendário"];

  var armas = <String>["Pistola", "Escopeta", "Rifle"];

  print("arma: ${armas[armaId - 1]}");
  print("raridade: ${raridades[raridadeId - 1]}");
  print("preço: ${(armaId + raridadeId) * precoBase}");
}
