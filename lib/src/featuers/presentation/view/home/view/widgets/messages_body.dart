import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';
import 'package:ibm_task/src/featuers/presentation/view/home/view/widgets/more_conversations_person_list_view.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
          child: Text(
            AppConstants.sponsored,
            style: context.displayMedium!.copyWith(
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: const CachedNetworkImageProvider(
                    'https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-1170x780.jpg',
                  ),
                  onBackgroundImageError: (error, stackTrace) {
                    // Handle background image error if needed
                    log('Failed to load image: $error');
                  },
                ),
              ),
              Expanded(
                flex: 5,
                child: ExpansionTile(
                  collapsedBackgroundColor: Colors
                      .transparent, // إزالة الخلفية تحت العنوان في الوضع المغلق
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide
                        .none, // إلغاء أي خط جانبي (الخط العلوي والسفلي)
                  ),
                  title: Text(
                    AppConstants.orginal,
                    style: context.displayMedium!.copyWith(
                        color: Colors.black, fontWeight: TextStyles.medium),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0.w),
                      child: Column(
                        children: [
                          Text(
                            AppConstants.subtitle,
                            style: context.titleMedium!.copyWith(
                                color: Colors.grey,
                                fontWeight: TextStyles.medium,
                                fontSize: 13.sp),
                          ),
                          10.verticalSpace,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: 'https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-1170x780.jpg',
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                const   Icon(Icons.error),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0.h),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(AppConstants.freeMoney,
                                      style: context.titleMedium!.copyWith(
                                        fontSize: 14.h,
                                        fontWeight: TextStyles.medium,
                                        color: Colors.grey,
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                            color: context.colors.blue!),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      AppConstants.shopNow,
                                      style: context.displayMedium!.copyWith(
                                        color: context.colors.blue,
                                        fontSize: 12.sp,
                                        fontWeight: TextStyles.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        30.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
          child: Text(
            AppConstants.more,
            style: context.displayMedium!.copyWith(
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ),
        10.verticalSpace,
        const Expanded(
          child: MoreConversationsPersonListView(),
        )
      ],
    );
  }
}
