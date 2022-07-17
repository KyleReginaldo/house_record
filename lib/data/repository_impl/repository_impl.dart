import 'package:house_record/data/datasource/remote_data_source.dart';
import 'package:house_record/data/model/house_record_model.dart';
import 'package:house_record/domain/entity/house_record_entity.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remote;
  RepositoryImpl({
    required this.remote,
  });
  @override
  Future<void> addHouseData(HouseRecordEntity house) async {
    await remote.addHouseData(HouseRecordModel.fromEntity(house));
  }

  @override
  Stream<List<HouseRecordEntity>> getHouses() {
    try {
      final result = remote.getHouses();
      return result;
    } on Exception {
      rethrow;
    }
  }
}
