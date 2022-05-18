import 'package:dart_funcs/a5_teste_unidade/aprovacao_nota.dart';
import 'package:dart_funcs/a5_teste_unidade/aprovacao_presenca.dart';
import 'package:test/test.dart';

void main() {
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
