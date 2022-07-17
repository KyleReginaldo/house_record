import 'package:house_record/domain/entity/house_record_entity.dart';

abstract class Repository {
  Future<void> addHouseData(HouseRecordEntity house);
  Stream<List<HouseRecordEntity>> getHouses();
}
