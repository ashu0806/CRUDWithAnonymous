import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin AppConstant {
  static showLoader(context, String message, {Color? color}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 60.h,
            width: 260.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            child: Row(
              children: [
                const CircularProgressIndicator(),
                Expanded(
                  child: Text(
                    message,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showSnackbar(context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(
        message,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
