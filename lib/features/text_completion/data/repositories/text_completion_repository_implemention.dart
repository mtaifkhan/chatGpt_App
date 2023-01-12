import 'package:chat_gpt/features/text_completion/data/models/text_completion_model.dart';
import 'package:chat_gpt/features/text_completion/domain/repositories/text_completion_repsitory.dart';

import '../remote_data_source/text_completion_data_source.dart';

// Step NO : 4
// we will implemnet it with the contract file.

class TextCompletionRepositoryImpl extends TextCompletionRepository {
  final TextCompletionRemoteDataSource remoteDataSource;

  TextCompletionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async =>
      remoteDataSource.getTextCompletion(query);
}
