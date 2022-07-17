import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_record/data/model/house_record_model.dart';

abstract class RemoteDataSource {
  Future<void> addHouseData(HouseRecordModel house);
  Stream<List<HouseRecordModel>> getHouses();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<void> addHouseData(HouseRecordModel house) async {
    final docHouse = FirebaseFirestore.instance.collection('houses').doc();
    house.uid = docHouse.id;
    await docHouse.set(house.toMap());
  }

  @override
  Stream<List<HouseRecordModel>> getHouses() {
    return FirebaseFirestore.instance.collection('houses').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => HouseRecordModel.fromMap(doc.data()))
            .toList());
  }
}
