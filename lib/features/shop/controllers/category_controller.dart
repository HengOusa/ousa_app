


import 'package:get/get.dart';
import 'package:ousa_app/data/repositories/categories/category_repository.dart';
import 'package:ousa_app/features/shop/models/category_model.dart';
import 'package:ousa_app/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;


  @override
  void onInit() {
   fetchCategories();
    super.onInit();
  }

  // Load categories
  Future<void> fetchCategories() async{
    try {
      // Show loader while loading categories
      isLoading.value = true;

      //Fetch categories from data source (Firebase . API ,etc)
      final categories = await _categoryRepository.getAllCategories();


      // update the categories 
      allCategories.assignAll(categories);

      // Filter features category
      featuredCategories.assignAll(allCategories.where((category)=> category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }finally{
      // Remove Loaders
      isLoading.value = false;
    }
  }
}