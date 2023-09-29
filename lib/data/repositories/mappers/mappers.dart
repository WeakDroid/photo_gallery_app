import '../../../domain/models/image.dart';
import '../../remote/models/image_remote.dart';

class HitRemoteToImageMapper {
  static ImageModel fromApi(HitRemote remote) {
    return ImageModel(
        name: remote.name ?? 'No tags',
        author: remote.author ?? 'No author name',
        imageUrl: remote.imageUrl ?? '');
  }
}
