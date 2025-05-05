import 'package:application/utils/import.dart';

class ImageViewer extends StatefulWidget {
  final List<String> images;
  const ImageViewer({super.key, required this.images});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width * 1.1,
      width: double.maxFinite,
      child:
          widget.images.isEmpty
              ? errorWidget()
              : widget.images.length == 1
              ? _imageBuilder(imageUrl: widget.images.first)
              : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemCount: widget.images.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemBuilder:
                        (c, i) => _imageBuilder(imageUrl: widget.images[i]),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomIndicator(
                      currentIndex: currentIndex,
                      length: widget.images.length,
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

Widget placeholder() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: CustomPlaceholder.loading(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(28.0),
        ),
      ),
    ),
  );
}

Widget errorWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Icon(Icons.error, color: Colors.red),
    ),
  );
}
