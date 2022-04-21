import 'aprovacao.dart';
import 'salario.dart';
import 'lista_filtros.dart';

void init() {
  // print(verificarAprovacao(1, 5.2, 7.8));
  // print(calcSalario(3, 1000, 250));
  var lista = <String>["b", "a", "a", "c", "c"];
  listar(lista, filtrarRepetidos);
}

/*
Atividade I 
1). Qual a diferença entre a 1º e a 2º forma? Na sua opinião, o que melhorou 
e o que piorou?
R: A primeira forma havia apenas uma função com muitas 
responsabilidades diferentes e muita repetição de código, já a nova
 função possui mais separação de responsabilidades, e também tem legibilidade aumentada.

2). O que é e para que serve parâmetros do tipo função? Em que caso utilizamos?
R: parâmetros deixam as funções mais flexíveis, podendo 
serem usadas em mais situações, aumentando a reusabilidade

Atividade II - Defina 3 funções do mesmo contexto e uma interface para estas 
funções
→ função para escolha das funções do Salário 
→ Receber salario e um valor. Bonificar e retornar o valor do salário.
→ Receber salario e um valor. Descontar e retornar o valor do salário.
→ Receber salario e um valor. Neste caso o valor é o bônus que tem encargos de 10%. 
Adicionar o bônus e retornar o valor do salário.

Atividade III
Pensar em um projeto único 
Fazer um exemplo seu
*/
