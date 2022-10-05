import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_firebase/core/utils/app_constant.dart';
import 'package:shopping_list_firebase/home/domain/item_model.dart';
import 'package:shopping_list_firebase/home/shared/providers.dart';

class AddItemDialog extends HookConsumerWidget {
  static void show(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (context) {
        return AddItemDialog(
          item: item,
        );
      },
    );
  }

  const AddItemDialog({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;
  bool get isUpdating => item.id != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(
      text: item.name,
    );
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(
          20.sm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Item name',
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isUpdating ? Colors.orange : Colors.green,
                ),
                onPressed: isUpdating
                    ? () {
                        ref
                            .read(itemServicesNotifierProvider.notifier)
                            .updateItem(
                              updatedItem: item.copyWith(
                                name: textController.text.trim(),
                                obtained: item.obtained,
                              ),
                            );

                        Navigator.of(context).pop();
                        AppConstant.showSnackbar(
                          context,
                          "Item updated",
                          Colors.black,
                        );
                      }
                    : () {
                        ref.read(itemServicesNotifierProvider.notifier).addItem(
                              name: textController.text.trim(),
                            );

                        Navigator.of(context).pop();
                        AppConstant.showSnackbar(
                          context,
                          "Item added",
                          Colors.black,
                        );
                      },
                child: Text(
                  isUpdating ? "Update" : "Add",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
