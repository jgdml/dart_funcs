void init() {
  print(checkCollision(
    GameObject(Position(10, 5), Size(10, 10)),
    GameObject(Position(20, 15), Size(10, 10)),
  ));
}

class Position {
  int x;
  int y;

  Position(this.x, this.y);
}

class Size {
  int x;
  int y;

  Size(this.x, this.y);
}

class GameObject {
  Position pos;
  Size size;

  GameObject(this.pos, this.size);

  List<Position> getCoveredPos() {
    List<Position> posXY = [
      Position(pos.x - size.x ~/ 2, pos.y - size.y ~/ 2),
      Position(pos.x + size.x ~/ 2, pos.y + size.y ~/ 2),
    ];
    return posXY;
  }
}

bool checkCollision(GameObject obj1, GameObject obj2) {
  var obj1CoveredPosition = obj1.getCoveredPos();
  var obj2CoveredPosition = obj2.getCoveredPos();

  bool collidedOnAxisX = checkCollisionInAxis(
    obj1CoveredPosition[0].x,
    obj1CoveredPosition[1].x,
    obj2CoveredPosition[0].x,
    obj2CoveredPosition[1].x,
  );
  bool collidedOnAxisY = checkCollisionInAxis(
    obj1CoveredPosition[0].y,
    obj1CoveredPosition[1].y,
    obj2CoveredPosition[0].y,
    obj2CoveredPosition[1].y,
  );

  if (collidedOnAxisX && collidedOnAxisY) return true;
  return false;
}

bool checkCollisionInAxis(int firstObjStart, int firstObjEnd, int secondObjStart, int secondObjEnd) {
  if (isBetween(firstObjStart, secondObjStart, secondObjEnd)) {
    return true;
  }
  if (isBetween(firstObjEnd, secondObjStart, secondObjEnd)) {
    return true;
  }
  return false;
}

bool isBetween(int n, int range1, int range2) {
  return n >= range1 && n <= range2;
}
