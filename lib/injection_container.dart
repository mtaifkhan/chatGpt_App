import 'package:chat_gpt/features/image_generation/image_generation_injection_container.dart';
import 'package:chat_gpt/features/text_completion/textcompletion_dependencies_injection_container.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

//globally create instance
final sl = GetIt.instance;

Future<void> init() async {
  //object creation
  final http.Client httpClient = http.Client();

  sl.registerLazySingleton<http.Client>(() => httpClient);

  await textCompletionInjectionContainer();
  await imageGenerationInjectionContainer();
}
