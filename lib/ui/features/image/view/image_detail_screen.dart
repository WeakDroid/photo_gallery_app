import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_gallery_app/domain/use_cases/get_images_list_use_case.dart';
import '../../../../domain/models/image.dart';
import '../bloc/image_bloc.dart';

class ImageDetailsScreen extends StatefulWidget {
  final ImageModel image;

  const ImageDetailsScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ImageDetailsScreen> createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {
  final _imageDetailBloc = ImageDetailBloc(
    GetIt.I<GetImagesListUseCase>(),
  );

  @override
  void initState() {
    _imageDetailBloc.add(LoadImageDetail());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(child: _buildScreen(theme)),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 26,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Widget _buildScreen(ThemeData theme) {
    return BlocBuilder<ImageDetailBloc, ImageDetailState>(
      bloc: _imageDetailBloc,
      builder: (context, state) {
        if (state is ImageDetailLoaded) {
          return _buildImageInfo(state, theme);
        }
        if (state is ImageDetailLoadingFailure) {
          return _buildLoadedErrorState(theme, state.message);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildImageInfo(ImageDetailLoaded state, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.image.imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '# ${widget.image.name}',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(widget.image.author, style: theme.textTheme.labelSmall)
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedErrorState(ThemeData theme, String? errorText) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errorText ?? "Something went wrong.\nPlease try again later",
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              _imageDetailBloc.add(LoadImageDetail());
            },
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
