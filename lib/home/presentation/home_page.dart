// ignore_for_file: invalid_use_of_protected_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_firebase/auth/shared/providers.dart';
import 'package:shopping_list_firebase/core/shared/exceptions.dart';
import 'package:shopping_list_firebase/core/utils/app_constant.dart';
import 'package:shopping_list_firebase/home/domain/item_model.dart';
import 'package:shopping_list_firebase/home/shared/providers.dart';
import 'package:shopping_list_firebase/home/widgets/add_item_dialog.dart';
import 'package:shopping_list_firebase/home/widgets/item_list_error.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(firebaseAuthStateNotifierProvider.notifier);
    final itemList = ref.watch(itemServicesNotifierProvider);
    useEffect(
      () {
        stateNotifier.appStarts();
        ref.refresh(itemServicesNotifierProvider);
        return null;
      },
      [],
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Shopping List",
          ),
          leading: IconButton(
            onPressed: () async {
              log("message");
              stateNotifier.signOut();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                AddItemDialog.show(
                  context,
                  Item.empty(),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                  ),
                  Text(
                    "Add Item",
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
          ],
        ),
        body: itemList.when(
          data: (items) => items.isEmpty
              ? Center(
                  child: Text(
                    "Tap + to add an item",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 12.w,
                      ),
                      child: Container(
                        height: 50.h,
                        width: 1.sw,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: item.obtained ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(
                            8.r,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(
                                1.2,
                                1.2,
                              ),
                              color: Colors.grey,
                              spreadRadius: 0.8,
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: ListTile(
                          key: ValueKey(item.id),
                          title: Text(
                            item.name,
                          ),
                          leading: Checkbox(
                            value: item.obtained,
                            onChanged: (value) {
                              ref
                                  .watch(itemServicesNotifierProvider.notifier)
                                  .updateItem(
                                    updatedItem: item.copyWith(
                                      obtained: !item.obtained,
                                    ),
                                  );
                              setState(() {});
                            },
                          ),
                          trailing: InkWell(
                            onTap: () async {
                              ref
                                  .read(itemServicesNotifierProvider.notifier)
                                  .deleteItem(
                                    itemId: item.id!,
                                  );
                              await AppConstant.showSnackbar(
                                context,
                                "Item deleted successfully",
                                Colors.black,
                              );
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            AddItemDialog.show(
                              context,
                              item,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
          error: (error, stackTrace) {
            return ItemListError(
              message: error is CustomException
                  ? error.msg!
                  : 'Something went wrong',
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
