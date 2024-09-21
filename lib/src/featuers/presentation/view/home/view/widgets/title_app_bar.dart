

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_task/src/common/base/extensions.dart';
import 'package:ibm_task/src/featuers/presentation/view_models.dart/home/home_view_model.dart';
import 'package:provider/provider.dart';

class TitleAppBar extends StatefulWidget {
  const TitleAppBar({
    super.key,
  });

  @override
  State<TitleAppBar> createState() => _TitleAppBarState();
}

class _TitleAppBarState extends State<TitleAppBar> {
  late TextEditingController _controller;
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: context.colors.grey!.withOpacity(.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _controller,
        onChanged:(value){
          context.read<HomeViewModel>().searchByName(value);
        },
        cursorColor: Colors.grey,
        style: context.displayMedium!.copyWith(
          color: Colors.black,
          fontSize: 12.sp,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: context.colors.grey,),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        ),
      ),
    );
  }
}


