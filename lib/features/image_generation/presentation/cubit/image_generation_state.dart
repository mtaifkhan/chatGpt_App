part of 'image_generation_cubit.dart';

abstract class ImageGenerationState extends Equatable {
  const ImageGenerationState();

  @override
  List<Object> get props => [];
}

class ImageGenerationInitial extends ImageGenerationState {}

class ImageGenerationLoading extends ImageGenerationState {}

class ImageGenerationLoaded extends ImageGenerationState {
  final ImageGenerationModel imageGenerationModelData;

  const ImageGenerationLoaded({required this.imageGenerationModelData});
}

class ImageGenerationFaliure extends ImageGenerationState {
  final String? errorMsg;

  const ImageGenerationFaliure({this.errorMsg});
}
