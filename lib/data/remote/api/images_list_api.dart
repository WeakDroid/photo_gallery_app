import 'package:dio/dio.dart';
import 'package:photo_gallery_app/data/remote/models/image_remote.dart';
import 'package:retrofit/retrofit.dart';
import 'api_constants.dart';

part 'images_list_api.g.dart';

@RestApi()
abstract class ImagesListApi {
  factory ImagesListApi(Dio dio) = _ImagesListApi;

  @GET(
      '${ApiConstants.getImagesList}${ApiConstants.accessKey}${ApiConstants.requestParam}')
  Future<ImageRemote> getImagesList();
}
