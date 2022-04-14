import 'dart:io';

void show() {
  print("funcoes com return com parametro");

  print(verificarAprovacao(5, 6));

  print(descontar(50, 10));

  var infoSkin = calcularValorSkin(2, 3);
  print(infoSkin["arma"]);
  print(infoSkin["raridade"]);
  print(infoSkin["preco"]);
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

Map<String, dynamic> calcularValorSkin(int armaId, int raridadeId) {
  int precoBase = 800;

  var raridades = <String>["Comum", "Raro", "Épico", "Lendário"];

  var armas = <String>["Pistola", "Escopeta", "Rifle"];

  return {
    "arma": armas[armaId - 1],
    "raridade": raridades[raridadeId - 1],
    "preco": (armaId + raridadeId) * precoBase,
  };
}
