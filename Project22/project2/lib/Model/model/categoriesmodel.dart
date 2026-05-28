class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImge;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImge});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImge = json['categories_imge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_imge'] = this.categoriesImge;
    return data;
  }
}