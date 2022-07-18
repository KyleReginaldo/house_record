import 'package:house_record/data/datasource/remote_data_source.dart';
import 'package:house_record/data/model/house_record_model.dart';
import 'package:house_record/data/model/user_model.dart';
import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/domain/entity/user_entity.dart';

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

  @override
  Stream<List<HouseRecordEntity>> searchPayment(String address) {
    try {
      final result = remote.searchPayment(address);
      return result;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> logIn(String email, String password) async {
    await remote.logIn(email, password);
  }

  @override
  Future<void> logOut() async {
    await remote.logOut();
  }

  @override
  Future<void> addUser(UserEntity user) async {
    await remote.addUser(UserModel.fromEntity(user));
  }

  @override
  Future<void> register(String email, String password) async {
    await remote.register(email, password);
  }
}
