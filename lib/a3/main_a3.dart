import 'add_salario.dart';

// Atividade II → Realize as atividades abaixo

//Exercício 1 - faça a chamada do método adicionarSalario validando se o valor é positivo.

//Exercício 2 - refaça o exe anterior, convertendo a named function em anonymous function.

//Exercício 3 - refaça o exe anterior, utilizando a arrow function.

//Exercício 4 - refaça os exe's a, b e c, porém validando se o valor é menor do que o salário.
// 4)a-R: Não é possível ser realizada sem mudar o código da função adicionarSalario

//Exercício 5 - refaça o exe c porém fazendo uma validação sua.

//Exercício 6 - faça 2 exemplos do uso de funções anônimas utilizando a biblioteca do dart.

/*
Exercício 6 - Conseguiu entender:
  - O contexto em que é útil utilizar funções anônimas?
  - Os requisitos necessários para usar funções anônimas? 
  - diferença entre função nomeada e anônimas?
  - diferença entre anonymous function e arrow function?
  Em que caso devemos utilizar Arrow Function? O que devemos considerar?
*/

void init() {
  double salario = 1000;
  double valor = 600;

  // 1
  adicionarSalario(salario, valor, ePositivo);

  // 2
  adicionarSalario(salario, valor, (double numero) {
    if (numero > 0) {
      return true;
    } else {
      return false;
    }
  });

  // 3
  adicionarSalario(
      salario, valor, (double numero) => numero > 0 ? true : false);

  // 4-b
  adicionarSalario(salario, valor, (double valor) {
    return salario > valor ? true : false;
  });

  // 4-c
  adicionarSalario(
      salario, valor, (double valor) => salario > valor ? true : false);

  // 5
  // bonus não pode ser maior que 50% do salairo
  adicionarSalario(
      salario, valor, (double valor) => valor < salario * 0.5 ? true : false);
}
