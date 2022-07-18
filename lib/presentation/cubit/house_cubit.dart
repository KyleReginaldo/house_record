import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/domain/entity/user_entity.dart';
import 'package:house_record/domain/usecase/add_house_data.dart';
import 'package:house_record/domain/usecase/add_user.dart';
import 'package:house_record/domain/usecase/get_houses.dart';
import 'package:house_record/domain/usecase/login.dart';
import 'package:house_record/domain/usecase/logout.dart';
import 'package:house_record/domain/usecase/register.dart';
import 'package:house_record/domain/usecase/search_payment.dart';

part 'house_state.dart';

class HouseCubit extends Cubit<HouseState> {
  HouseCubit(
    this._getHouses,
    this._addHouseData,
    this._searchPayment,
    this._logIn,
    this._logOut,
    this._addUser,
    this._register,
  ) : super(HouseInitial());

  final GetHouses _getHouses;
  final AddHouseData _addHouseData;
  final SearchPayment _searchPayment;
  final LogIn _logIn;
  final LogOut _logOut;
  final AddUser _addUser;
  final Register _register;

  void add(HouseRecordEntity house) async {
    await _addHouseData(house);
  }

  void getHouses() async {
    emit(Loading());
    final houses = _getHouses();
    houses.listen((event) {
      if (event.isEmpty) {
        emit(Empty());
      } else {
        emit(Loaded(houses: event));
      }
    });
  }

  void searchPayment(String address) async {
    emit(Loading());
    final houses = _searchPayment(address);
    houses.listen((houses) {
      if (houses.isEmpty) {
        emit(Empty());
      } else {
        emit(Loaded(houses: houses));
      }
    });
  }

  void logIn(String email, String password) async {
    await _logIn(email, password);
  }

  void logOut() async {
    await _logOut();
  }

  void addUser(UserEntity user) async {
    await _addUser(user);
  }

  void register(String email, String password) async {
    await _register(email, password);
  }
}
