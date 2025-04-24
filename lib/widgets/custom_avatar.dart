import 'dart:io';

import 'package:application/utils/import.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CustomAvatar extends StatefulWidget {
  final String? imageUrl;
  final String? imagePath;
  final double size;
  final Color color;
  final BoxBorder? border;
  final String? cameraButtonText, galleryButtonText, deleteButtonText;

  final void Function(String? path) onSelectImage;
  final void Function()? onDeleteTap, clearPath;
  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.imagePath,
    required this.onSelectImage,
    this.size = 128.0,
    this.color = const Color(0xFFE0E0E0),
    this.border,
    this.cameraButtonText,
    this.galleryButtonText,
    this.deleteButtonText,
    this.onDeleteTap,
    this.clearPath,
  });

  @override
  State<CustomAvatar> createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  /// variables
  final ImagePicker picker = ImagePicker();

  ButtonStyle? cicularButtonstyle;
  ButtonStyle fullWidthButtonstyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 49),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    shadowColor: Colors.transparent,
  );

  @override
  void initState() {
    super.initState();
    cicularButtonstyle = ElevatedButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: Size.fromRadius(widget.size * 0.15),
      maximumSize: Size.fromRadius(widget.size * 0.15),
      fixedSize: Size.fromRadius(widget.size * 0.15),
      backgroundColor: Colors.grey.shade200,
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: CircleBorder(),
      padding: EdgeInsets.zero,
    );
  }

  Future<String?> _imageSource(bool delete) async {
    return await Get.bottomSheet(
      elevation: 0,
      Container(
        width: double.infinity,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: fullWidthButtonstyle,
              onPressed: () {
                Get.back(result: 'camera');
              },
              child: Text(widget.cameraButtonText ?? 'camera'),
            ),
            SizedBox(height: 8),

            ElevatedButton(
              style: fullWidthButtonstyle,
              onPressed: () {
                Get.back(result: 'gallery');
              },
              child: Text(widget.cameraButtonText ?? 'gallery'),
            ),
            SizedBox(
              child: delete ?
               Column(
                children: [
                  SizedBox(height: 8),
              
                  ElevatedButton(
                    style: fullWidthButtonstyle,
                    onPressed: () {
                      Get.back(result: 'delete');
                    },
                    child: Text(widget.cameraButtonText ?? 'delete'),
                  ),
                ],
              ): null,
            ),
          ],
        ),
      ),
      barrierColor: Colors.black26,
    );
  }

  void _onTap(bool delete) async {
    /// Pick Image Source
    final source = await _imageSource(delete);

    debugPrint(source);

    /// check if source is null
    if (source == null) return;

    /// Select Image
    switch (source) {
      case 'camera':
        final image = await picker.pickImage(source: ImageSource.camera);
        if (image != null) {
          widget.onSelectImage.call(image.path);
        }
        break;
      case 'gallery':
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          widget.onSelectImage.call(image.path);
        }
        break;
      case 'delete':
        widget.onDeleteTap!();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imagePath != null && widget.imagePath != '') {
      /// Image From Local Storage
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              border: widget.border,
              borderRadius: BorderRadius.circular(999),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Image.file(File(widget.imagePath!), fit: BoxFit.cover),
            ),
          ),
          ElevatedButton(
            style: cicularButtonstyle,
            onPressed: widget.clearPath,
            child: Icon(Icons.delete, size: widget.size * 0.175),
          ),
        ],
      );
    } else if (widget.imageUrl != null && widget.imageUrl != '') {
      /// Image From Network
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: widget.size,
            width: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              border: widget.border,
              borderRadius: BorderRadius.circular(999),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.imageUrl!,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: Get.width * 0.2,
                      width: Get.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  );
                },

                errorWidget: (context, url, error) {
                  return Padding(
                    padding: EdgeInsets.all(widget.size * 0.2),
                    child: SvgPicture.asset(AppAssets.profile),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            style: cicularButtonstyle,
            onPressed:()=> _onTap(true),
            child: Icon(Icons.camera_alt, size: widget.size * 0.175),
          ),
        ],
      );
    } else {
      /// No Image
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: widget.size,
            width: widget.size,
            padding: EdgeInsets.all(widget.size * 0.2),
            decoration: BoxDecoration(
              color: widget.color,
              border: widget.border,
              borderRadius: BorderRadius.circular(999),
            ),
            child: SvgPicture.asset(AppAssets.profile),
          ),
          ElevatedButton(
            style: cicularButtonstyle,
            onPressed: () => _onTap(false),
            child: Icon(Icons.camera_alt, size: widget.size * 0.175),
          ),
        ],
      );
    }
  }
}
