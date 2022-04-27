void adicionarSalario(
    double salario, double valor, Function(double valor) validacao) {
  final eValido = validacao(valor);
  if (eValido) {
    final total = salario + valor;
    print(total);
  }
}

bool ePositivo(double numero) {
  if (numero > 0) {
    return true;
  } else {
    return false;
  }
}

bool eMenor(double n1, double n2) => n2 > n1 ? true : false;
