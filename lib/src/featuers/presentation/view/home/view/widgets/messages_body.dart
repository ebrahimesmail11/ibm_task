import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/app_constants.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/featuers/presentation/view/home/view/widgets/more_conversations_person_list_view.dart';
import 'package:ibm_task/src/featuers/presentation/view/home/view/widgets/orignal_coast_clothing_section.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                const Expanded(
                  flex: 5,
                  child: OrignalCoastClothingSection(),
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
           LimitedBox(
            maxHeight: 600.h,
            child: const MoreConversationsPersonListView(),
          )
        ],
      ),
    );
  }
}
