import 'package:chat_gpt/features/text_completion/data/remote_data_source/text_completion_data_source.dart';
import 'package:chat_gpt/features/text_completion/data/remote_data_source/text_completion_data_source_imp.dart';
import 'package:chat_gpt/features/text_completion/data/repositories/text_completion_repository_implemention.dart';
import 'package:chat_gpt/features/text_completion/domain/repositories/text_completion_repsitory.dart';
import 'package:chat_gpt/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'package:chat_gpt/injection_container.dart';
import 'domain/usecases/text_comlation_usercase.dart';

//STEP NO : 7

Future<void> textCompletionInjectionContainer() async {
  //Future Bloc or Cubit
  sl.registerFactory<TextCompletionCubit>(
      () => TextCompletionCubit(textcompletionUseCase: sl.call()));

  //useCase
  sl.registerLazySingleton<TextcompletionUseCase>(
      () => TextcompletionUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<TextCompletionRepository>(
      () => TextCompletionRepositoryImpl(remoteDataSource: sl.call()));

  //remote data
  sl.registerLazySingleton<TextCompletionRemoteDataSource>(
      () => TextCompletionReomoteDataSourceImp(httpClient: sl.call()));
}
