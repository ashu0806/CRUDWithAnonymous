import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_firebase/home/shared/providers.dart';

class ItemListError extends HookConsumerWidget {
  const ItemListError({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(itemServicesNotifierProvider.notifier)
                  .retrieveItems(
                    isRefreshing: true,
                  );
            },
            child: const Text(
              "Retry",
            ),
          ),
        ],
      ),
    );
  }
}
