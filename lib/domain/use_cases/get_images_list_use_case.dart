import '../data_result/data_result.dart';
import '../models/image.dart';

abstract class GetImagesListUseCase {
  Future<DataResult<List<ImageModel>>> getImagesList();
}