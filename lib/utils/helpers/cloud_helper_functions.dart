
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// Helper function for cloud-related operations
class  TCloudHelperFunction{
  
// helper fucntion for cloud-related operations
// Helper function to check the state of a single database recored

// Return a Widget based on the state of the snapshot .
// if data is still loading ,it returns a Circular ProgressIndicator
// if an error occurs . it returns a generic error message
// Otherwise if return null

  static  Widget? checkSingleRecoredState<T>(AsyncSnapshot<T> snapshot){
    if(snapshot.connectionState == CircularProgressIndicator()){
      return const Center(child: CircularProgressIndicator());
    }

    if(!snapshot.hasData || snapshot.data == null){
      return const Center(child: Text('Somthing went wrong'),);
    }

    if(snapshot.hasError){
      return const Center(child: Text('Something went wrong.'),);
    }

    return null;
  }

  // Helper function to check the state of multiple (list) databases recored

  // Returns a Widget basee on the state of the snapshots.

  // If data is still loading , it returns a CircularProgressIndicator
  // if not data is found , it returns a generic "Not data Found" message or a custom nothingFoundWeight if provides
  // if an error occurs , if reuturns a generic error message.
  // Otherwise it returns null

  static Widget? checkMultiRecoredState<T>({required AsyncSnapshot<List<T>> snapshot, Widget? loader,Widget? error, Widget? nothingFound}){
    if(snapshot.connectionState == ConnectionState.waiting){
      if(loader != null) return loader;
      return const Center(child: CircularProgressIndicator(),);
    }

    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
      if(nothingFound != null ) return nothingFound;
      return const Center(child: Text('No Data Found!'),);
    }

    if(snapshot.hasError){
      if(error != null) return error;
      return const Center(child: Text('Somthing went wrong.'),);
    }
    return null;
  }

  // Create a reference with an initail file path and name and retrieve the download Url
  static Future<String> getURLFromFilePathAndName(String path) async{
    try {
      if(path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw "Nothing";
    } catch (e) {
      throw "Something went wrong.";
    }
  }

} 

