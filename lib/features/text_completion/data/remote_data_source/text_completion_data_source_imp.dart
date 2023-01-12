import 'dart:convert';
import 'package:chat_gpt/core/custom_excetion.dart';
import 'package:chat_gpt/core/open_api_core.dart';
import 'package:chat_gpt/features/text_completion/data/models/text_completion_model.dart';
import 'package:chat_gpt/features/text_completion/data/remote_data_source/text_completion_data_source.dart';
import 'package:http/http.dart' as http;

import '../../../global/provider/provider.dart';

//======>> STEP NO : 6

class TextCompletionReomoteDataSourceImp
    implements TextCompletionRemoteDataSource {
  final http.Client httpClient;

  TextCompletionReomoteDataSourceImp({required this.httpClient});

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async {
    final String _endPoint = "completions";

    Map<String, String> rawParams = {
      "model": "text-davinci-003",
      "prompt": query,
    };

    final encodedParams = json.encode(rawParams);

    final response = await httpClient.post(
      Uri.parse(endPoint(_endPoint)),
      body: encodedParams,
      headers: headerBearerOption(OPEN_API_KEY),
    );

    if (response.statusCode == 200) {
      return TextCompletionModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "TExt completion server Exception");
    }
  }
}
