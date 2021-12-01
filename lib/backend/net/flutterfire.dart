import 'dart:io';
import 'package:argon_flutter/backend/models/publication-model.dart';
import 'package:argon_flutter/backend/models/user-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

Future<bool> addInformation(String firstName, String lastName, String address,
    String phoneNumber) async {
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

Future<void> uploadUserImage(File file) async {
  try {
    User _user = FirebaseAuth.instance.currentUser;
    final fileName = _user.uid;
    final destination = 'user_images/$fileName';
    final ref = FirebaseStorage.instance.ref(destination);

    UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(() => ref.getDownloadURL().then((value) {
          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('Users')
              .doc(_user.uid)
              .collection('Info')
              .doc("info");
          documentReference.update({"image": value});
        }));
    print('File Uploaded');
  } on FirebaseException catch (e) {
    return null;
  }
}

/// ******************************************************************************************************/
/// ***************************************** PUBLICATIONS ***********************************************/
///

/*
  Primer paso, addPublication y obtengo la referencia de ese documento.
  Segundo paso, llamo al image picker para elegir las imagenes de la publicacion
  Tercer paso llamo a savePublicationImages con la referencia al documento en el que
  quiero que se guarden (el que me devolvio addPublication)
 */
Future<DocumentReference> addPublication(
    PublicationModel publicationModel) async {
  try {
    User _user = FirebaseAuth.instance.currentUser;
    publicationModel.uid = _user.uid;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Publications');
    DocumentReference result =
        await collectionReference.add(publicationModel.toMap());
    await result.update({
      "id": result.id
    });
    publicationModel.id = result.id;
    return result;
  } catch (e) {
    return null;
  }
}

Future<void> savePublicationImages(
    List<File> _images, DocumentReference ref) async {
  _images.forEach((image) async {
    String imageURL = await uploadFile(image);
    ref.update({
      "images": FieldValue.arrayUnion([imageURL])
    });
  });
}

// este metodo es auxiliar, no llamarlo.
Future<String> uploadFile(File _image) async {
  final fileName = _image.toString();
  final ref = FirebaseStorage.instance.ref('user_images/$fileName');
  String URL = "";
  UploadTask uploadTask = ref.putFile(_image);
  await uploadTask.whenComplete(() => ref.getDownloadURL().then((value) {
        URL = value;
      }));
  return URL;
}

Future<bool> removePublication(String id) async {
  try {
    FirebaseFirestore.instance.collection('Publications').doc(id).delete();
    return true;
  } catch (e) {
    return false;
  }
}

Future<List<PublicationModel>> getUserPublications() async {
  try {
    User _user = FirebaseAuth.instance.currentUser;
    List<PublicationModel> ans = [];
    await FirebaseFirestore.instance
        .collection('Publications')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(_user.uid == doc['uid']) {
          PublicationModel pm = PublicationModel();
          print(doc["name"]);
          pm.name = doc['name'];
          pm.uid = doc['uid'];
          pm.detail = doc['detail'];
          pm.category = doc['category'];
          pm.price = doc['price'];
          pm.timeUnit = doc['timeUnit'];
          pm.isFavourite = doc['isFavourite'];
          pm.id = doc['id'];
          for (int i = 0; i < doc['images'].length; i++) {
            pm.images.add(doc['images'][i]);
          }
          ans.add(pm);
        }
      });
    });

    return ans;
  } catch (e) {
    return null;
  }
}

Future<List<PublicationModel>> getAllPublications() async {
  try {
    List<PublicationModel> ans = [];
    await FirebaseFirestore.instance
        .collection('Publications')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        PublicationModel pm = PublicationModel();
        print(doc["name"]);
        pm.name = doc['name'];
        pm.uid = doc['uid'];
        pm.detail = doc['detail'];
        pm.category = doc['category'];
        pm.price = doc['price'];
        pm.timeUnit = doc['timeUnit'];
        pm.isFavourite = doc['isFavourite'];
        pm.id = doc['id'];
        for (int i = 0; i < doc['images'].length; i++) {
          pm.images.add(doc['images'][i]);
        }
        ans.add(pm);
      });
    });

    return ans;
  } catch (e) {
    return null;
  }
}

Future<List<PublicationModel>> getPublicationsByCategory(
    String category) async {
  try {
    User _user = FirebaseAuth.instance.currentUser;
    List<PublicationModel> ans = [];
    await FirebaseFirestore.instance
        .collection('Publications')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(category == doc['category']) {
          PublicationModel pm = PublicationModel();
          print(doc["name"]);
          pm.name = doc['name'];
          pm.uid = doc['uid'];
          pm.detail = doc['detail'];
          pm.category = doc['category'];
          pm.price = doc['price'];
          pm.timeUnit = doc['timeUnit'];
          pm.isFavourite = doc['isFavourite'];
          pm.id = doc['id'];
          for (int i = 0; i < doc['images'].length; i++) {
            pm.images.add(doc['images'][i]);
          }
          ans.add(pm);
        }
      });
    });

    return ans;
  } catch (e) {
    return null;
  }
}

Future<void> addFavourite(PublicationModel publicationModel) async {
  DocumentReference documentReference = FirebaseFirestore.instance.collection('Publications').doc(publicationModel.id);
  await documentReference.update({
    "isFavourite": true
  });
  publicationModel.isFavourite = true;
}

Future<void> removeFavourite(PublicationModel publicationModel) async {
  print(publicationModel.id);
  DocumentReference documentReference = FirebaseFirestore.instance.collection('Publications').doc(publicationModel.id);
  await documentReference.update({
    "isFavourite": false
  });
  publicationModel.isFavourite = false;
}
/// ******************************************************************************************************/
///
/// ****************************************** ORDERS ****************************************************/
///
