
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';

class OrignalCoastClothingSection extends StatelessWidget {
  const OrignalCoastClothingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
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
    );
  }
}