import 'dart:math';

void main()
{
  //List<int> L = [1, 2, 3, 4];
  var L1 = [1, 2, 3, 4];          //var will default to int as all numbers in the list are integers.
  var L2 = [1, 0.2, 3, 0.4];      //var will default to num as the numbers in the list are both integers and doubles.
  var L3 = [null, true, "a", 5];  //var will default to dynamic as the elements of the list have varied types.
  
  List<int> A = [1, 2, 3];
  List B = [1, 2, 3, "asd", true];

  print(A.length);

  A.sort((a, b) => a - b);
  A.forEach((x) => print(x));
  A.forEach(print);
  print(A.map((e) => "[*$e*]"));
  print(A);

  print(A.reduce((a, b) => a + b));
  print(A.reduce((a, b) => max(a, b)));

  List<String> result = A.map((e) => "[*$e*]").toList();
  print(result);

  print(L1);
  print(L2);
  print(L3);
}