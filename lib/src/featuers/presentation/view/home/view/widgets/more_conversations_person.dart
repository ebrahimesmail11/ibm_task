import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';
import 'package:ibm_task/src/common/network/models/home/person.dart';


class MoreConversationsPerson extends StatelessWidget {
  const MoreConversationsPerson({super.key, required this.person});
  final Person? person;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
      radius: 25,
      backgroundImage: CachedNetworkImageProvider(
            person?.image ??  'https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-1170x780.jpg',  // Provide a fallback image URL
      ),
      onBackgroundImageError: (error, stackTrace) {
        // Handle background image error if needed
        log('Failed to load image: $error');
      },
        child:const  Icon(Icons.person, color: Colors.grey),
            ),
      title: Text(
        person?.userName.toString() ?? "",
        style: context.displayMedium!
            .copyWith(color: Colors.black, fontWeight: TextStyles.medium),
      ),
      subtitle: Text(
        person?.message.toString() ?? "",
        style: context.titleMedium!.copyWith(
            color: Colors.grey, fontWeight: TextStyles.medium, fontSize: 13.sp),
      ),
      trailing: Text(
        person?.time ?? 'Fri',
        style: context.titleMedium!.copyWith(
            color: Colors.grey, fontWeight: TextStyles.medium, fontSize: 13.sp),
      ),
    );
  }
}