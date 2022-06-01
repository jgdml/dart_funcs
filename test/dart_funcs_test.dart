import 'package:dart_funcs/a5_teste_unidade/aprovacao_nota.dart';
import 'package:dart_funcs/a5_teste_unidade/atv_teste.dart';
import 'package:dart_funcs/avl/main_avl.dart';
import 'package:test/test.dart';

void main() {
  group("Teste função getCoveredSpace", () {

    test("Objeto com posição zero", () {
      expect(
        GameObject(Position(0, 0), Size(10, 10)).getCoveredPos(),
        CoveredSpace(
          Position(-5, -5),
          Position(5, 5),
        ),
      );
    });

    test("Objeto com posição positiva", () {
      expect(
        GameObject(Position(5, 5), Size(10, 10)).getCoveredPos(),
        CoveredSpace(
          Position(0, 0),
          Position(10, 10),
        ),
      );
    });

    test("Objeto com posição negativa", () {
      expect(
        GameObject(Position(-5, -5), Size(10, 10)).getCoveredPos(),
        CoveredSpace(
          Position(-10, -10),
          Position(0, 0),
        ),
      );
    });

    test("Objeto com tamanho positivo", () {
      expect(
        GameObject(Position(25, 25), Size(10, 10)).getCoveredPos(),
        CoveredSpace(
          Position(20, 20),
          Position(30, 30),
        ),
      );
    });

    test("Objeto com tamanho zero", () {
      expect(
        () => GameObject(Position(5, 5), Size(0, 0)).getCoveredPos(),
        throwsA(isA<GameException>()),
      );
    });

    test("Objeto com tamanho negativo", () {
      expect(
        () => GameObject(Position(5, 5), Size(-2, -5)).getCoveredPos(),
        throwsA(isA<GameException>()),
      );
    });
  });

  

  ////////////////////////////////////////////
  ////////////////////////////////////////////

  // group("Teste função validar cupom", () {
  //   test("Cupom com data passada", () {
  //     expect(
  //         Cupom.validarCupom(Cupom(
  //           desconto: 5,
  //           tipo: CupomDescontoTipo.fixo,
  //           validade: DateTime.now().subtract(Duration(days: 1)),
  //         )),
  //         false);
  //   });

  //   test("Cupom com data futura", () {
  //     expect(
  //         Cupom.validarCupom(Cupom(
  //           desconto: 5,
  //           tipo: CupomDescontoTipo.fixo,
  //           validade: DateTime.now().add(Duration(days: 1)),
  //         )),
  //         true);
  //   });

  //   test("Cupom sem usos restantes", () {
  //     expect(
  //         Cupom.validarCupom(Cupom(
  //           usos: 0,
  //           desconto: 5,
  //           tipo: CupomDescontoTipo.fixo,
  //           validade: DateTime.now().add(Duration(days: 1)),
  //         )),
  //         false);
  //   });

  //   test("Cupom com usos restantes", () {
  //     expect(
  //         Cupom.validarCupom(Cupom(
  //           usos: 1,
  //           desconto: 5,
  //           tipo: CupomDescontoTipo.fixo,
  //           validade: DateTime.now().add(Duration(days: 1)),
  //         )),
  //         true);
  //   });

  //   test("Cupom com usos ilimitados", () {
  //     expect(
  //         Cupom.validarCupom(Cupom(
  //           desconto: 5,
  //           tipo: CupomDescontoTipo.fixo,
  //           validade: DateTime.now().add(Duration(days: 1)),
  //         )),
  //         true);
  //   });
  //   test("Cupom com uso negativo", () {
  //     expect(
  //         Cupom.validarCupom(Cupom(
  //           usos: -1,
  //           desconto: 5,
  //           tipo: CupomDescontoTipo.fixo,
  //           validade: DateTime.now().add(Duration(days: 1)),
  //         )),
  //         false);
  //   });
  // });

  // ////////////////////////////////////////////
  // ////////////////////////////////////////////

  // group("Teste função calcular desconto bonus", () {
  //   test("Quantidade de cupons suficiente", () {
  //     expect(Compra.calcularBonusDeCupons(3), 2);
  //   });

  //   test("Quantidade de cupons insuficiente", () {
  //     expect(Compra.calcularBonusDeCupons(2), 0);
  //   });

  //   test("Quantidade de cupons perto do proximo valor", () {
  //     expect(Compra.calcularBonusDeCupons(8), 4);
  //   });

  //   test("Sem cupons utilizados", () {
  //     expect(Compra.calcularBonusDeCupons(0), 0);
  //   });

  //   test("Quantidade de cupons negativa", () {
  //     expect(Compra.calcularBonusDeCupons(-1), 0);
  //   });
  // });

  // //////////////

  // group("Teste de cálculo da média", () {
  //   test("Média maior que a média definida", () {
  //     expect(calcularMedia(nota1: 6, nota2: 8), 7);
  //   });
  //   test("Média menor que a média definida", () {
  //     expect(calcularMedia(nota1: 5, nota2: 4), 4.5);
  //   });
  // });

  // group("Validação das notas", () {
  //   test("Notas menores que o necessário", () {
  //     expect(() => validarNota(nota1: -8, nota2: 4), throwsException);
  //   });
  //   test("Notas maiores que o necessário", () {
  //     expect(() => validarNota(nota1: 8, nota2: 10), returnsNormally);
  //   });
  // });
}
