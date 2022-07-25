import 'package:hive/hive.dart';
import 'package:house_record/domain/entity/suggestion_entity.dart';

part 'suggestion_model.g.dart';

@HiveType(typeId: 0)
class SuggestionModel extends SuggestionEntity {
  @override
  @HiveField(0)
  final String address;
  SuggestionModel({
    required this.address,
  }) : super(address: address);
  factory SuggestionModel.fromEntity(SuggestionEntity entity) {
    return SuggestionModel(address: entity.address);
  }
}
