import 'package:flutter/cupertino.dart';
import 'package:photo_gallery_app/ui/features/image_list/view/images_list_screen.dart';
import '../../domain/models/image.dart';
import '../features/image/view/image_detail_screen.dart';

final routes = {
  '/': (context) {
    return const ImagesListScreen();
  },
  '/imagedetailsscreen': (context) => ImageDetailsScreen(
        image: ModalRoute.of(context)?.settings.arguments as ImageModel,
      ),
};
