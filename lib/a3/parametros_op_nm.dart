String verificarAprovacao(double nota1, double nota2,
    [double mediaAprovacao = 6]) {
  var media = (nota1 + nota2) / 2;

  return media >= mediaAprovacao ? "Aprovado" : "Reprovado";
}

String verificarAprovacaoPrNm(double nota1, double nota2,
    {double mediaAprovacao = 6}) {
  var media = (nota1 + nota2) / 2;

  return media >= mediaAprovacao ? "Aprovado" : "Reprovado";
}
