import 'dart:io';
import 'package:chat_gpt/core/http_certificate_manager.dart';
import 'package:chat_gpt/features/app/splash/splash_screen.dart';
import 'package:chat_gpt/features/image_generation/presentation/cubit/image_generation_cubit.dart';
import 'package:chat_gpt/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/app/home/home_page.dart';
import 'features/app/routes/on_generate_route.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // step No : 9
  HttpOverrides.global = MyHttpOverrides();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //=======>>Step nO : 10
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextCompletionCubit>(
          create: (_) => di.sl<TextCompletionCubit>(),
        ),
        BlocProvider<ImageGenerationCubit>(
          create: (_) => di.sl<ImageGenerationCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Chat GPT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: '/',
        routes: {
          "/": (context) {
            return const SplashScreen(
              child: HomePage(),
            );
          }
        },
      ),
    );
  }
}
