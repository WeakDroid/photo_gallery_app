import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/locator.dart';
import '../bloc/images_list_bloc.dart';
import '../widgets/image_tile.dart';

class ImagesListScreen extends StatefulWidget {
  const ImagesListScreen({
    super.key,
  });

  @override
  State<ImagesListScreen> createState() => _ImagesListScreenState();
}

class _ImagesListScreenState extends State<ImagesListScreen> {
  final _imagesListBloc = locator<ImagesListBloc>();

  @override
  void initState() {
    _imagesListBloc.add(LoadImagesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(child: _buildScreen(theme)),
    );
  }

  Widget _buildScreen(ThemeData theme) {
    return RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        _imagesListBloc.add(LoadImagesList(completer: completer));
        return completer.future;
      },
      child: BlocBuilder<ImagesListBloc, ImagesListState>(
        bloc: _imagesListBloc,
        builder: (context, state) {
          if (state is ImagesListLoaded) {
            return _buildImagesList(state);
          }
          if (state is ImagesListLoadingFailure) {
            return _buildLoadedErrorState(theme, state.message);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildImagesList(ImagesListLoaded state) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      itemCount: state.imagesList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, i) {
        final image = state.imagesList[i];
        return ImageTile(
          image: image,
          onTap: () {
            Navigator.pushNamed(
              context,
              '/imagedetailsscreen',
              arguments: image,
            );
          },
        );
      },
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
              _imagesListBloc.add(LoadImagesList());
            },
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
