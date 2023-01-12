import 'image_genteration_data.dart';

class ImageGenerationModel {
  final num created;
  final List<ImageGenerationData> data;

  ImageGenerationModel({
    required this.created,
    required this.data,
  });

  factory ImageGenerationModel.fromJson(Map<String, dynamic> json) {
    final imageGenerationItem = json["data"] as List;
    final List<ImageGenerationData> imageData = imageGenerationItem
        .map((singleItem) => ImageGenerationData.fromJson(singleItem))
        .toList();

    return ImageGenerationModel(
      created: json['created'],
      data: imageData,
    );
  }
}
