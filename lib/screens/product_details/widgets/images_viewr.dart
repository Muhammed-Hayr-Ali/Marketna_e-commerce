import 'package:application/constants/import.dart';

class ImageViewer extends StatelessWidget {
  final double? height, width, horizontalMargin;
  final List<ProductImages>? imagesList;
  ImageViewer({
    super.key,
    this.height,
    this.width,
    this.horizontalMargin,
    required this.imagesList,
  });

  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    /// calculate width and height
    double calculatedWidth = width ?? Get.width;
    double calculatedHeight = height ?? Get.width * 1.1;
    double calculatedhorizontalMargin = horizontalMargin ?? 10.0;

    /// if images list is null
    if (imagesList == null || imagesList == []) {
      return _buildEmptyPlaceholder(
        width: calculatedWidth,
        height: calculatedHeight,
        horizontalMargin: calculatedhorizontalMargin,
      );
    }

    /// if images list length is 1
    if (imagesList?.length == 1) {
      return _imageBuilder(
        width: calculatedWidth,
        height: calculatedHeight,
        horizontalMargin: calculatedhorizontalMargin,
        imageUrl: imagesList?.first.imageUrl ?? '',
      );
    }

    /// if images list length is greater than 1
    return SizedBox(
      width: calculatedWidth,
      height: calculatedHeight,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: imagesList?.length ?? 0,
            onPageChanged: (value) => controller.updateCurrentImage(value),
            itemBuilder:
                (_, i) => _imageBuilder(
                  width: calculatedWidth,
                  height: calculatedHeight,
                  horizontalMargin: calculatedhorizontalMargin,
                  imageUrl: imagesList?[i].imageUrl ?? '',
                ),
          ),

          /// indicator
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetBuilder<ProductDetailsController>(
                builder:
                    (controller) => CustomIndicator(
                      currentIndex: controller.currentImageIndex,
                      length: imagesList?.length ?? 0,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _imageBuilder({
  required String imageUrl,
  required double height,
  required double width,
  required double horizontalMargin,
}) {
  return Container(
    width: width,
    height: height,
    margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder:
          (c, s) => _buildPlaceholder(
            height: height,
            width: width,
            horizontalMargin: 0,
          ),
      errorWidget:
          (c, u, e) => _buildErrorWidget(
            height: height,
            width: width,
            horizontalMargin: 0,
          ),
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

Widget _buildPlaceholder({
  required double height,
  required double width,
  required double horizontalMargin,
}) {
  return CustomPlaceholder.loading(
    child: Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(28.0),
      ),
    ),
  );
}

Widget _buildEmptyPlaceholder({
  required double height,
  required double width,
  required double horizontalMargin,
}) {
  return Container(
    width: width,
    height: height,
    margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(28.0),
    ),
    child: const Icon(Icons.image, color: Colors.grey),
  );
}

Widget _buildErrorWidget({
  required double height,
  required double width,
  required double horizontalMargin,
}) {
  return Container(
    width: width,
    height: height,
    margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(28.0),
    ),
    child: Center(child: Icon(Icons.error, color: Colors.grey, size: 32.0)),
  );
}
