import 'dart:convert';

import 'package:chat_gpt/core/open_api_core.dart';
import 'package:chat_gpt/features/global/provider/provider.dart';
import 'package:chat_gpt/features/image_generation/data/model/image_generation_model.dart';
import 'package:chat_gpt/features/image_generation/data/remote_data_source/image_generation_data_source.dart';
import 'package:http/http.dart' as http;

import '../../../../core/custom_excetion.dart';

class ImageGenerationDataSourceImpl implements ImageGenerationDataSource {
  final http.Client httpClient;

  ImageGenerationDataSourceImpl({required this.httpClient});

  @override
  Future<ImageGenerationModel> getGeneratedImages(String query) async {
    final String _endPoint = "images/enerations";

    // there types of pixels we can pass
    //256x256  ,, 512x512 , 1021x1024
    Map<String, dynamic> rawParms = {
      'n': 10,
      "size": "256x256",
      'prompt': query,
    };

    final encode = json.encode(rawParms);

    final response = await httpClient.post(
      Uri.parse(endPoint(_endPoint)),
      body: encode,
      headers: headerBearerOption(OPEN_API_KEY),
    );

    if (response.statusCode == 200) {
      return ImageGenerationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "TExt completion server Exception");
    }
  }
}
