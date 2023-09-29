import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/data_result_processor.dart';
import '../../../../domain/models/image.dart';
import '../../../../domain/use_cases/get_images_list_use_case.dart';

part 'image_event.dart';

part 'image_state.dart';

class ImageDetailBloc extends Bloc<ImageDetailEvent, ImageDetailState> {
  final GetImagesListUseCase imageUseCase;

  ImageDetailBloc(this.imageUseCase) : super(ImageDetailInitial()) {
    on<LoadImageDetail>((event, emit) async {
      if (state is! ImageDetailLoaded) {
        emit(ImageDetailLoading());
      }

      final listResult = await imageUseCase.getImagesList();

      DataResultProcessor<List<ImageModel>>.processResult(
        dataResult: listResult,
        onSuccess: (data) => emit(ImageDetailLoaded(image: data)),
        onError: (_) => emit(ImageDetailLoadingFailure()),
      );

      event.completer?.complete();
    });
  }
}
