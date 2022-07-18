import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/domain/entity/user_entity.dart';

abstract class Repository {
  Future<void> addHouseData(HouseRecordEntity house);
  Stream<List<HouseRecordEntity>> getHouses();
  Stream<List<HouseRecordEntity>> searchPayment(String address);
  Future<void> logIn(String email, String password);
  Future<void> logOut();
  Future<void> addUser(UserEntity user);
  Future<void> register(String email, String password);
}
