import 'dart:io';

import 'package:application/constants/import.dart';

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? imagePath;
  final double size;
  final Color backgroundColor;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final String? cameraButtonText, galleryButtonText, deleteButtonText;
  final void Function()? onDeleteTap, clearPath;
  final void Function(String? path) onSelectImage;

  CustomAvatar({
    super.key,
    this.imageUrl,
    this.imagePath,
    this.size = 128.0,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.border,
    this.cameraButtonText,
    this.galleryButtonText,
    this.deleteButtonText,
    this.onDeleteTap,
    this.clearPath,
    required this.onSelectImage,
    this.boxShadow,
  });

  /// variables
  final ImagePicker picker = ImagePicker();

  final Border defaultBorder = Border.all(color: Colors.transparent, width: 0);

  final ButtonStyle fullWidthButtonstyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.grey.shade200,
    minimumSize: Size(double.infinity, 49),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    shadowColor: Colors.transparent,
  );
  ButtonStyle cicularButtonstyleBuilder() {
    return ElevatedButton.styleFrom(
      side: BorderSide(width: 2.5, color: Colors.white),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: Size.fromRadius(size * 0.15),
      maximumSize: Size.fromRadius(size * 0.15),
      fixedSize: Size.fromRadius(size * 0.15),
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
              child: Text((cameraButtonText ?? 'camera').tr),
            ),
            SizedBox(height: 8),

            ElevatedButton(
              style: fullWidthButtonstyle,
              onPressed: () {
                Get.back(result: 'gallery');
              },
              child: Text((cameraButtonText ?? 'gallery').tr),
            ),
            SizedBox(
              child:
                  delete
                      ? Column(
                        children: [
                          SizedBox(height: 8),

                          ElevatedButton(
                            style: fullWidthButtonstyle,
                            onPressed: () {
                              Get.back(result: 'delete');
                            },
                            child: Text((cameraButtonText ?? 'delete').tr),
                          ),
                        ],
                      )
                      : null,
            ),
          ],
        ),
      ),
      barrierColor: Colors.black26,
    );
  }

  Future<void> _onTap(bool delete) async {
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
          onSelectImage.call(image.path);
        }
        break;
      case 'gallery':
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          onSelectImage.call(image.path);
        }
        break;
      case 'delete':
        onDeleteTap!();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (imagePath != null && imagePath != '') {
      /// Image From Local Storage
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: backgroundColor,
              border: border ?? defaultBorder,
              borderRadius: BorderRadius.circular(999),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Image.file(File(imagePath!), fit: BoxFit.cover),
            ),
          ),
          ElevatedButton(
            style: cicularButtonstyleBuilder(),
            onPressed: clearPath,
            child: Icon(
              PhosphorIconsRegular.trash,
              size: size * 0.175,
              color: AppColors.rurikonBlue
            ),
          ),
        ],
      );
    } else if (imageUrl != null && imageUrl != '') {
      /// Image From Network
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: backgroundColor,
              border: border ?? defaultBorder,
              borderRadius: BorderRadius.circular(999),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: imageUrl!,
                placeholder: (context, url) => SizedBox(),
                errorWidget: (context, url, error) {
                  return Padding(
                    padding: EdgeInsets.all(size * 0.2),
                    child: SvgPicture.asset(AppAssets.avatar),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
            style: cicularButtonstyleBuilder(),
            onPressed: () => _onTap(true),
            child: Icon(
              PhosphorIconsRegular.camera,
              size: size * 0.175,
              color: AppColors.rurikonBlue,
            ),
          ),
        ],
      );
    } else {
      /// No Image
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: size,
            width: size,
            padding: EdgeInsets.all(size * 0.2),
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: backgroundColor,
              border: border ?? defaultBorder,
              borderRadius: BorderRadius.circular(999),
            ),
            child: SvgPicture.asset(AppAssets.avatar),
          ),
          ElevatedButton(
            style: cicularButtonstyleBuilder(),
            onPressed: () => _onTap(false),
            child: Icon(
              PhosphorIconsRegular.camera,
              size: size * 0.175,
              color:  AppColors.rurikonBlue,
            ),
          ),
        ],
      );
    }
  }
}
