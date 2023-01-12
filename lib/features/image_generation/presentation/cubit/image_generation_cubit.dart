// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:chat_gpt/core/custom_excetion.dart';
import 'package:chat_gpt/features/image_generation/data/model/image_generation_model.dart';
import 'package:chat_gpt/features/image_generation/domain/usecases/image_generation_usercase.dart';
import 'package:equatable/equatable.dart';

part 'image_generation_state.dart';

class ImageGenerationCubit extends Cubit<ImageGenerationState> {
  final ImageGenerationUseCase imageGenerationUseCase;
  ImageGenerationCubit({required this.imageGenerationUseCase})
      : super(ImageGenerationInitial());

  Future<void> imageGenerate({required String query}) async {
    emit(ImageGenerationLoading());
    try {
      final imageGenerationModelDatas =
          await imageGenerationUseCase.call(query);

      emit(ImageGenerationLoaded(
          imageGenerationModelData: imageGenerationModelDatas));
    } on SocketException catch (e) {
      emit(ImageGenerationFaliure(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(ImageGenerationFaliure(errorMsg: e.message));
    }
  }
}
