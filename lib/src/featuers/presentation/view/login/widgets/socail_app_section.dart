import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibm_task/src/common/base/extensions.dart';

class SocailAppSection extends StatelessWidget {
  const SocailAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        50.horizontalSpace,
        CircleAvatar(
          radius: 25,
          backgroundColor: context.colors.blueDark,
          child: FaIcon(
            FontAwesomeIcons.facebookF,
            size: 25.sp,
            color: Colors.white,
          ),
        ),
        CircleAvatar(
            radius: 25,
            backgroundColor: context.colors.blue,
            child: FaIcon(
              FontAwesomeIcons.twitter,
              size: 25.sp,
              color: Colors.white,
            )),
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.red,
          child: FaIcon(
            FontAwesomeIcons.google,
            size: 25.sp,
            color: Colors.white,
          ),
        ),
        50.horizontalSpace,
      ],
    );
  }
}
