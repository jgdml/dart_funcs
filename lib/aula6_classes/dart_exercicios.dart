import 'dart:io';

void init() {
  // var str = stdin.readLineSync()!;
  // var obj = MyClass(str, false);
  // print(obj.str);

  var s1 = State(name: "s1", uf: "ss");

  var c1 = City(name: "c1", state: s1);

  var obj2 = Student(
    name: "abc",
    yearBorn: 1999,
    ra: 1290813,
    city: c1,
  );

  print(obj2);
}

class State {
  String name;
  String uf;

  State({required this.name, required this.uf});
}

class City {
  String name;
  State state;

  City({required this.name, required this.state});
}

class Student extends Person {
  int ra;
  Student({
    required String name,
    required int yearBorn,
    required City city,
    required this.ra,
  }) : super(name: name, yearBorn: yearBorn, city: city);
}

class Teacher extends Person {
  int siape;
  Teacher({
    required String name,
    required int yearBorn,
    required City city,
    required this.siape,
  }) : super(name: name, yearBorn: yearBorn, city: city);
}

class Person {
  String name;
  City city;

  // defina um atributo ano de nascimento e idade
  // fazer validação
  int yearBorn;

  // parâmetros nomeados
  Person({required this.name, required this.yearBorn, required this.city});

  int? get age {
    var currentYear = DateTime.now().year;
    if (yearBorn > 0 && yearBorn < currentYear) {
      return DateTime.now().year - yearBorn;
    }
  }
}

class MyClass {
  // variável privada
  String _str;
  // variável que será inicializada mais tarde
  late int n;
  // variáveis const e final são otimizadas
  final bool? valid;

  // getters e setter
  // é mais rápido não utilizar eles e
  // somente fazerem atributos públicos
  String get str => _str;
  set str(String str) => _str = str;

  MyClass(this._str, this.valid);
}

// algumas vezes é necessário criar classes pequenas que serão utilizadas somente em uma classe maior
// nesse caso pode se ter mais de uma classe em um arquivo e a classe deve ser privada
// o escopo do privado em uma classe em dart é em arquivo
class _PrivateClass {
  _PrivateClass() {
    print("classe privada");
  }
}
