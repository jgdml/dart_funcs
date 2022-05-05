import 'dart:io';

void init() {
  var lista = <String>["b", "a", "a", "c", "c"];
  listar(lista, filtro: ordenar, filtroParametro: 'asc');

  listar(lista, filtro: ordenar, filtroParametro: 'desc');

  listar(lista);

  listar(lista, filtro: filtrarRepetidos);
}

// listar itens da lista e opcionalmente aplicar um filtro
// o filtro pode ou nao ter parametros, o parametro é dynamic para dar mais liberdade ao filtro
void listar(List<String> itens, {Function? filtro, dynamic filtroParametro}) {
  if (filtro != null) {
    if (filtroParametro != null) {
      itens = filtro(itens, filtroParametro);
    } else {
      itens = filtro(itens);
    }
  }

  for (var item in itens) {
    stdout.write(item + ", ");
  }
  print("\n");
}

// filtrar todos os itens repetidos da lista
List<String> filtrarRepetidos(List<String> lista) {
  return lista.toSet().toList();
}

// ordenar a lista em ordem crescente ou decrescente
List<String> ordenar(List<String> lista, [String ordem = 'asc']) {
  if (ordem == 'asc') {
    lista.sort();
  } else if (ordem == 'desc') {
    lista.sort();
    lista = List.from(lista.reversed);
  }

  return lista;
}
