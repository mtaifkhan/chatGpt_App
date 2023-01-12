import 'package:chat_gpt/features/image_generation/data/remote_data_source/image_generation_data_source.dart';
import 'package:chat_gpt/features/image_generation/data/remote_data_source/image_generation_datasource_impl.dart';
import 'package:chat_gpt/features/image_generation/data/repositories/image_generation_repository_impl.dart';
import 'package:chat_gpt/features/image_generation/domain/repositories/image_generation_repository.dart';
import 'package:chat_gpt/features/image_generation/domain/usecases/image_generation_usercase.dart';
import 'package:chat_gpt/features/image_generation/presentation/cubit/image_generation_cubit.dart';

import '../../injection_container.dart';

Future<void> imageGenerationInjectionContainer() async {
  //Future Bloc or Cubit
  sl.registerFactory<ImageGenerationCubit>(
      () => ImageGenerationCubit(imageGenerationUseCase: sl.call()));

  //useCase
  sl.registerLazySingleton<ImageGenerationUseCase>(
      () => ImageGenerationUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<ImageGenerationRepository>(
      () => ImageGenerationRepositoryImpl(remoteDataSource: sl.call()));

  //remote data
  sl.registerLazySingleton<ImageGenerationDataSource>(
      () => ImageGenerationDataSourceImpl(httpClient: sl.call()));
}
