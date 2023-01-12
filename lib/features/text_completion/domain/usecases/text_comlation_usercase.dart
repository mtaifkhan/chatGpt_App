import 'package:chat_gpt/features/text_completion/domain/repositories/text_completion_repsitory.dart';

import '../../data/models/text_completion_model.dart';

// Step No : 2
class TextcompletionUseCase {
  final TextCompletionRepository repository;

  TextcompletionUseCase({required this.repository});

  Future<TextCompletionModel> call(String query) async {
    return repository.getTextCompletion(query);
  }
}
