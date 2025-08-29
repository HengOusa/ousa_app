

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured ,
  });

  // Emty Helper Funtion
  static CategoryModel empty() => CategoryModel(id: '',name: '',image: '',isFeatured: false);
  

  // Convert model to Json structure so that you can store data in Firebase
  Map<String,dynamic> toJson(){
    return {
      'Name': name,
      'Image': image,
      'ParentId':parentId,
      'IsFeatured':isFeatured,
    };
  }

  // Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> doucment){
    if(doucment.data() != null){
      final data = doucment.data()!;

      // Map Json Record to the Model
      return CategoryModel(
        id: doucment.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    }else{
      return CategoryModel.empty();
    }
  }

}