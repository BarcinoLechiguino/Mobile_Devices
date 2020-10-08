class Point2D
{
  double x;
  double y;

  Point2D(this.x, this.y);
  Point2D.zero() : x = 0, y = 0;

  Point2D.xaxis(this.x) : y = 0;

  @override
  String toString() => "($x, $y)";
}