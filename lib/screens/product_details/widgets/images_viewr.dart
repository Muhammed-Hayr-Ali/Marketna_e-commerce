import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final List<String> images;
  const ImageViewer({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images == []) return _noImage();
    if (images.length == 1) return _sengleImage(images.first);
    return _listImages(images);
  }
}

Widget _noImage() {
  return Text('No image Placeholder');
}

Widget _sengleImage(String image) {
  return Text('sengle Image');
}

Widget _listImages(List<String> images) {
  return Text('list Image');
}
