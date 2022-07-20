import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/domain/repository/repository.dart';

class UpdateHouse {
  final Repository repo;
  UpdateHouse({
    required this.repo,
  });

  Future<void> call(String uid, HouseRecordEntity house) async {
    await repo.updateHouse(uid, house);
  }
}
