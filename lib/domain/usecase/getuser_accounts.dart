import 'package:house_record/domain/entity/user_entity.dart';
import 'package:house_record/domain/repository/repository.dart';

class GetUserAccounts {
  final Repository repo;
  GetUserAccounts({
    required this.repo,
  });

  Stream<List<UserEntity>> call() {
    return repo.getUserAccounts();
  }
}
