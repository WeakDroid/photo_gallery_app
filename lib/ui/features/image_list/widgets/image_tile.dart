import 'package:flutter/material.dart';
import '../../../../domain/models/image.dart';

class ImageTile extends StatelessWidget {
  final ImageModel image;
  final VoidCallback onTap;

  const ImageTile({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          image.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        '# ${image.name}',
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        image.author,
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => onTap(),
    );
  }
}
