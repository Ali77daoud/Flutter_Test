import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({int? id, required String userName, required String password})
      : super(id: id, userName: userName, password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': userName,
      'password': password,
    };
  }
}
