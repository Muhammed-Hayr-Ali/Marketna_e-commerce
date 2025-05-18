import 'package:application/constants/import.dart';

class ProductDetailsMainController {
  Future<ProductReviews?> writeReview({
    required int productId,
    ProductReviews? review,
  }) async {
    return null;
  }
}






  // void openCommentsList() {
  //   custombottomSheet(
  //     title: 'Comments ${controller.reviews.length}',
  //     children: [
  //       Expanded(
  //         child: ListView.separated(
  //           itemCount: controller.reviews.length,
  //           itemBuilder: (context, index) {
  //             final ReviewModel review = controller.reviews[index];
  //             return Container(
  //               padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  //               decoration: BoxDecoration(
  //                 color: Colors.grey.shade100,
  //                 borderRadius: BorderRadius.circular(4.0),
  //               ),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       CustomText(review.profiles!.name ?? ''),

  //                       Row(
  //                         children: [
  //                           CustomText(
  //                             DataConverter.dateConverter(
  //                               date: review.createdAt!,
  //                               dateType: DateType.relative,
  //                             ),
  //                             fontSize: 10,
  //                             color: Colors.grey,
  //                           ),
  //                           const SizedBox(width: 8.0),

  //                           Icon(PhosphorIconsRegular.star, size: 14),
  //                           const SizedBox(width: 4.0),
  //                           CustomText(
  //                             review.ratingValue.toString(),
  //                             fontSize: 10,
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   Divider(),
  //                   CustomText(review.comment ?? '', fontSize: 12),
  //                   SizedBox(height: 8.0),
  //                 ],
  //               ),
  //             );
  //           },
  //           separatorBuilder: (context, index) => SizedBox(height: 8.0),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Future<void> writeReview({
  //   required String uid,
  //   required int productId,
  // }) async {
  //   final formKey = GlobalKey<FormState>();
  //   double ratingValue = 5.0;
  //   final commetController = TextEditingController();
  //   controller.commentLength.value = 0.0;
  //   ReviewModel? review;
  //   custombottomSheet(
  //     children: [
  //       Flexible(
  //         child: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               SizedBox(height: 10.0),
  //               Row(
  //                 children: [
  //                   RatingBar.builder(
  //                     initialRating: 5.0,
  //                     minRating: 0,
  //                     direction: Axis.horizontal,
  //                     allowHalfRating: true,
  //                     itemCount: 5,
  //                     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
  //                     itemBuilder:
  //                         (context, _) => Icon(Icons.star, color: Colors.amber),
  //                     itemSize: 28,
  //                     onRatingUpdate: (rating) {
  //                       ratingValue = rating;
  //                       controller.ratingValue.value = rating;
  //                     },
  //                   ),
  //                   Spacer(),
  //                   Obx(() => CustomText(controller.ratingValue.toString())),
  //                 ],
  //               ),
  //               SizedBox(height: 10),
  //               Form(
  //                 key: formKey,
  //                 child: Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Expanded(
  //                       child: CustomTextField(
  //                         hintText: 'comment',
  //                         borderRadius: 99,
  //                         autofocus: true,
  //                         keyboardType: TextInputType.text,
  //                         inputFormatters: [
  //                           LengthLimitingTextInputFormatter(
  //                             controller.maxCommentLenght,
  //                           ),
  //                         ],
  //                         onChanged:
  //                             (text) =>
  //                                 controller.calculatePercentage(text.length),
  //                         validator: (value) {
  //                           if (value == null || value.isEmpty) {
  //                             return 'Comment is Required ';
  //                           }
  //                           return null;
  //                         },
  //                         controller: commetController,
  //                       ),
  //                     ),
  //                     SizedBox(width: 6.0),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Obx(
  //                           () => CustomCicularButton(
  //                             size: 47,

  //                             backgroundColor: Colors.grey.shade200,
  //                             isLoading: controller.sendCommentISLoading.value,
  //                             loadingValue: controller.commentLength.value,
  //                             onPressed: () async {
  //                               if (!formKey.currentState!.validate()) return;
  //                               review = ReviewModel(
  //                                 userId: uid,
  //                                 productId: productId,
  //                                 ratingValue: ratingValue,
  //                                 comment: commetController.text,
  //                               );

  //                               if (review == null) return;

  //                               final result = await controller.sendReview(
  //                                 review!,
  //                               );
  //                               result ? Get.back() : null;
  //                               commetController.clear();
  //                             },
  //                             child: Icon(PhosphorIconsRegular.paperPlaneRight),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(height: 10.0),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
