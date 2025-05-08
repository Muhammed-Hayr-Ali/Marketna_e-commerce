import 'package:application/constants/import.dart';
import 'package:application/screens/product_details/widgets/appbar_widget.dart';

class ImageViewer extends StatelessWidget {
  final List<String> images;
  ImageViewer({super.key, required this.images});
  final c = Get.find<ProductDetailsController>();
  @override
  Widget build(BuildContext context) {
    /// image widget
    return SizedBox(
      height: Get.width * 1.1,
      width: double.maxFinite,
      child: Stack(
        children: [
          /// Images
          SizedBox(
            child:
                images.isEmpty
                    ? errorWidget(10.0)
                    : images.length == 1
                    ? _imageBuilder(imageUrl: images.first)
                    : Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView.builder(
                          itemCount: images.length,
                          onPageChanged:
                              (value) => c.currentImageIndex.value = value,
                          itemBuilder:
                              (c, i) => _imageBuilder(imageUrl: images[i]),
                        ),
                      ],
                    ),
          ),

          /// Appbar
          AppBarWidget(),

          /// Indicator
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child:
                  images.length > 1
                      ? Obx(
                        () => CustomIndicator(
                          currentIndex: c.currentImageIndex.value,
                          length: images.length,
                        ),
                      )
                      : Container(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _imageBuilder({required String imageUrl}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (c, s) => placeholder(),
      errorWidget: (c, u, e) => errorWidget(0),
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

Widget placeholder() {
  return CustomPlaceholder.loading(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(28.0),
      ),
    ),
  );
}

Widget errorWidget(double margin) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: margin),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(28.0),
    ),
    child: Icon(Icons.error, color: Colors.red),
  );
}
