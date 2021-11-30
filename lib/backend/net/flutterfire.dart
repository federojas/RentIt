import 'package:argon_flutter/backend/models/product-model.dart';
import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/models/user-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final fireStoreInstance = FirebaseFirestore.instance;


/// ****************************************USERS*********************************************************/
Future<String> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return "Success";
  } catch (e) {
    // esto no anda, seguir revisando o sino devolver siempre lo mismo.
    switch (e.code) {
      case "ERROR_USER_NOT_FOUND":
        return "User not found";
        break;
      default:
        return "An undefined Error happened.";
    }
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


Future<bool> addInformation(String firstName, String lastName, String address, String phoneNumber) async {
  try {
    User _user = FirebaseAuth.instance.currentUser;

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(_user.uid)
        .collection('Info')
        .doc("info");

    UserModel userModel = UserModel();
    userModel.email = _user.email;
    userModel.address = address;
    userModel.firstName = firstName;
    userModel.lastName = lastName;
    userModel.phoneNumber = phoneNumber;

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

/* en el front yo puedo hacer esto:
DocumentSnapshot userInfo = await getUserInfo();

luego para acceder:
userInfo.data['lastName']
userInfo.data['firstName']
etc
 */
Future<DocumentSnapshot> getUserInfo() async {
  try {
    User _user = FirebaseAuth.instance.currentUser;

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(_user.uid)
        .collection('Info')
        .doc("info");

    DocumentSnapshot snapshot = await documentReference.get();
    return snapshot;
  } catch (e) {
    return null;
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


/*
para usar los productos puedo hacer esto:
for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      var fooValue = data['foo']; // <-- Retrieving the value.
    }
 */
Future<QuerySnapshot> getUserProducts() async {
  try {
    User _user = FirebaseAuth.instance.currentUser;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(_user.uid)
        .collection('Products');
    QuerySnapshot querySnapshot = await collectionReference.get();

    return querySnapshot;

  } catch (e) {
    return null;
  }
}

Future<bool> addPublication(String name, ProductModel productModel, double price) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Publications');

    PublicationModel publicationModel = PublicationModel();
    publicationModel.name = name;
    publicationModel.productModel = productModel;
    publicationModel.price = price;
    publicationModel.uid = uid;
    await collectionReference.add(publicationModel.toMap());
    return true;
  } catch (e) {
    return false;
  }
}

/*
para usar las publicaciones puedo hacer esto:
for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      var fooValue = data['foo']; // <-- Retrieving the value.
    }
 */
Future<QuerySnapshot> getPublications() async {
  try {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Publications');
    QuerySnapshot querySnapshot = await collectionReference.get();
    return querySnapshot;

  } catch (e) {
    return null;
  }
}

/*
para usar las publicaciones puedo hacer esto:
for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      var fooValue = data['foo']; // <-- Retrieving the value.
    }
 */
Future<QuerySnapshot> getUserPublications() async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Publications').where('uid', isEqualTo: uid);
    QuerySnapshot querySnapshot = await collectionReference.get();
    return querySnapshot;

  } catch (e) {
    return null;
  }
}

Future<bool> removePublication(String id) async {
  FirebaseFirestore.instance
      .collection('Publications')
      .doc(id)
      .delete();
  return true;
}


/// ******************************************************************************************************/
///
/// ****************************************** ORDERS ****************************************************/