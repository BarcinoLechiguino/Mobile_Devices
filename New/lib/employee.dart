import 'dart:io';

class Person
{
  String id;
  String name;
  String last_name;
  DateTime birth_date;

  Person(this.id, this.name, this.last_name, this.birth_date);

  void show()
  {
    print("$name $last_name");
  }
}

class Employee extends Person
{
  double salary;
  DateTime hire_date;

  Employee(String id, String name, String last_name, DateTime birthDate, double salary, DateTime hire_date) : super(id, name, last_name, birthDate);

  @override
  void show()
  {
    super.show();
    print("Salary: $salary");
    print("Hire date: $hire_date");
  }
}