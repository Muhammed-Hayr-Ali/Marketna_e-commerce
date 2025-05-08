
import 'package:application/constants/import.dart';

class ProfileWidget extends StatelessWidget {
  final bool isLoading;
  final double size;
  final UserMetaDataModel? metadata;
  const ProfileWidget({
    super.key,
    this.isLoading = true,
    this.size = 64,
    this.metadata,
  });

  Widget _getAvatar(String? avatar) {
    final placeholder = Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.1),
      decoration: BoxDecoration(color: AppColors.grey, shape: BoxShape.circle),
      child: SvgPicture.asset(AppAssets.avatar),
    );

    if (avatar == null || avatar.isEmpty || avatar == '') {
      return placeholder;
    }
    return CachedNetworkImage(
      width: size,
      height: size,
      imageUrl: avatar,
      imageBuilder:
          (context, imageProvider) => DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
      errorWidget: (context, url, error) => placeholder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _loadingPlaceholder(size)
        : Row(
          children: [
            _getAvatar(metadata!.avatar ?? metadata!.avatarUrl),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  DataConverter.getUserName(metadata!),
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  metadata!.email ?? '',
                  fontSize: 10,
                  color: Colors.grey,
                ),
                CustomText(
                  metadata!.statusMessage ?? '',
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        );
  }
}

Widget _loadingPlaceholder(double size) {
  const avatarPlaceholderColor = Colors.grey;
  const avatarPlaceholderShape = BoxShape.circle;
  const textContainerHeight = 18.0;
  const margin = 2.0;
  const textContainerColor = Colors.grey;
  const textContainerShape = BoxShape.rectangle;
  final textContainerRadius = BorderRadius.circular(4);
  return CustomPlaceholder.loading(
    child: Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: avatarPlaceholderColor,
            shape: avatarPlaceholderShape,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: textContainerHeight,
              width: 96,
              decoration: BoxDecoration(
                color: textContainerColor,
                shape: textContainerShape,
                borderRadius: textContainerRadius,
              ),
            ),
            Container(
              height: textContainerHeight,
              width: 128,
              margin: EdgeInsets.symmetric(vertical: margin),

              decoration: BoxDecoration(
                color: textContainerColor,
                shape: textContainerShape,
                borderRadius: textContainerRadius,
              ),
            ),
            Container(
              height: textContainerHeight - 4,
              width: 152,

              decoration: BoxDecoration(
                color: textContainerColor,
                shape: textContainerShape,
                borderRadius: textContainerRadius,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
