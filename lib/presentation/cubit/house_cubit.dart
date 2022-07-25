import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/domain/entity/suggestion_entity.dart';
import 'package:house_record/domain/entity/user_entity.dart';
import 'package:house_record/domain/usecase/add_house_data.dart';
import 'package:house_record/domain/usecase/add_suggestion.dart';
import 'package:house_record/domain/usecase/add_user.dart';
import 'package:house_record/domain/usecase/get_houses.dart';
import 'package:house_record/domain/usecase/getuser_infirestore.dart';
import 'package:house_record/domain/usecase/login.dart';
import 'package:house_record/domain/usecase/logout.dart';
import 'package:house_record/domain/usecase/register.dart';
import 'package:house_record/domain/usecase/search_payment.dart';
import 'package:house_record/domain/usecase/update_house.dart';

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
    this._updateHouse,
    this._addSuggestion,
    this._getUserInFirestore,
  ) : super(HouseInitial());

  final GetHouses _getHouses;
  final AddHouseData _addHouseData;
  final SearchPayment _searchPayment;
  final LogIn _logIn;
  final LogOut _logOut;
  final AddUser _addUser;
  final Register _register;
  final UpdateHouse _updateHouse;
  final AddSuggestion _addSuggestion;
  final GetUserInFirestore _getUserInFirestore;

  void updateHouse(String uid, HouseRecordEntity house) async {
    await _updateHouse(uid, house);
  }

  void add(HouseRecordEntity house) async {
    await _addHouseData(house);
  }

  void getHouses(String phase) async {
    emit(Loading());
    final houses = _getHouses(phase);
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

  void addSuggestion(SuggestionEntity suggestion) async {
    await _addSuggestion(suggestion);
  }

  Future<UserEntity> getUserInFirestore(String email) async {
    final user = await _getUserInFirestore(email);
    return user;
  }
}
