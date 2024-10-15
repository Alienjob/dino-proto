import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: double.infinity,
      child: (imageUrl ?? '').isEmpty
          ? const Icon(Icons.person)
          : Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),
    );
  }
}
