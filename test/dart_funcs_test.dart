import 'package:dart_funcs/a5_teste_unidade/aprovacao_nota.dart';
import 'package:dart_funcs/a5_teste_unidade/atv_teste.dart';
import 'package:test/test.dart';

void main() {
  group("Teste função validar cupom", () {
    test("Cupom com data passada", () {
      expect(
          Cupom.validarCupom(Cupom(
            desconto: 5,
            tipo: CupomDescontoTipo.fixo,
            validade: DateTime.now().subtract(Duration(days: 1)),
          )),
          false);
    });

    test("Cupom com data futura", () {
      expect(
          Cupom.validarCupom(Cupom(
            desconto: 5,
            tipo: CupomDescontoTipo.fixo,
            validade: DateTime.now().add(Duration(days: 1)),
          )),
          true);
    });

    test("Cupom sem usos restantes", () {
      expect(
          Cupom.validarCupom(Cupom(
            usos: 0,
            desconto: 5,
            tipo: CupomDescontoTipo.fixo,
            validade: DateTime.now().add(Duration(days: 1)),
          )),
          false);
    });

    test("Cupom com usos restantes", () {
      expect(
          Cupom.validarCupom(Cupom(
            usos: 1,
            desconto: 5,
            tipo: CupomDescontoTipo.fixo,
            validade: DateTime.now().add(Duration(days: 1)),
          )),
          true);
    });

    test("Cupom com usos ilimitados", () {
      expect(
          Cupom.validarCupom(Cupom(
            desconto: 5,
            tipo: CupomDescontoTipo.fixo,
            validade: DateTime.now().add(Duration(days: 1)),
          )),
          true);
    });
    test("Cupom com uso negativo", () {
      expect(
          Cupom.validarCupom(Cupom(
            usos: -1,
            desconto: 5,
            tipo: CupomDescontoTipo.fixo,
            validade: DateTime.now().add(Duration(days: 1)),
          )),
          false);
    });
  });

  group("Teste função calcular desconto bonus", () {

    test("Quantidade de cupons suficiente", () {
      expect(Compra.calcularBonusDeCupons(3), 2);
    });

    test("Quantidade de cupons insuficiente", () {
      expect(Compra.calcularBonusDeCupons(2), 0);
    });

    test("Quantidade de cupons perto do proximo valor", () {
      expect(Compra.calcularBonusDeCupons(8), 4);
    });

    test("Sem cupons utilizados", () {
      expect(Compra.calcularBonusDeCupons(0), 0);
    });

    test("Quantidade de cupons negativa", () {
      expect(Compra.calcularBonusDeCupons(-1), 0);
    });
  });


  //////////////


  group("Teste de cálculo da média", () {
    test("Média maior que a média definida", () {
      expect(calcularMedia(nota1: 6, nota2: 8), 7);
    });
    test("Média menor que a média definida", () {
      expect(calcularMedia(nota1: 5, nota2: 4), 4.5);
    });
  });

  group("Validação das notas", () {
    test("Notas menores que o necessário", () {
      expect(() => validarNota(nota1: -8, nota2: 4), throwsException);
    });
    test("Notas maiores que o necessário", () {
      expect(() => validarNota(nota1: 8, nota2: 10), returnsNormally);
    });
  });
}
