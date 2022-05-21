void show() {
  var cmp = Compra(200, "Cartão");

  cmp.cupons.add(Cupom(
    desconto: 5,
    usos: 100,
    tipo: CupomDescontoTipo.fixo,
    validade: DateTime(2023, 01, 01),
  ));
  cmp.cupons.add(Cupom(
    desconto: 10,
    usos: 100,
    tipo: CupomDescontoTipo.porcentagem,
    validade: DateTime(2023, 01, 01),
  ));
  cmp.cupons.add(Cupom(
    desconto: 25,
    usos: 100,
    tipo: CupomDescontoTipo.fixo,
    validade: DateTime(2023, 12, 25),
  ));

  cmp.finalizarCompra();
}

enum CupomDescontoTipo {
  fixo,
  porcentagem,
}

class Cupom {
  CupomDescontoTipo tipo;
  double desconto;
  DateTime validade;
  int? usos;

  Cupom({required this.tipo, required this.desconto, required this.validade, this.usos});

  static bool validarCupom(Cupom cupom) {
    bool validadeValida = !cupom.validade.difference(DateTime.now()).isNegative;
    bool restaUsos = (cupom.usos ?? 1) > 0 ;
    if (validadeValida && restaUsos) {
      return true;
    }
    return false;
  }
}

class Compra {
  List<Cupom> cupons = [];
  String pagamento;
  double precoTotal = 0;

  Compra(this.precoTotal, this.pagamento);

  void _calcularDescontoPagamento() {
    var pagamentoList = <String, int>{
      "Cartão": 5,
      "Boleto": 15,
      "Depósito": 20,
    };
    print("\nTipo do Pagamento: \n$pagamento: ${pagamentoList[pagamento]}%");
    precoTotal *= 1 - (pagamentoList[pagamento]! / 100);
  }

  void _calcularCupons() {
    double novoPreco = precoTotal;

    print("\nCupons: ");

    for (Cupom c in cupons) {
      if (Cupom.validarCupom(c)) {
        if (c.tipo == CupomDescontoTipo.fixo) {
          novoPreco -= c.desconto;
          print("R\$${c.desconto.toStringAsFixed(2)}");
        } else if (c.tipo == CupomDescontoTipo.porcentagem) {
          novoPreco *= 1 - (c.desconto / 100);
          print("-${c.desconto.toInt()}%");
        }
      } else {
        print("Cupom Inválido");
      }
    }

    if (novoPreco < precoTotal / 2) {
      print("Os cupons não podem reduzir mais do que metade do preço, remova alguns cupons e tente novamente.");
    } else {
      precoTotal = novoPreco;
    }
  }

  static int calcularBonusDeCupons(int qntdCupons) {
    int descontoBonus = 0;
    descontoBonus = 2 * (qntdCupons ~/ 3);
    
    return descontoBonus;
  }

  void finalizarCompra() {
    _calcularDescontoPagamento();
    _calcularCupons();
    
    int porcentagemDescontoBonus = calcularBonusDeCupons(cupons.length);
    precoTotal -= (precoTotal * (porcentagemDescontoBonus / 100));
    print("\nDesconto bonus: $porcentagemDescontoBonus%");

    print("\nTotal: R\$${precoTotal.toStringAsFixed(2)}");
  }
}