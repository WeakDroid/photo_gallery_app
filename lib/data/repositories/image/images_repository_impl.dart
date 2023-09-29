import 'package:photo_gallery_app/data/remote/models/image_remote.dart';
import 'package:photo_gallery_app/data/repositories/image/images_repository.dart';
import '../../../domain/data_result/data_result.dart';
import '../../../domain/models/image.dart';
import '../../remote/api/images_list_api.dart';
import '../mappers/mappers.dart';
import '../safe_api_call.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImagesListApi api;

  ImageRepositoryImpl({
    required this.api,
  });

  @override
  Future<DataResult<List<ImageModel>>> getImagesList() async {
    return safeApiCall(
      processRemoteResult: (data) => _processImagesList(data),
      apiCall: () => api.getImagesList(),
    );
  }

  DataResult<List<ImageModel>> _processImagesList(ImageRemote imageRemote) {
    final hits = imageRemote.hits;
    if (hits != null) {
      return SuccessResult(
          data: hits.map((e) => HitRemoteToImageMapper.fromApi(e)).toList());
    } else {
      return SuccessResult(data: []);
    }
  }
}
