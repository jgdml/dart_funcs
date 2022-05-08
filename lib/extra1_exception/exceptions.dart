void init() {
/*
O que é e para que serve tratamento de erros?
R: O tratamento de erros serve para previnir
que erros façam o programa parar de funcionar.

Quais são as formas de tratamentos de erros?
R: As linguagens de programação oferecem palavras-chave para tratamento de erros.
A sintaxe tem uma leve variação dependendo da linguagem, 
mas geralmente temos o try, catch e opcionalmente o finally:
try {
  codigo que pode gerar exceção;
}
catch (TipoDaExecao ex){
  caso a exceção aconteça, executar este código;
}
finally{
  após a exceção, executar esse código, independente do resultado;
}


Qual a difereça entre erro e exceção? 
R: Exceções são eventos que podem acontecer mas geralmente não acontecem, 
por exemplo, tentar fazer uma requisição mas a API estar offline, esse tipo de exceção pode ser tratada. 
Já Erros se tratam de eventos causados por um código escrito de forma errada.


Qual a diferença entre excessão implícita (contornável) e explícita (incontornável)? 
R: Exceções implícitas são exceções que não necessitam de tratamento, 
fazerm parte da classe Error, ou seja são causadas por código incorreto.
Exceções explícitas devem ser tratadas, elas se origina da classe Exception.


O que são: (1) throwables; (2) Checked Exception; e (3) Unchecked (Runtime)?
R: Throwables se refere as classe filhas da classe Throwable, como Exception e Error.
Checked exceptions são exceções que precisam de tratamento e o tratamento é possível de ser realizado.
Já Unchecked exceptions são exceções fatais onde o programa não pode continuar caso elas aconteçerem.



Quais são os tratamentos de erros existentes no dart?
R: É possível utilizar as palavras chave: try, on para capturar um erro específico, 
catch para capturar qualquer erro e finally.
Em algumas funções também é possível utilizar o catchError, 
que recebe uma função para o tratamento de erro.
funcao().catchError((ex) => print(ex));


Quais são as principais excessões existentes no dart?
R: Algumas exceções comuns são:
FormatException (é chamada quando um dado não possui o formato esperado),
IOException (chamada para erros relacionados a biblioteca de entrada e saída) e
IntegerDivisionByZeroException.


O que é para que serve o bloco try-catch? O que é e como utilizamos o objeto de exceção? O que é e como utilizamos o objeto Stack trace?
R: O try catch é o modo comum para se tratar exceções. 
O objeto de exceção é a instância da classe feita para representar uma exceção, ele possui métodos e atributos.
StackTrace é uma lista de métodos que forma chamados antes da exceção ocorrer, ele serve para facilitar a identificação da exceção.


Explique e exemplifique o uso das cláusulas on e finally no bloco try-cath.
try{
  código que pode produzir exceção;
}
on ExcecaoEspecifica catch (ex){
  código para tratar a exceção específica;
  é possível utilizar o objeto ex nesse bloco;
}
catch (ex){
  código para tratar qualquer exceção que ocorra;
  é possível utilizar o objeto ex nesse bloco;
}
finally{
  código executado ao final do tratamento;
}

*/
// Implemente o try-catch (com relevância) em nas funções do seu projeto.
try{
  print(calcularValorSkin(2, 2));
}
on RangeError catch(e){
  print("Valor inválido");
}


// É possível criar exceções específicas? Se sim, em que caso podem ser utilizas?
// R: Podem ser criadas exceções customizadas de domínio para facilitar as validações.

// analise o seu projeto e crie exceções específicas que facilite a localizção e a manutenção do projeto.

try{
  print(calcularValorSkin(0, 2));
}
on ItemNaoExiste catch (e){
  print(e);
}

}

class ItemNaoExiste{
  String _msg;

  ItemNaoExiste(this._msg);

  @override
  String toString() => _msg;
}

Map<String, dynamic> calcularValorSkin(int armaId, int raridadeId) {
  int precoBase = 800;

  var raridades = <String>["Comum", "Raro", "Épico", "Lendário"];

  var armas = <String>["Pistola", "Escopeta", "Rifle"];

  if (armaId > armas.length || armaId - 1 < 0){
    throw ItemNaoExiste("A arma escolhida não existe");
  }

  if (raridadeId > raridades.length || raridadeId - 1 < 0){
    throw ItemNaoExiste("A raridade escolhida não existe");
  }
  

  return {
    "arma": armas[armaId - 1],
    "raridade": raridades[raridadeId - 1],
    "preco": (armaId + raridadeId) * precoBase,
  };
}
