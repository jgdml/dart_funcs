import 'dart:io';

void init() {
  var obj1 = GameObject(Position(10, 30), Size(10, 10));
  var obj2 = GameObject(Position(20, 15), Size(10, 10));

  var physics = Physics(gravity: 9, drag: 5);

  obj1.speed = Speed(10, 0);

  while (true) {
    physics.physicsOnObject(obj1, [
      physics.applyDrag,
      physics.applyGravity,
    ]);

    var x = obj1.pos.x.toStringAsFixed(2);
    var y = obj1.pos.y.toStringAsFixed(2);

    stdout.write("x: $x | y: $y");
    stdout.write("\tcollided: ${checkCollision(obj1, obj2)}\r");
    sleep(Duration(milliseconds: 100));
  }
}

class Position {
  double x;
  double y;

  Position(this.x, this.y);
}

class Size {
  double x;
  double y;

  Size(this.x, this.y);
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
}

class GameObject {
  Position pos;
  Size size;
  int weight;
  Speed speed = Speed.zero;

  GameObject(this.pos, this.size, {this.weight = 10});

  // calcula a posicao de inicio e fim dos dois eixos
  // ex: se o objeto tem um
  // tamanho 10 no eixo X e estiver na posição 0
  // então o começo desse objeto será na posição -5 e o fim em +5
  CoveredSpace getCoveredPos() {
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

  Physics({this.gravity = 9, this.drag = 20});

  // função que aplica a resistência do ar de maneira basica
  void applyDrag(GameObject obj) {
    obj.speed.x -= drag / 10;
    obj.speed.y -= drag / 10;

    if (obj.speed.x < 0.001) {
      obj.speed.x = 0;
    }
    if (obj.speed.y < 0.001) {
      obj.speed.y = 0;
    }
  }

  void applyGravity(GameObject obj) {
    obj.speed.y -= ((gravity * 5) + obj.weight);
  }

  // aplica todos os elementos físicos definidos
  // essa função seria chamada todo o frame em todos o objetos do jogo
  // ela recebe como parametro uma lista de funções
  void physicsOnObject(GameObject obj, [List<Function(GameObject)> functions = const []]) {
    for (var function in functions) {
      function(obj);
    }
    obj.pos.x += (obj.speed.x / 100);
    obj.pos.y += (obj.speed.y / 100);
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
  }
  if (isBetween(firstObjEnd, secondObjStart, secondObjEnd)) {
    return true;
  }
  return false;
}

bool checkCollision(GameObject obj1, GameObject obj2) {
  var obj1CoveredSpace = obj1.getCoveredPos();
  var obj2CoveredSpace = obj2.getCoveredPos();

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
