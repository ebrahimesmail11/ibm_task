import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/extensions.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
          child: Text(
            'Sponsored',
            style: context.displayMedium!.copyWith(
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
