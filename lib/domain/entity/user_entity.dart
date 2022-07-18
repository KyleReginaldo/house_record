class UserEntity {
  String uid;
  final String email;
  final String password;
  final bool isAdmin;
  UserEntity({
    this.uid = '',
    required this.email,
    required this.password,
    required this.isAdmin,
  });
}
