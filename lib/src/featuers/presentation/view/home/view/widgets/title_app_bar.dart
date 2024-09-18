import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/extensions.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h, 
      decoration: BoxDecoration(
        color: context.colors.grey!.withOpacity(.3),
        borderRadius: BorderRadius.circular(20), 
      ),
      child:   TextField(
        cursorColor: Colors.grey,
        style: context.displayMedium!.copyWith(
          color: context.colors.grey!.withOpacity(0.5),
          fontSize: 12.sp,
        ),
        decoration: InputDecoration(
    
          hintText: 'Search', 
          prefixIcon:
               Icon(Icons.search, color: context.colors.grey), 
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              vertical: 10.h),
        ),
      ),
    );
  }
}
