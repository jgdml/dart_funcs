void show() {
  verificarAprovacao(10, 5, verificarPelaMedia);

  verificarAprovacao(10, 5, (nota1, nota2) {
    double media = (nota1 + nota2) / 2;
    return media >= 6 ? "Aprovado" : "Reprovado";
  });
}

/*
Qual a diferença entre o outro modo e esse?
R: O outro método é uma solução boa que qualquer programador 
entenderia, porém, este método deixa a função muito mais flexível
e com a sintaxe menos carregada, contudo, criar funções que recebem
outras funções como parâmetro não é muito convêncional.
*/

String verificarAprovacao(double nota1, double nota2, Function func) =>
    func(nota1, nota2);

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
