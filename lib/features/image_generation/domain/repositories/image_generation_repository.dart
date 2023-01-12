import 'package:chat_gpt/features/image_generation/data/model/image_generation_model.dart';

abstract class ImageGenerationRepository {
  Future<ImageGenerationModel> getGeneratedImage(String query);
}
