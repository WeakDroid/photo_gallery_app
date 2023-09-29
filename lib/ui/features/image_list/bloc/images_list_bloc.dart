import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery_app/domain/use_cases/get_images_list_use_case.dart';
import '../../../../core/data_result_processor.dart';
import '../../../../domain/models/image.dart';

part 'images_list_event.dart';

part 'images_list_state.dart';

class ImagesListBloc extends Bloc<ImagesListEvent, ImagesListState> {
  final GetImagesListUseCase imagesListUseCase;

  ImagesListBloc(this.imagesListUseCase) : super(ImagesListInitial()) {
    on<LoadImagesList>((event, emit) async {
      if (state is! ImagesListLoaded) {
        emit(ImagesListLoading());
      }

      final listResult = await imagesListUseCase.getImagesList();

      DataResultProcessor<List<ImageModel>>.processResult(
        dataResult: listResult,
        onSuccess: (data) {
          emit(ImagesListLoaded(imagesList: data));
        },
        onError: (error) {
          emit(ImagesListLoadingFailure());
        },
      );

      event.completer?.complete();
    });
  }
}
