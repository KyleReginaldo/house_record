import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final String email;
  @override
  final String password;
  @override
  final String role;
  UserModel({
    required this.email,
    required this.password,
    required this.role,
  }) : super(
          email: email,
          password: password,
          role: role,
        );
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'] ?? "",
        password: map['password'] ?? '',
        role: map['role']);
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      email: user.email,
      password: user.password,
      role: user.role,
    );
  }
  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
        'role': role,
      };
}
