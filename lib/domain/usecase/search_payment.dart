import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/domain/repository/repository.dart';

class SearchPayment {
  final Repository repo;
  SearchPayment({
    required this.repo,
  });

  Stream<List<HouseRecordEntity>> call(String address) {
    return repo.searchPayment(address);
  }
}
