import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/Base/constant/appcolors.dart';
import 'package:project2/Base/constant/appimages.dart';
import 'package:project2/Base/funcation/column_language.dart';
import 'package:project2/Controllers/User/home/home_controller.dart';
import 'package:project2/Model/model/categoriesmodel.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List image = [
      Appimages.carpenterImge,
      Appimages.dirverImge,
      Appimages.electricalImge,
      Appimages.farmerImge,
      Appimages.builderlImge,
      Appimages.mechaniclImge,
      Appimages.painterlImge,
      Appimages.plumberlImge,
      Appimages.welderImge,
    ];
    HomeController controller = Get.put(HomeController());
    ;
    return SizedBox(
      height: 130,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return CategoriesDetails(
              categoriesName: controller.categories[i]['categories_name'],
              categoriesNameAr: controller.categories[i]['categories_name_ar'],
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[i]),
              child: Image.asset("${image[i]}"),
            );
          }),
    );
  }
}

class CategoriesDetails extends GetView<HomeController> {
  final Widget? child;
  final CategoriesModel categoriesModel;
  final String categoriesName;
  final String categoriesNameAr;

  const CategoriesDetails({
    super.key,
    required this.categoriesModel,
    required this.child,
    required this.categoriesName,
    required this.categoriesNameAr,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        InkWell(
          onTap: () {
            controller.goToWorker(categoriesName, categoriesNameAr);
          },
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Appcolors.lightblue,
              borderRadius: BorderRadius.circular(90),
            ),
            child: child,
          ),
        ),
      ]),
      const SizedBox(
        height: 5,
      ),
      Text(
        "${culomnLanguge(categoriesModel.categoriesName, categoriesModel.categoriesNameAr)}",
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
      ),
    ]);
  }
}
