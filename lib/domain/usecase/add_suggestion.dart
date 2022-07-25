import 'package:house_record/domain/entity/suggestion_entity.dart';
import 'package:house_record/domain/repository/repository.dart';

class AddSuggestion {
  final Repository repo;
  AddSuggestion({
    required this.repo,
  });

  Future<void> call(SuggestionEntity suggestion) async {
    await repo.addSuggestion(suggestion);
  }
}
