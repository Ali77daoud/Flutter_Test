import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String userName;
  final String password;

  const UserEntity({this.id, required this.userName, required this.password});

  @override
  List<Object?> get props => [id!, userName, password];
}
