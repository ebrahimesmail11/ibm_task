import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/common/base/text_styles.dart';

class MoreConversationsPerson extends StatelessWidget {
  const MoreConversationsPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading:const  CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
            'https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-1170x780.jpg'), // صورة الشخصية
      ),
      title: Text('Hailey Cook', style: context.displayMedium!.copyWith(
                        color: Colors.black, fontWeight: TextStyles.medium),),
      subtitle: Text('thank you' , style: context.titleMedium!.copyWith(
                                color: Colors.grey,
                                fontWeight: TextStyles.medium,
                                fontSize: 13.sp),),        
      trailing:  Text('Fri', style: context.titleMedium!.copyWith(
                                color: Colors.grey,
                                fontWeight: TextStyles.medium,
                                fontSize: 13.sp),),          
    );
  }
}