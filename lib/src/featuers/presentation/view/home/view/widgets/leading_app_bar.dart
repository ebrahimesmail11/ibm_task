
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadingAppBar extends StatelessWidget {
  const LeadingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8..w, vertical: 8.h),
      child: const CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
            'https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-1170x780.jpg'), // صورة الشخصية
      ),
    );
  }
}
