import 'package:flutter/material.dart';
import 'application.dart';
import 'di/locator.dart';

Future<void> main() async {
  await init();

  runApp(const PhotoGalleryApp());
}

Future init() async {
  setupLocator();
}
