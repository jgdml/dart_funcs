import 'dart:io';

void show() {
  print("funcoes com return sem parametro");

  print(verificarAprovacao());

  print(descontar());

  var infoSkin = calcularValorSkin();
  print(infoSkin["arma"]);
  print(infoSkin["raridade"]);
  print(infoSkin["preco"]);
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

Map<String, dynamic> calcularValorSkin() {
  int precoBase = 800;

  var raridades = <String>["Comum", "Raro", "Épico", "Lendário"];

  var armas = <String>["Pistola", "Escopeta", "Rifle"];

  print("raridade id (1-4): ");
  int raridadeId = int.parse(stdin.readLineSync() ?? "0");

  print("arma id (1-3): ");
  int armaId = int.parse(stdin.readLineSync() ?? "0");

  return {
    "arma": armas[armaId - 1],
    "raridade": raridades[raridadeId - 1],
    "preco": (armaId + raridadeId) * precoBase,
  };
}
