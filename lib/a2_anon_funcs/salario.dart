String calcSalario(int operacao, double salario, double valor) {
  if (operacao == 1) {
    return bonusSalario(salario, valor).toString();
  } else if (operacao == 2) {
    return descontarSalario(salario, valor).toString();
  } else if (operacao == 3) {
    return bonusEncargosSalario(salario, valor).toString();
  } else {
    return "Operação inválida";
  }
}

double bonusSalario(double salario, double valor) => salario + valor;

double descontarSalario(double salario, double valor) => salario - valor;

double bonusEncargosSalario(double salario, double valor) =>
    salario + valor * 0.9;
