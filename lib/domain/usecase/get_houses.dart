import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/domain/repository/repository.dart';

class GetHouses {
  final Repository repo;
  GetHouses({
    required this.repo,
  });

  Stream<List<HouseRecordEntity>> call() {
    return repo.getHouses();
  }
}
