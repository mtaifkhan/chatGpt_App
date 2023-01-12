import 'dart:ffi';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_gpt/core/custom_excetion.dart';
import 'package:chat_gpt/features/text_completion/data/models/text_completion_model.dart';
import 'package:chat_gpt/features/text_completion/domain/usecases/text_comlation_usercase.dart';
import 'package:equatable/equatable.dart';
part 'text_completion_state.dart';

class TextCompletionCubit extends Cubit<TextCompletionState> {
  final TextcompletionUseCase textcompletionUseCase;

  TextCompletionCubit({required this.textcompletionUseCase})
      : super(TextCompletionInitial());

  Future<void> textCompletion({required String query}) async {
    emit(TextCompletionLoading());
    try {
      final textCompletionModelData = await textcompletionUseCase.call(query);
      emit(TextCompletionLoaded(textCompletionModel: textCompletionModelData));
    } on SocketException catch (e) {
      emit(TextCompletionFaliure(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(TextCompletionFaliure(errorMsg: e.message));
    }
  }
}
