import 'package:chat_gpt/features/text_completion/data/models/text_completion_model.dart';

// Step NO : 5
abstract class TextCompletionRemoteDataSource {
  Future<TextCompletionModel> getTextCompletion(String query);
}
