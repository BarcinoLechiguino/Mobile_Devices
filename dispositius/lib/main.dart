/*int addition3(int a, int b, int c)
{
  return a + b + c;
}*/

/*dynamic addition3(dynamic a, dynamic b, dynamic c)
{
  return a + b + c;
}*/

sum3(a, b, c)                                        // Functions with an unspecified type will be considered dynamic.
{
  return a + b + c;
}

sum2(a, b)
{
  return a + b;
}

// f(a, b) = a + b
final sum2_v2 = (a, b)
{
  return a + b;
};

final sum2_v3 = (a, b) => a + b;

String exclamation(String msg, [int numExcl = 1, bool yell = false])               // 
{
  if (yell)
  {
    msg = msg.toUpperCase();
  }
  
  return msg + "!" * numExcl;
}

String exclamation2(String msg, {int numExcl = 1, bool yell = false})               // 
{
  if (yell)
  {
    msg = msg.toUpperCase();
  }
  
  return msg + "!" * numExcl;
}

generateMessage(msg)
{
  return()
  {
    print("The message is $msg");
  };
}

makeCounter()
{
  int count = 0;
  return ()
  {
    return ++count;
  };
}

void main()
{
  print("Hello World!");

  dynamic d;

  d = 4;
  print(d);
  d = "hsajasjsjd";
  print(d);
  d = {};
  d = [];

  print(sum3(1, 2, 3));
  print(sum3("a", "b", "c"));

  print(exclamation("yay", 0));
  print(exclamation("Fuck", 2, true));
  print(exclamation2("yay"));
  print(exclamation2("Shit", numExcl: 4, yell: true));
  
  List<int> L = [1, 2, 3, 4, 5];
  L.forEach((e) => print(e));

  var blas = sum2;
  var functions = 
  [
    (a) => a + 1,
    (x) => x * 2,
    (x) => x - 10,

    /*(a)
    {
      return a + 2;
    }*/
  ];

    print(functions[0](10));

    for (var f in functions)
    {
      print(f(10));
    }

    var f = generateMessage("Chirimoya");
    var g = generateMessage("Jamacuco");
    f();
    g();

    var c1 = makeCounter();
    var c2 = makeCounter();

    print(c1());
    print(c1());
    print(c1());
    print(c2());
    print(c2());
}
