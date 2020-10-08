// If we declare anything (field, class, function, const...)
// which starts with "_" it will be private to THIS FILE.

class Agent
{
  //String name;
  //String last_name;
  int age;

  String _name;
  String _last_name;

  /*List<String> missions;
  List<String> weapons;*/

  /*List<String> missions = [];   //Always initialize to this value.
  List<String> weapons = [];*/

  List<String> _missions;   //Always initialize to this value.
  List<String> _weapons;

  /*Agent(String name, String last_name, int age)
  {
    this.name = name;
    this.last_name = last_name;
    this.age = age;
  }*/

  /*Agent(this.name, this.last_name, this.age)
  {
    missions = [];
    weapons = [];
  }*/

  /*Agent(this.name, this.last_name, [this.age = 27])   // [] For optional parameters.
  {
    missions = [];
    weapons = [];
  }*/

  //Agent({this.name, this.last_name, this.age}) : missions = [], weapons = [];
  Agent(this._name, this._last_name, this.age) : _missions = [], _weapons = [];

  /*void addMission(String mission)
  {
    missions.add(mission);
  }

  void equipWeapon(String weapon)
  {
    weapons.add(weapon);
  }
  */

  /*void addMission(String mission)
  {
    _missions.add(_Mission(mission));
  }*/

  int numMissions() => _missions.length;

  // Classic get/set
  String _getName() => _name;
  void setName(String name) => _name = name;

  // Dart get/set
  String get name => _name;
  void set name(String name) => _name = name;

  printAgent(Agent a) { print("Agent{$a._name}, {$a._last_name}, {$a.age}"); }
}
