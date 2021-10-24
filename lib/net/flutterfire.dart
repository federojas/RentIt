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

Future<bool> addInformation(String firstName, String lastName, int age) async {
  /* me gustaria mejorar al metodo para que puedas actualizar sólo algunos campos
  y no necesariamente todos.
   */
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Info')
        .doc("info");
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'firstName': firstName, 'lastName': lastName, 'age': age});
        return true;
      }
      transaction.update(documentReference, {'firstName': firstName, 'lastName': lastName, 'age': age});
      return true;
    });
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