import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
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
    );
  }
}
