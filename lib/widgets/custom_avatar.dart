import 'dart:io';

import 'package:application/utils/import.dart';

enum SourceImage { networkImage, localImage }

class CustomAvatar extends StatelessWidget {
  final SourceImage sourceImage;
  final String? path;
  final double size;
  final Color? backgroundColor;
  final double borderWidth;
  final Color borderColor;
  final Widget? child;
  final Color? childColor;
  final void Function()? onTap;
  const CustomAvatar({
    super.key,
    this.path,
    this.size = 128.0,
    this.backgroundColor,
    this.borderWidth = 0.0,
    this.borderColor = Colors.transparent,
    required this.sourceImage,
    this.onTap,
    this.child,
    this.childColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: borderWidth, color: borderColor),
            borderRadius: BorderRadius.circular(size),
            color: backgroundColor ?? Colors.grey.shade200,
          ),
          height: size,
          width: size,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size),
            child: _getImageWidget(),
          ),
        ),
        SizedBox(
          child:
              onTap == null
                  ? null
                  : CustomCicularButton(
                    borderColor: Colors.white,
                    borderWidth: 2,
                    color: childColor,
                    size: size * 0.3,
                    padding: size * 0.035,
                    onTap: onTap,
                    child:
                        child ??
                        SvgPicture.asset(
                          AppAssets.edit,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                  ),
        ),
      ],
    );
  }

  Widget _getImageWidget() {
    if (path == null || path == null) {
      return _defaultAvatar();
    }

    if (sourceImage == SourceImage.localImage) {
      return Image.file(File(path!), fit: BoxFit.cover);
    } else {
      return CachedNetworkImage(
        imageUrl: path!,
        fit: BoxFit.cover,
        placeholder: (context, url) => _shimmerPlaceholder(),
        errorWidget: (context, url, error) => _defaultAvatar(),
      );
    }
  }

  Widget _defaultAvatar() {
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor ?? Colors.grey.shade200),
      child: Padding(
        padding: EdgeInsets.all(size * 0.2),
        child: SvgPicture.asset('assets/images/svg/user.svg'),
      ),
    );
  }

  Widget _shimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(245, 245, 245, 1),
      highlightColor: Colors.grey.shade100,
      child: Container(color: Colors.black),
    );
  }
}
