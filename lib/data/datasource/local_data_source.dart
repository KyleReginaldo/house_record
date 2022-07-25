import 'package:hive/hive.dart';
import 'package:house_record/data/model/suggestion_model.dart';

abstract class LocalDataSource {
  Future<void> addSuggestion(SuggestionModel suggestion);
}

class LocalDataSourceImpl implements LocalDataSource {
  final suggestionBox = Hive.box('Suggestions_edited');
  @override
  Future<void> addSuggestion(SuggestionModel suggestion) async {
    await suggestionBox.put(suggestion.address, suggestion);
  }
}
