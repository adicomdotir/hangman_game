import 'dart:convert';

import 'package:flutter/widgets.dart';

// Generic mapper function
List<T> mapJsonArrayToList<T>(
  String jsonString,
  T Function(Map<String, dynamic>) fromMap,
) {
  final List<dynamic> jsonArray = json.decode(jsonString);
  return jsonArray.map((json) => fromMap(json)).toList();
}

// Example User model
class User {
  User({
    required this.id,
    required this.name,
    required this.age,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final String name;
  final int age;

  @override
  String toString() => 'User [ID: $id, Name: $name, Age: $age]';
}

void main() {
  // Example JSON string
  const jsonString = '''
  [
    {"id": 1, "name": "Alice", "age": 25},
    {"id": 2, "name": "Bob", "age": 30}
  ]
  ''';

  // Use the generic function to map JSON to a List<User>
  final List<User> userList = mapJsonArrayToList(jsonString, User.fromMap);

  // Print the users
  for (var user in userList) {
    debugPrint(user.toString());
  }
}
