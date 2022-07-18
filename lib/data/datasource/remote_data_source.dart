import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_record/data/model/house_record_model.dart';
import 'package:house_record/data/model/user_model.dart';

abstract class RemoteDataSource {
  Future<void> addHouseData(HouseRecordModel house);
  Stream<List<HouseRecordModel>> getHouses();
  Stream<List<HouseRecordModel>> searchPayment(String address);
  Future<void> logIn(String email, String password);
  Future<void> logOut();
  Future<void> addUser(UserModel user);
  Future<void> register(String email, String password);
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
    return FirebaseFirestore.instance
        .collection('houses')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => HouseRecordModel.fromMap(doc.data()))
            .toList());
  }

  @override
  Stream<List<HouseRecordModel>> searchPayment(String address) {
    return FirebaseFirestore.instance
        .collection('houses')
        .where('address',
            isGreaterThanOrEqualTo: address.toLowerCase(),
            isLessThan: '${address.toLowerCase()}z')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => HouseRecordModel.fromMap(doc.data()))
            .toList());
  }

  @override
  Future<void> logIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> addUser(UserModel user) async {
    final userDoc = FirebaseFirestore.instance.collection('users').doc();
    user.uid = userDoc.id;
    await userDoc.set(user.toMap());
  }

  @override
  Future<void> register(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
