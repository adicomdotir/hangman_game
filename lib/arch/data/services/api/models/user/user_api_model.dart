import 'dart:convert';

class UserApiModel {
  UserApiModel({
    required this.firstName,
    required this.lastName,
    required this.id,
  });

  factory UserApiModel.fromMap(Map<String, dynamic> map) {
    return UserApiModel(
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      id: map['id'] as String,
    );
  }

  factory UserApiModel.fromJson(String source) =>
      UserApiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String firstName;
  final String lastName;
  final String id;

  UserApiModel copyWith({
    String? firstName,
    String? lastName,
    String? id,
  }) {
    return UserApiModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'UserApiModel(first_name: $firstName, last_name: $lastName, id: $id)';

  @override
  bool operator ==(covariant UserApiModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.id == id;
  }

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ id.hashCode;
}
