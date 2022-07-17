import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:house_record/domain/entity/house_record_entity.dart';
import 'package:house_record/domain/usecase/add_house_data.dart';
import 'package:house_record/domain/usecase/get_houses.dart';

part 'house_state.dart';

class HouseCubit extends Cubit<HouseState> {
  HouseCubit(
    this._getHouses,
    this._addHouseData,
  ) : super(HouseInitial());

  final GetHouses _getHouses;
  final AddHouseData _addHouseData;

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
}
