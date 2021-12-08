import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //Show dialog
  static void showErrorDialog(
      {String title = "Error", String description = "Something went wrong"}) {
    Get.dialog(AlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        description,
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (Get.isDialogOpen!) {
              Get.back();
            }
          },
          child: Text(
            'OK',
          ),
        ),
      ],
    ));
  }


  static void showConfirmDialog(
      {String title = "Confirm",
      String description = "Something to confirm",
      Function? confirmCallBack,
      Function? cancelCallBack}) {
    Get.dialog(AlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        description,
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (Get.isDialogOpen!) {
              Get.back();
            }
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        confirmCallBack != null
            ? TextButton(
                onPressed: () {
                  Get.back();
                  confirmCallBack();
                },
                child: Text(
                  'OK',
                ),
              )
            : const SizedBox(),
      ],
    ));
  }
//Show toast
//Show snackbar
//Show loading
//Hide loading
}
