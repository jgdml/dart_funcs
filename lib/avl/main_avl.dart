import 'dart:io';

void init() {
  var obj1 = GameObject(Position(10, 30), Size(10, 10));
  var obj2 = GameObject(Position(20, 15), Size(10, 10));

  var physics = Physics(gravity: 1, drag: 5, wind: 5, windDirection: "left");
  obj1.speed = Speed(10, 200);

  while (true) {
    physics.physicsOnObject(
      obj: obj1,
      physics: [
        physics.applyDrag,
        physics.applyGravity,
        physics.applyWind,
      ],
    );

    var x = obj1.pos.x.toStringAsFixed(2);
    var y = obj1.pos.y.toStringAsFixed(2);

    stdout.write("x: $x | y: $y");
    stdout.write("\tcollided: ${checkCollision(obj1: obj1, obj2: obj2)}\r");
    sleep(Duration(milliseconds: 100));
  }
}

class Position {
  double x;
  double y;

  Position(this.x, this.y);

  @override
  bool operator ==(Object pos) => pos is Position && pos.x == x && pos.y == y;
}

class Size {
  double x;
  double y;

  Size(this.x, this.y);

  bool get isEmpty => x <= 0 || y <= 0;
}

class Speed {
  double x;
  double y;

  Speed(this.x, this.y);

  static Speed zero = Speed(0, 0);
}

class CoveredSpace {
  Position start;
  Position end;

  CoveredSpace(this.start, this.end);

  @override
  bool operator ==(Object obj) => obj is CoveredSpace && obj.start == start && obj.end == end;
}

class GameException implements Exception {
  String str;

  GameException(this.str);

  @override
  String toString() {
    return str;
  }
}

class GameObject {
  Position pos;
  Size size;
  int weight;
  Speed speed = Speed.zero;

  GameObject(this.pos, this.size, {this.weight = 10});

  // calcula a posicao de inicio e fim dos dois eixos
  // ex: se o objeto tem um tamanho 10 no eixo X e estiver na posição no eixo 0
  // então o começo desse objeto no eixo X será em -5 e o fim em +5
  CoveredSpace getCoveredPos() {
    if (size.isEmpty) {
      throw GameException("The object size cannot be 0 or less");
    }

    var space = CoveredSpace(
      Position(
        pos.x - size.x ~/ 2,
        pos.y - size.y ~/ 2,
      ),
      Position(pos.x + size.x ~/ 2, pos.y + size.y ~/ 2),
    );
    // a primeira posição representa o inicio do objeto nos eixos x e y
    // a segunda representa o final
    return space;
  }
}

class Physics {
  int gravity;
  int drag;
  int wind;
  String windDirection;

  Physics({this.gravity = 9, this.drag = 20, this.wind = 5, this.windDirection = "left"});

  // aplica vento em uma direção específica de acordo com o peso do objeto
  void applyWind(GameObject obj) {
    if (windDirection == "left") {
      obj.speed.x -= (wind) / obj.weight;
    } else if (windDirection == "right") {
      obj.speed.x += (wind) / obj.weight;
    }
  }

  // função que aplica a resistência do ar de maneira basica
  void applyDrag(GameObject obj) {
    obj.speed.x -= drag / 100;
    obj.speed.y -= drag / 100;
  }

  void applyGravity(GameObject obj) {
    obj.speed.y -= (gravity + obj.weight) * ((obj.speed.y/100)+1);
  }

  // aplica as funções relacionadas a física
  // passadas por parâmetro e move o objeto
  // essa função seria chamada todo o frame em objetos que tem física
  void physicsOnObject({required GameObject obj, List<Function(GameObject)> physics = const []}) {
    for (var physicsFunction in physics) {
      physicsFunction(obj);
    }
    obj.pos.x += (obj.speed.x / 10);
    obj.pos.y += (obj.speed.y / 10);

    if (obj.speed.x < 0.0001) {
      obj.speed.x = 0;
    }
    if (obj.speed.y < 0.0001) {
      obj.speed.y = 0;
    }
  }
}

// função para facilitar a comparação
bool isBetween(double n, double range1, double range2) {
  return n >= range1 && n <= range2;
}

// checa se há alguma colisão em um eixo
bool checkCollisionInAxis(double firstObjStart, double firstObjEnd, double secondObjStart, double secondObjEnd) {
  if (isBetween(firstObjStart, secondObjStart, secondObjEnd)) {
    return true;
  } else if (isBetween(firstObjEnd, secondObjStart, secondObjEnd)) {
    return true;
  }
  return false;
}

// função que é chamada para checar a colisão
// para haver uma colisão, é necessário haver uma colisão no eixo X e também no Y
bool checkCollision({required GameObject obj1, required GameObject obj2}) {
  CoveredSpace obj1CoveredSpace = obj1.getCoveredPos();
  CoveredSpace obj2CoveredSpace = obj2.getCoveredPos();

  // checa se há uma colisão no eixo X
  bool collidedOnAxisX = checkCollisionInAxis(
    obj1CoveredSpace.start.x,
    obj1CoveredSpace.end.x,
    obj2CoveredSpace.start.x,
    obj2CoveredSpace.end.x,
  );

  // checa se há uma colisão no eixo Y
  bool collidedOnAxisY = checkCollisionInAxis(
    obj1CoveredSpace.start.y,
    obj1CoveredSpace.end.y,
    obj2CoveredSpace.start.y,
    obj2CoveredSpace.end.y,
  );

  return collidedOnAxisX && collidedOnAxisY;
}
