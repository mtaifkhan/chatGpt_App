class TextCompletaionData {
  final String text;
  final int index;
  final String finish_reason;

  TextCompletaionData(
      {required this.text, required this.index, required this.finish_reason});

  factory TextCompletaionData.fromJson(Map<String, dynamic> json) {
    return TextCompletaionData(
        text: json["text"],
        index: json["index"],
        finish_reason: json["finish_reason"]);
  }
}
