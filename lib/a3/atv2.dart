// Atividade II → Realize as atividades abaixo

//Exercício 1 - faça a chamada do método adicionarSalario validando se o valor é positivo.

//Exercício 2 - refaça o exe anterior, convertendo a named function em anonymous function.

//Exercício 3 - refaça o exe anterior, utilizando a arrow function.

//Exercício 4 - refaça os exe's a, b e c, porém validando se o valor é menor do que o salário.
// 4)a-R: Não é possível ser realizada sem mudar o código da função adicionarSalario

//Exercício 5 - refaça o exe c porém fazendo uma validação sua.

//Exercício 6 - faça 2 exemplos do uso de funções anônimas utilizando a biblioteca do dart.

/*
Exercício 7 - Conseguiu entender:
  - O contexto em que é útil utilizar funções anônimas?
    Quando é necessário utilizar a funcionalidade de uma função nomeada, porém,
    ela não será reutilizada, logo não precisa de nome.

  - Os requisitos necessários para usar funções anônimas? 
    É necessário passar a função anônima como parâmetro para uma função nomeada.
  
  - Diferença entre função nomeada e anônimas?
    A função nomeada é usada para ser reutilizada em várias partes do código.
    Já a função anônima é mais utilizada para deixar a função nomeada mais flexível, 
    recebendo a função anônima como parâmetro. 

  - Diferença entre anonymous function e arrow function?
    Com a função anônima é possível escrever um bloco de instruções para serem executadas.
    Já com a arrow function é possível passar somente um comando para ser executado.

  - Em que caso devemos utilizar Arrow Function? O que devemos considerar?
    Em casos onde o comando a ser executado é breve, somente de uma linha.
    Por exemplo quando for feito um if ternário ou a chamada de uma função.
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

  // 6 - a
  var lista = [1, 2, 3, 4, 5, 6, 7, 8];

  print(lista.where((n) => n % 2 == 0));

  // 6 - b
  print(lista.reduce((int item, int index) => item * 2));
}

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
