import 'dart:convert';

void show() {
  var pagamentoList = [
    Pagamento("Cartão", 10),
    Pagamento("Boleto", 15),
    Pagamento("Depósito", 20),
  ];
  var cmp = Compra(200);
  cmp.pagamento = pagamentoList[0];
}

class Pagamento {
  String tipo;
  int porcentagemDesconto;

  Pagamento(this.tipo, this.porcentagemDesconto);
}

class Cupom {
  String tipo;
  double desconto;
  DateTime validade;

  Cupom(this.tipo, this.desconto, this.validade);

  static void gerarCupom(String tipo, double desconto, DateTime validade) {
    var codigo = utf8.encode("$tipo,$desconto,$validade");
    print(codigo);
    print(utf8.decode(codigo));
  }

  static bool validarCupom(Cupom cupom) {
    if (cupom.validade.difference(DateTime.now()).isNegative) {
      return false;
    }
    return true;
  }
}

class Compra {
  Pagamento? pagamento;
  List<Cupom>? cupons;
  double precoTotal = 0;

  Compra(this.precoTotal);

  void _calcularDescontoPagamento() {
    precoTotal * (pagamento!.porcentagemDesconto / 100);
  }

  void _calcularCupons() {}
}
