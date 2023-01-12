import 'package:chat_gpt/features/image_generation/data/model/image_generation_model.dart';

abstract class ImageGenerationDataSource {
  Future<ImageGenerationModel> getGeneratedImages(String query);
}
