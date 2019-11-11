// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  int userId;
  int id;
  String title;
  bool completed;

  Employee({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );
  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
