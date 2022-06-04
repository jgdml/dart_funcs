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

class PhysicsException implements Exception {
  String str;

  PhysicsException(this.str);

  @override
  String toString() {
    return str;
  }
}


class GameObject {
  Position pos;
  Size size;
  int weight;
  int grip;
  Speed speed = Speed.zero;

  GameObject(this.pos, this.size, {this.weight = 10, this.grip = 5});

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

  // função que executa outra função
  // caso uma colisão com outro objeto ocorreu
  void onCollisionWith(GameObject obj, Function() onCollision) {
    if (checkCollision(obj1: this, obj2: obj)) {
      onCollision();
    }
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

  // função que aplica a resistência do ar de maneira básica
  void applyDrag(GameObject obj) {
    var dragCalculation = Speed((1 - ((drag / 100) + (obj.size.y / 1000))), (1 - ((drag / 100) + (obj.size.x / 1000))));
    if (dragCalculation.y.abs() > .99 || dragCalculation.y.abs() > .99){
      throw PhysicsException("Maximum drag amount exceeded");
    }    
    obj.speed.x *= (1 - ((drag / 100) + (obj.size.y / 1000)));
    obj.speed.y *= (1 - ((drag / 100) + (obj.size.x / 1000)));
  }

  void applyGravity(GameObject obj) {
    var gravityCalculation = (gravity + obj.weight) * (1 - (obj.speed.y / 100));
    obj.speed.y -= gravityCalculation;
  }

  // caso a velocidade do objeto seja muito pequena, parar ele
  void verifyStopObject(GameObject obj) {
    if (obj.speed.x.abs() < 0.01) {
      obj.speed.x = 0;
    }
    if (obj.speed.y.abs() < 0.01) {
      obj.speed.y = 0;
    }
  }

  Position moveObjectAccordingToSpeed(GameObject obj) {
    obj.pos.x += (obj.speed.x / 10);
    obj.pos.y += (obj.speed.y / 10);
    return Position(obj.pos.x, obj.pos.y);
  }

  // aplica as funções relacionadas a física
  // passadas por parâmetro e move o objeto
  // essa função seria chamada todo o frame em objetos que tem física
  void physicsOnObject({required GameObject obj, List<Function(GameObject)> physics = const []}) {
    for (var physicsFunction in physics) {
      physicsFunction(obj);
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


// o mainLoop é onde o jogo seria iniciado
void mainLoop() {
  // representando um objeto normal
  var obj1 = GameObject(Position(10, 11), Size(10, 10));

  // esse objeto representa o chão, logo, não terá física
  var ground = GameObject(Position(0, 0), Size(1000, 10), grip: 10);

  // definindo a física global para ser aplicada nos objetos
  var physics = Physics(gravity: 1, drag: 10, wind: 5, windDirection: "left");

  obj1.speed = Speed(100, 0);

  while (true) {
    physics.physicsOnObject(
      obj: obj1,
      physics: [
        physics.applyDrag,
        physics.applyGravity,
        physics.applyWind,
      ],
    );

    obj1.onCollisionWith(ground, () {
      // caso o objeto esteja tocando o chão, além da gravidade, vento e resistência do ar
      // também deverá ser aplicada a fricção entre o chão e o objeto
      physics.physicsOnObject(
        obj: obj1,
        physics: [
          (GameObject obj) {
            var gripCalculation = 1 - (((obj1.grip + ground.grip)) + (obj1.weight / 10)) / 200;

            if (gripCalculation.abs() > .99) {
              throw PhysicsException("Maximum grip amount exceeded");
            }

            obj.speed.x *= gripCalculation;
          }
        ],
      );
    });

    physics.moveObjectAccordingToSpeed(obj1);

    // antes de renderizar o frame verificar se
    // a nova posição do objeto colide com o chão
    obj1.onCollisionWith(ground, () {
      // caso o objeto esteja tocando o chão,
      // ele não pode mais cair
      // e a posição dele será acima do chão
      obj1.speed.y = 0;
      obj1.pos.y = ground.pos.y + ground.size.y;
    });

  }
}
