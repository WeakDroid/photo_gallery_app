import 'package:flutter/material.dart';
import 'package:photo_gallery_app/ui/router/router.dart';
import 'package:photo_gallery_app/ui/theme/theme.dart';


class PhotoGalleryApp extends StatelessWidget {

  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      theme: darkTheme,
    );
  }
}
