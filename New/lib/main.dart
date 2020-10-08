import 'dart:io';
import 'dart:convert';

import 'agent.dart';
import 'point2d.dart';
import 'recipe.dart';

void main()
{
  //var agent = Agent("James", "Bond", 27);

  //var agent = Agent(name: "James", last_name: "Bond", age: 27);
  var agent = Agent("James", "Bond", 27);

  print(agent);
  //print(agent.last_name);

  //printAgent(agent);

  // Dart get/set. Even thought the variables are not accessible, this get/set allows access as though they can be accessed.
  agent.name = "Jose";
  print(agent.name);

  List<int> L = [1, 2, 3];
  print(L.length);
  print(L.isEmpty);

  // Point2D
  var p = Point2D.zero();
  print(p.toString());


  // Recipe
  final f = File('recupes.json');
  final contents = f.readAsStringSync();
  final data = jsonDecode(contents);

  List <Recipe> R = data.map((recipeJson) => );

  print("Haha I wanna sleep, a lot.");
}