import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final fireStoreInstance = FirebaseFirestore.instance;

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

Future<bool> addProduct(String name, String detail, String category) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Products');

    await collectionReference.add({
      "Name": name,
      "Detail": detail,
      "Category": category,
    });
    return true;
  } catch (e) {
    return false;
  }
}