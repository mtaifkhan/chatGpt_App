import 'package:chat_gpt/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../global/search_text_field/search_text_field_widget.dart';

class TextCompletationPage extends StatefulWidget {
  const TextCompletationPage({super.key});

  @override
  State<TextCompletationPage> createState() => _TextCompletationPageState();
}

class _TextCompletationPageState extends State<TextCompletationPage> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    _searchTextController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text completion Page"),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<TextCompletionCubit, TextCompletionState>(
                  builder: (context, textCompletionState) {
                    if (textCompletionState is TextCompletionLoading) {
                      return Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            "assets/images/loading.gif",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                    if (textCompletionState is TextCompletionLoaded) {
                      final choicesData =
                          textCompletionState.textCompletionModel.choices;
                      return ListView.builder(
                        itemCount: choicesData.length,
                        itemBuilder: (context, index) {
                          final textData = choicesData[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    textData.text,
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                  const SizedBox(
                                    height: 30.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Share.share(textData.text);
                                        },
                                        child: const Icon(
                                          Icons.share,
                                          size: 35,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(
                                              text: textData.text));
                                        },
                                        child: const Icon(
                                          Icons.copy,
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
                      child: Text(
                        "OpenAI Text Completion",
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              SearchTextFieldWidget(
                textEditingController: _searchTextController,
                onTap: () {
                  BlocProvider.of<TextCompletionCubit>(context)
                      .textCompletion(query: _searchTextController.text)
                      .then((value) => _clearTextField());
                },
              ),
            ],
          ),
        ));
  }

  void _clearTextField() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
