import 'package:chat_gpt/features/text_completion/data/models/text_completion_data.dart';

// STep No : 3
class TextCompletionModel {
  final num created;
  final List<TextCompletaionData> choices;

  TextCompletionModel({required this.created, required this.choices});

  factory TextCompletionModel.fromJson(Map<String, dynamic> json) {
    final textcompletionItem = json['choices'] as List;
    List<TextCompletaionData> choices = textcompletionItem
        .map((singleItem) => TextCompletaionData.fromJson(singleItem))
        .toList();

    return TextCompletionModel(
      created: json["created"],
      choices: choices,
    );
  }
}
