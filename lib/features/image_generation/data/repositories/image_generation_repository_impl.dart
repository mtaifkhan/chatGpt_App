import 'package:chat_gpt/features/image_generation/data/model/image_generation_model.dart';
import 'package:chat_gpt/features/image_generation/data/remote_data_source/image_generation_data_source.dart';
import 'package:chat_gpt/features/image_generation/domain/repositories/image_generation_repository.dart';

class ImageGenerationRepositoryImpl implements ImageGenerationRepository {
  final ImageGenerationDataSource remoteDataSource;

  ImageGenerationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ImageGenerationModel> getGeneratedImage(String query) =>
      remoteDataSource.getGeneratedImages(query);
}
