part of 'text_completion_cubit.dart';

abstract class TextCompletionState extends Equatable {
  const TextCompletionState();

  @override
  List<Object> get props => [];
}

class TextCompletionInitial extends TextCompletionState {}

class TextCompletionLoading extends TextCompletionState {}

class TextCompletionLoaded extends TextCompletionState {
  final TextCompletionModel textCompletionModel;

  const TextCompletionLoaded({required this.textCompletionModel});
}

class TextCompletionFaliure extends TextCompletionState {
  final String? errorMsg;

  const TextCompletionFaliure({this.errorMsg});
}
