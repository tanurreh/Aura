// import 'dart:io';
// import 'dart:typed_data';
// import 'package:computech/app/widgets/widgets.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// Future<String> uploadImageToFirebaseStorage(Uint8List imageBytes) async {
//   final String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
//   final Reference firebaseStorageRef =
//       FirebaseStorage.instance.ref().child('images/$fileName');
//   final UploadTask uploadTask = firebaseStorageRef.putData(imageBytes);
//   final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});
//   final String downloadUrl = await storageSnapshot.ref.getDownloadURL();

//   return downloadUrl;
// }

// Future<String> storeFileToFirebase(Uint8List imageBytes) async {
//   UploadTask uploadTask = FirebaseStorage.instance
//       .ref()
//       .child('Signature')
//       .putData(imageBytes, SettableMetadata(contentType: "image/jpeg"));
//   ;
//   TaskSnapshot snap = await uploadTask;
//   String downloadUrl = await snap.ref.getDownloadURL();
//   return downloadUrl;
// }

// Future<String> ToFirebase(File imageBytes) async {
//   showLoadingDialog(message: "Processing...");
//   final String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
//   UploadTask uploadTask = FirebaseStorage.instance
//       .ref()
//       .child('Signature/$fileName')
//       .putFile(imageBytes);
//   ;
//   TaskSnapshot snap = await uploadTask;
//   String downloadUrl = await snap.ref.getDownloadURL();
//    hideLoadingDialog();
//   return downloadUrl;
// }

//  File createFileFromUint8List(Uint8List uint8list) {
//     final tempDir = Directory.systemTemp;
//     final tempFile = File('${tempDir.path}/temp_image.jpg');
//     tempFile.writeAsBytesSync(uint8list);
//     return tempFile;
//   }