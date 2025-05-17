import 'package:application/constants/import.dart';

class ImageViewer extends StatelessWidget {
  final List<ProductImages>? imagesList;
  final double? height, width;
  const ImageViewer({
    super.key,
    required this.imagesList,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    /// if images list is null
    if (imagesList == null || imagesList == []) {
      return _buildEmptyPlaceholder(horizontalMargin: 10.0);
    }

    /// if images list length is 1
    if (imagesList?.length == 1) {
      return SizedBox(
        height: height ?? Get.width * 1.1,
        width: width ?? Get.width,
        child: _imageBuilder(
          horizontalMargin: 10.0,
          imageUrl: imagesList?.first.imageUrl ?? '',
        ),
      );
    }

    /// if images list length is greater than 1
    return SizedBox(
      height: height ?? Get.width * 1.1,
      width: width ?? Get.width,
      child: PageView.builder(
        itemCount: imagesList?.length ?? 0,
        onPageChanged: (value) {
          debugPrint(value.toString());
        },
        itemBuilder:
            (_, i) => _imageBuilder(
              horizontalMargin: 10.0,
              imageUrl: imagesList?[i].imageUrl ?? '',
            ),
      ),
    );
  }
}

Widget _imageBuilder({required String imageUrl, double? horizontalMargin}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0.0),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (c, s) => placeholder(),
      errorWidget: (c, u, e) => errorWidget(),
      imageBuilder:
          (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.0),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
    ),
  );
}

Widget placeholder({double? horizontalMargin}) {
  return CustomPlaceholder.loading(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(28.0),
      ),
    ),
  );
}

Widget _buildEmptyPlaceholder({
  double? height,
  double? width,
  double? horizontalMargin,
}) {
  return Container(
    height: height ?? Get.width * 1.1,
    width: width ?? Get.width,
    margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(28.0),
    ),
    child: const Icon(Icons.image, color: Colors.grey),
  );
}

Widget errorWidget({double? horizontalMargin}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(28.0),
    ),
    child: Center(child: Icon(Icons.error, color: Colors.grey, size: 32.0)),
  );
}
