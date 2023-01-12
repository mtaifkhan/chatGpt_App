import '../../data/models/text_completion_model.dart';

// Step No 1
// called Contract File that we design
abstract class TextCompletionRepository {
  Future<TextCompletionModel> getTextCompletion(String query);
}
