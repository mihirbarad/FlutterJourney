// import 'package:cloud_firestore/cloud_firestore.dart';

// FirebaseFirestore _firestore = FirebaseFirestore.instance;
// Future<void> uploadingData(String _productName, String _productPrice,
//     String _imageUrl, bool _isFavourite) async {
//   await _firestore.collection("products").add({
//     'productName': _productName,
//     'productPrice': _productPrice,
//     'imageUrl': _imageUrl,
//     'isFavourite': _isFavourite,
//   });
// }

// Future<void> editProduct(bool _isFavourite, String id) async {
//   await Firestore.instance
//       .collection("products")
//       .document(id)
//       .updateData({"isFavourite": !_isFavourite});
// }

// Future<void> deleteProduct(DocumentSnapshot doc) async {
//   await _firestore.collection("products").delete();
// }
