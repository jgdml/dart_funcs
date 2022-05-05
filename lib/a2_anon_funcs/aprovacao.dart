// aprovacao por media
// aprovacao por maior nota
// aprovacao por menor nota

String verificarAprovacao(int tipo, double nota1, double nota2) {
  if (tipo == 1) {
    return verificarPelaMedia(nota1, nota2);
  } else if (tipo == 2) {
    return verificarPelaMaiorNota(nota1, nota2);
  } else if (tipo == 3) {
    return verificarPelaMenorNota(nota1, nota2);
  } else {
    return "Tipo de operação inválido";
  }
}

String verificarPelaMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  return media >= 6 ? "Aprovado" : "Reprovado";
}

String verificarPelaMaiorNota(double nota1, double nota2) {
  double maior = nota1 > nota2 ? nota1 : nota2;
  return maior >= 6 ? "Aprovado" : "Reprovado";
}

String verificarPelaMenorNota(double nota1, double nota2) {
  double menor = nota1 < nota2 ? nota1 : nota2;
  return menor >= 6 ? "Aprovado" : "Reprovado";
}
