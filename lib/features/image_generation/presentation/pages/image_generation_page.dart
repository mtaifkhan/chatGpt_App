import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_gpt/features/global/search_text_field/search_text_field_widget.dart';
import 'package:chat_gpt/features/image_generation/presentation/cubit/image_generation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ImageGenerationPage extends StatefulWidget {
  const ImageGenerationPage({super.key});

  @override
  State<ImageGenerationPage> createState() => _ImageGenerationPageState();
}

class _ImageGenerationPageState extends State<ImageGenerationPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Generation"),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
              child: BlocBuilder<ImageGenerationCubit, ImageGenerationState>(
            builder: (context, imagestate) {
              if (imagestate is ImageGenerationLoading) {
                return Center(
                    child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/images/loading.gif"),
                ));
              }
              if (imagestate is ImageGenerationLoaded) {
                print("Yes I am called======");
                return MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  itemCount: imagestate.imageGenerationModelData.data.length,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final generatedImage =
                        imagestate.imageGenerationModelData.data[index];
                    return Card(
                      child: CachedNetworkImage(
                        imageUrl: generatedImage.url,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) =>
                            SizedBox(
                          height: 150,
                          width: 150,
                          child: Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(.3),
                              highlightColor: Colors.grey,
                              child: Container(
                                height: 220,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              )),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: Text(
                  "OpenAI Image Generation",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              );
            },
          )),
          SearchTextFieldWidget(
            textEditingController: _searchController,
            onTap: () {
              BlocProvider.of<ImageGenerationCubit>(context)
                  .imageGenerate(query: _searchController.text)
                  .then((value) => _clearTextField);
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      )),
    );
  }

  void _clearTextField() {
    setState(() {
      _searchController.clear();
    });
  }
}
