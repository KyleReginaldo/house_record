import 'package:house_record/domain/entity/user_entity.dart';
import 'package:house_record/domain/repository/repository.dart';

class AddUser {
  final Repository repo;
  AddUser({
    required this.repo,
  });

  Future<void> call(UserEntity user) async {
    await repo.addUser(user);
  }
}
