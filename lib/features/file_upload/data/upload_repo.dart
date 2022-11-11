import 'dart:async';

import 'package:bakery_order_system/config/setup/ioc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class UploadRepository {
  final FirebaseStorage _db = IOC.injectSync<FirebaseStorage>('storage');

  Stream<TaskSnapshot> uploadFile(
      Uint8List image, String name, String reference) {
    try {
      var fileReference = _db.ref().child('$reference/$name');
      return fileReference.putData(image).asStream();
    } catch (e) {
      throw Exception("Upload file error");
    }
    // try {} catch (e) {
    //   print("Couldn't upload file:${fileReference.name}");
    // }

    // print('File Uploaded:${fileReference.name}');
    // String storageReference = "";
    // await fileReference.getDownloadURL().then((fileURL) {
    //   storageReference = fileURL;
    //   return fileURL;
    // });
    // return storageReference;
  }
}
