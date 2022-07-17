class HouseRecordEntity {
  String uid;
  final String paymentNumber;
  final String date;
  final String ownerName;
  final String amount;
  final String coveredMonth;
  final String address;
  HouseRecordEntity({
    this.uid = '',
    required this.paymentNumber,
    required this.date,
    required this.ownerName,
    required this.amount,
    required this.coveredMonth,
    required this.address,
  });
}
