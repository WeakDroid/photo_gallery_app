import '../../../domain/data_result/data_result.dart';
import '../../../domain/models/image.dart';

abstract class ImageRepository {
  Future<DataResult<List<ImageModel>>> getImagesList();
}

