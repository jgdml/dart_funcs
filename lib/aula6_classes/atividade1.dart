/*
1)Para atribuir um valor em um atributo, qual a diferença em: 
(i) atribuir um valor no atributo na  definição da classe; e 
(ii) solicitar o seu valor via parâmetro do construtor?

Ao solicitar os valores no construtor, caso os valores 
forem obrigatórios será necessário passar eles, porém quando os valores do objeto 
ainda serão definidos, com a entrada do usuário por exemplo, 
não será possível utilizar o construtor no começo do código, será necessário criar
variáveis para salvar os dados e somente no fim passar essas variáveis 
como parâmetros para o construtor.


2)O que é para que ser construtor? Qual código pode-se definir nele?
O construtor serve para criar uma instância de um objeto.
Nele é possível definir parâmetros, para que quando o objeto for instânciado, ele já possua valores definidos.
Também é possível dar mais funcionalidades para ele, como executar outras funções, pois ele é um bloco de comando.

3)Para que serve "final"? Em que caso utilizamos? Para coletar dados, qual a vantagem e desvantagem?
A palavra-chave final serve para impedir a alteração do valora de uma variável.
É útil quando precisamos definir variáveis constantes, e também possui uma vantagem no desempenho.
Por conta disso, quando possível vale a pena utilizar o final.
Também existe a palavra-chave const que faz o mesmo porém a variável é definida a tempo de compilação, 
então resultados de funções por exemplo não podem ser utilizados como valores

4) Crie e instancie as classes abaixo. Para cada atributo, atribua valores, altere os valores e imprima-os.
    * → obrigatório
    = valor (valor padrão)
    ? pode ser nulo
  Caso não esteja implícito, de acordo com o contexto, defina se os atributos podem ser nulos ou não e se podem ser privado ou não. 
  a) Bola{cor=branco,tamanho=7, categoria?}
  b) Professor{ id, nome, cpf, e-mail} >> inicialize todos os atributos no contrutor
  c) Aluno{ ra, nome, cpf, telefone} >> com todos os atributos final, inicialize todos os 
  atributos no contrutor utilizando parâmetros nomeados
  d) Peça{código, nome, descrição, preço de custo} 
    → get nome e descição, get preço de venda (30% sobre o preço de custo)
    → set código - somente números positivos 
    → set preço de custo - somente valore positivos
  e) Carro{nome, ano fabricação} 
    → get tempo de uso, get nome e ano fabricação
    → set ano fabricação - somente ano positivo e coerente
  f) Cidade{nome,Estado{nome,sigla}}
  g) Funcionario{nome, cpf, telefone, Cidade{nome,Estado{nome,sigla}}}
  h) Peca{nome,Tipo{nome,Categoria{nome, descirção}},Unidade de Medida{sigla, descricao}, Fabricante{nome,Cidade{nome,Estado{nome,sigla}} }}
  i) Faça 4 classes do seu estudo de caso utilizando tudo que aprendeu hoje.
*/

void init() {}

class Jogador {
  String nome;
  int vida;
  Arma arma;
  Efeito efeito;

  Jogador({required this.nome, this.vida = 100, required this.arma, this.efeito = Efeito.nenhum});
}

class Arma {
  String tipo;
  late int _municao;
  late int _cadencia;
  Bala bala;

  set municao(int m) => m > -1 ? _municao = m : null;
  set cadencia(int c) => c > -1 ? _cadencia = c : null;

  Arma({required int municao, required int cadencia, required this.tipo, required this.bala}) {
    this.municao = municao;
    this.cadencia = cadencia;
  }
}

class Bala {
  String tipo;
  int dano;

  Bala({required this.tipo, required this.dano});
}

class Efeito {
  String nome;
  Function aplicarEfeito;

  Efeito({required this.nome, required this.aplicarEfeito});

  static get nenhum => Efeito(nome: "", aplicarEfeito: () => null);
}

class Bola {
  String cor;
  int tamanho;
  String? categoria;

  Bola({this.cor = "branco", this.tamanho = 7, this.categoria});
}

class Professor {
  int _id;
  String nome;
  String cpf;
  String? email;

  Professor(this._id, this.nome, this.cpf, [this.email]);
}

class Aluno {
  final String ra;
  final String nome;
  final String cpf;
  final String telefone;

  Aluno({
    required this.ra,
    required this.nome,
    required this.cpf,
    required this.telefone,
  });
}

class Peca {
  late int _codigo;
  String _nome;
  String _descricao;
  late double _precoCusto;

  String get nome => _nome;
  String get descricao => _descricao;
  double get precoVenda => _precoCusto * 1.3;
  set codigo(int i) => i > 0 ? _codigo = i : print("código inválido");
  set precoCusto(double valor) => valor > 0 ? precoCusto = valor : print("código inválido");

  Peca(int codigo, this._nome, this._descricao, double precoCusto) {
    this.codigo = codigo;
    this.precoCusto = precoCusto;
  }
}

class Carro {
  String _nome;
  late int _anoFabricacao;

  Carro(this._nome, int anoFabricacao) {
    this.anoFabricacao = anoFabricacao;
  }

  String get nome => _nome;
  int get anoFabricacao => _anoFabricacao;
  int get tempoUso => DateTime.now().year - _anoFabricacao;

  set anoFabricacao(int ano) {
    if (ano > 1700 && ano < DateTime.now().year + 10) {
      _anoFabricacao = ano;
    }
  }
}

class Estado {
  String nome;
  String sigla;

  Estado({required this.nome, required this.sigla});
}

class Cidade {
  String nome;
  Estado estado;

  Cidade({required this.nome, required this.estado});
}

class Funcionario {
  String nome;
  String cpf;
  String telefone;
  Cidade cidade;

  Funcionario({
    required this.nome,
    required this.cpf,
    required this.cidade,
    required this.telefone,
  });
}

// Peca{nome,Tipo{nome,Categoria{nome, descirção}},Unidade de Medida{sigla, descricao},
// Fabricante{nome,Cidade{nome,Estado{nome,sigla}} }}

class Peca2 {
  String nome;
  Tipo tipo;
  UnidadeMedida unidadeMedida;
  Fabricante fabricante;

  Peca2({
    required this.nome,
    required this.tipo,
    required this.unidadeMedida,
    required this.fabricante,
  });
}

class Tipo {
  String nome;
  Categoria categoria;

  Tipo({required this.nome, required this.categoria});
}

class Categoria {
  String nome;
  String descricao;

  Categoria({required this.nome, required this.descricao});
}

class UnidadeMedida {
  String sigla;
  String descricao;

  UnidadeMedida({required this.sigla, required this.descricao});
}

class Fabricante {
  String nome;
  Cidade cidade;

  Fabricante({required this.nome, required this.cidade});
}
