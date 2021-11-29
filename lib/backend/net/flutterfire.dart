import 'package:argon_flutter/backend/models/product-model.dart';
import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/models/user-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final fireStoreInstance = FirebaseFirestore.instance;


/// ****************************************USERS*********************************************************/
Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('La contraseña es débil');
    } else if (e.code == 'email-already-in-use') {
      print('Email en uso.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}


Future<bool> addInformation(String firstName, String lastName, String age) async {
  try {
    User _user = FirebaseAuth.instance.currentUser;

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(_user.uid)
        .collection('Info')
        .doc("info");

    UserModel userModel = UserModel();
    userModel.email = _user.email;
    userModel.age = age;
    userModel.firstName = firstName;
    userModel.lastName = lastName;

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set(userModel.toMap());
        return true;
      }
      transaction.update(documentReference, userModel.toMap());
      return true;
    });
    return true;
  } catch (e) {
    return false;
  }
}


/// ******************************************************************************************************/



/// ************************************PRODUCTS /  PUBLICATIONS******************************************/
///
Future<bool> addProduct(String name, String detail, String category) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Products');
    ProductModel productModel = ProductModel();
    productModel.name = name;
    productModel.detail = detail;
    productModel.category = category;
    await collectionReference.add(productModel.toMap());
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeProduct(String id) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Products')
      .doc(id)
      .delete();
  return true;
}

Future<bool> addPublication(String name, ProductModel productModel, double price) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Publications');

    PublicationModel publicationModel = PublicationModel();
    publicationModel.name = name;
    publicationModel.productModel = productModel;
    publicationModel.price = price;
    await collectionReference.add(publicationModel.toMap());
    return true;
  } catch (e) {
    return false;
  }
}

// falta el delete de publications


/// ******************************************************************************************************/
///
/// ****************************************** ORDERS ****************************************************/