import 'package:application/utils/import.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder:
          (c) => SizedBox(
            height: 64,
            width: double.infinity,
            child:
                c.isLoading
                    ? _loadingPlaceholder()
                    : Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey.shade300,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText('Welcome Back'),
                            CustomText(
                              // _.user.rawUserMetaData!.displayName ??
                              '',
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              'm.thelord963@gmail.com',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
          ),
    );
  }
}

Widget _loadingPlaceholder() {
  return CustomPlaceholder.loading(
    child: Row(
      children: [
        CircleAvatar(radius: 32, backgroundColor: Colors.grey.shade300),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 20,
              width: 128,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 18,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
