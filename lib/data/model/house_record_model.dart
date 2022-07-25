import 'package:house_record/domain/entity/house_record_entity.dart';

class HouseRecordModel extends HouseRecordEntity {
  @override
  String uid;
  @override
  final String paymentNumber;
  @override
  final String date;
  @override
  final String ownerName;
  @override
  final String amount;
  @override
  final String coveredMonth;
  @override
  final String address;
  @override
  final String phase;
  HouseRecordModel({
    this.uid = '',
    required this.paymentNumber,
    required this.date,
    required this.ownerName,
    required this.amount,
    required this.coveredMonth,
    required this.address,
    required this.phase,
  }) : super(
          paymentNumber: paymentNumber,
          date: date,
          ownerName: ownerName,
          amount: amount,
          coveredMonth: coveredMonth,
          address: address,
          phase: phase,
        );
  factory HouseRecordModel.fromMap(Map<String, dynamic> map) {
    return HouseRecordModel(
      uid: map['uid'],
      paymentNumber: map['paymentNumber'] ?? "",
      date: map['date'] ?? "",
      ownerName: map['ownerName'] ?? "",
      amount: map['amount'] ?? "",
      coveredMonth: map['coveredMonth'] ?? "",
      address: map['address'],
      phase: map['phase'],
    );
  }
  factory HouseRecordModel.fromEntity(HouseRecordEntity house) {
    return HouseRecordModel(
      uid: house.uid,
      paymentNumber: house.paymentNumber,
      date: house.date,
      ownerName: house.ownerName,
      amount: house.amount,
      coveredMonth: house.coveredMonth,
      address: house.address,
      phase: house.phase,
    );
  }
  Map<String, dynamic> toMap() => {
        'uid': uid,
        'paymentNumber': paymentNumber,
        'date': date,
        'ownerName': ownerName,
        'amount': amount,
        'coveredMonth': coveredMonth,
        'address': address,
        'phase': phase,
      };
}
