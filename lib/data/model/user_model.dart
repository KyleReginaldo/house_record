import '../../domain/entity/user_entity.dart';

class UserModel {
  String uid;
  final String email;
  final String password;
  final bool isAdmin;
  UserModel({
    this.uid = '',
    required this.email,
    required this.password,
    required this.isAdmin,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? "",
      email: map['email'] ?? "",
      password: map['password'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
    );
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
        uid: user.uid,
        email: user.email,
        password: user.password,
        isAdmin: user.isAdmin);
  }
  Map<String, dynamic> toMap() => {
        'uid': uid,
        'email': email,
        'password': password,
        'isAdmin': isAdmin,
      };
}
