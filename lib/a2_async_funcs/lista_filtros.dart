import 'dart:io';

void listar(List<String> itens, Function? filtro) {
  if (filtro != null) {
    itens = filtro(itens);
  }

  for (var item in itens) {
    stdout.write(item + ", ");
  }
}

List<String> filtrarRepetidos(List<String> lista) {
  return lista.toSet().toList();
}

List<String> ordenarAsc(List<String> lista) {
  lista.sort();
  return lista;
}
