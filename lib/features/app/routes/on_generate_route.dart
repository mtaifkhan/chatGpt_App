import 'package:chat_gpt/features/text_completition/presentation/pages/text_completation_page.dart';
import 'package:flutter/material.dart';

import '../../image_generation/presentation/pages/image_generation_page.dart';
import '../app_const/page_const.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        {
          return materilaBuilder(widget: ErrorPage());
        }
      case PageConst.ImageGenerationPage:
        {
          return materilaBuilder(widget: ImageGenerationPage());
        }
      case PageConst.TextCompletationPage:
        {
          return materilaBuilder(widget: TextCompletationPage());
        }

      default:
        return materilaBuilder(widget: ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}

MaterialPageRoute materilaBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
