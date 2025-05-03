import 'package:application/utils/import.dart';

class ProfileWidget extends StatelessWidget {
  final bool isLoading;
  final double size;
  final Map<String, dynamic>? metadata;
  const ProfileWidget({
    super.key,
    this.metadata,
    this.isLoading = true,
    this.size = 64,
  });

  String? _getAvatar(Map<String, dynamic>? metadata) {
    if (metadata == null || metadata.isEmpty) return null;
    return metadata['avatar'] ?? metadata['avatar_url'];
  }

  String _getUserName(Map<String, dynamic>? metadata) {
    if (metadata == null || metadata.isEmpty) return 'Guest';

    return DataConverter.getUserName(metadata);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _loadingPlaceholder(size)
        : Row(
          children: [
            CachedNetworkImage(
              width: size,
              height: size,
              imageUrl: '${_getAvatar(metadata)}',
              imageBuilder:
                  (context, imageProvider) => DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

              errorWidget:
                  (context, url, error) => Container(
                    padding: EdgeInsets.all(size * 0.1),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(AppAssets.avatar),
                  ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText('Welcome'),
                CustomText(_getUserName(metadata), fontWeight: FontWeight.bold),
                CustomText(
                  metadata?['email'] ?? '',
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
