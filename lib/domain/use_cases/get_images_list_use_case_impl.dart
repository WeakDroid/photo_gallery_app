import 'package:photo_gallery_app/data/repositories/image/images_repository.dart';
import '../data_result/data_result.dart';
import '../models/image.dart';
import 'get_images_list_use_case.dart';

class GetImagesListUseCaseImpl implements GetImagesListUseCase {
  final ImageRepository imageRepository;

  GetImagesListUseCaseImpl({
    required this.imageRepository,
  });

  @override
  Future<DataResult<List<ImageModel>>> getImagesList() async {
    final result = await imageRepository.getImagesList();
    return result;
  }
}

