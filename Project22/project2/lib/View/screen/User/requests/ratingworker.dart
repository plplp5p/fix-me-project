import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/constant/appimages.dart';
import 'package:project2/Controllers/User/request/compeletedorders_controller.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showdialog(BuildContext context, String workerusername) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RatingDialog(
      initialRating: 4.0,
      title: const Text(
        'Rating Worker',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: const Text(
        'Please rate your experience to help us improve our services',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      image: Image.asset(
        Appimages.logo,
        width: 150,
        height: 150,
      ),
      submitButtonTextStyle: const TextStyle(
          color: Appcolors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      submitButtonText: 'Submit',
      commentHint: 'Leave a comment',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        UserCompeletedOrdersController controller = Get.find();
        controller.ratingWorkerService(
            workerusername, response.rating, response.comment);
        print('rating: ${response.rating}, comment: ${response.comment}');
      },
    ),
  );
}
