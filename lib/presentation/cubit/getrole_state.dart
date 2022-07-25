part of 'getrole_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class Admin extends UserState {
  final UserEntity user;
  Admin({
    required this.user,
  });
}

class FirestoreUser extends UserState {
  final UserEntity user;
  FirestoreUser({
    required this.user,
  });
}
