import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_gallery_app/data/remote/api/images_list_api.dart';
import 'package:photo_gallery_app/data/repositories/image/images_repository.dart';
import 'package:photo_gallery_app/data/repositories/image/images_repository_impl.dart';
import 'package:photo_gallery_app/domain/use_cases/get_images_list_use_case.dart';
import 'package:photo_gallery_app/domain/use_cases/get_images_list_use_case_impl.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:photo_gallery_app/ui/features/image_list/bloc/images_list_bloc.dart';
import '../data/remote/api/api_constants.dart';
import '../ui/features/image/bloc/image_bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  _setupData();

  _setupDomain();

  _setupUi();
}

_setupData() {
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    dio.options.baseUrl = ApiConstants.baseUrl;

    return dio;
  });

  locator.registerLazySingleton<ImageRepository>(() => ImageRepositoryImpl(
        api: ImagesListApi(locator<Dio>()),
      ));
}

_setupDomain() {
  locator.registerLazySingleton<GetImagesListUseCase>(() =>
      GetImagesListUseCaseImpl(imageRepository: locator<ImageRepository>()));
}

_setupUi() {
  locator.registerFactory<ImagesListBloc>(
      () => ImagesListBloc(GetIt.I<GetImagesListUseCase>()));
}
