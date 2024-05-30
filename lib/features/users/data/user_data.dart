import 'package:test_mpp/core/libs.dart';

class UserData {
  final int? id;

  /// Backend creates user without id
  final String position;
  final String firstName;
  final String lastName;

  const UserData({
    required this.id,
    required this.position,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'position': position,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] as int?,
      position: map['position'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);
}
