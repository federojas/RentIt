
import 'package:argon_flutter/backend/net/flutterfire.dart';
import 'package:argon_flutter/constants/Theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class settingsUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "settings UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget{

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}
class _EditProfilePageState extends State<EditProfilePage>{
  bool showPassword = false;
  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();
  final phoneNumberEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    String userName, lastName,address,phoneNumber;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: MyTheme.primary,
          ),
          onPressed: () =>
          {
            showAlertDialog(context),
          //  Navigator.pop(context),

          },
        ),
        actions: [
        ],
      ),
    body: Container(
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Text(
            "Editar Perfil",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          //imagen de perfil
          Center(
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/rentit-22348.appspot.com/o/products_images%2Fimage_picker3710646077128464784.png?alt=media&token=36438263-70fd-4001-b8ae-cf3e976a50c3",
                          ))),
                ),
                Positioned(
                  bottom:0,
                  right: 0,
                  child:CircleAvatar(
                    radius: 20,
                    backgroundColor: MyTheme.primary,
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed:() =>
                      {
                        showPictureDialog(context),
                        //  Navigator.pop(context),

                      },
                    ),)
                )
                // Positioned(
                //     bottom: 1,
                //     right: 1,
                //     child: Container(
                //       height: 40,
                //       width: 40,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         border: Border.all(
                //           width: 4,
                //           color: Theme.of(context).scaffoldBackgroundColor,
                //         ),
                //         color: MyTheme.primary,
                //       ),
                //
                //
                //     )),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),

           FutureBuilder(
               future: getUserInfo(),
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   userName = snapshot.data['firstName'];
                   return buildTextField(
                       "Nombre", userName, false, firstNameEditingController);
                 } else {
                   return LinearProgressIndicator();
                 }
               }),
           FutureBuilder(
               future: getUserInfo(),
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   lastName = snapshot.data['lastName'];
                   return buildTextField(
                       "Apellido", lastName, false, lastNameEditingController);
                 } else {
                   return LinearProgressIndicator();
                 }
               }),
           FutureBuilder(
               future: getUserInfo(),
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   address = snapshot.data['address'];
                   if (address == '') {
                     return buildTextField("Dirección de Entrega", "-", false,
                         addressEditingController);
                   }
                   return buildTextField("Dirección de Entrega", address, false,
                       addressEditingController);
                 } else {
                   return LinearProgressIndicator();
                 }
               }),
           FutureBuilder(
               future: getUserInfo(),
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   phoneNumber = snapshot.data['phoneNumber'];
                   if (phoneNumber == '') {
                     return buildTextField(
                         "Telefono", "-", false, phoneNumberEditingController);
                   }
                   return buildTextField("Telefono", phoneNumber, false,
                       phoneNumberEditingController);
                 } else {
                   return LinearProgressIndicator();
                 }
               }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () async {

                  if(firstNameEditingController.text==''){
                    firstNameEditingController.text=userName;
                  }
                  if(lastNameEditingController.text==''){
                    lastNameEditingController.text=lastName;
                  }
                  if(addressEditingController.text==''){
                    addressEditingController.text=address;
                  }
                  if(phoneNumberEditingController.text==''){
                    phoneNumberEditingController.text=phoneNumber;
                  }
                  bool updated = await addInformation(
                      firstNameEditingController.text,
                      lastNameEditingController.text,
                      addressEditingController.text,
                      phoneNumberEditingController.text);
                  if (updated) {
                    successDialog(context);

                    // un toast
                  } else {
                    // otro toast, o cargando, vemos que queda mejor
                  }


                },
                color: MyTheme.primary,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Guardar",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white),
                ),
              ),

            ],
          )
        ],
      ),
    ),
    );
  }
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              //fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Si"),
      onPressed:  () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.pop(context);

      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cuidado"),
      content: Text("Si regresas se perderán todos los datos no guardados\n ¿Desea continuar?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
Future<bool> successDialog( BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: Text('Datos cargados con éxito',style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok',style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
openCamera(){
  PickedFile pickedFile = ( ImagePicker().pickImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  )) as PickedFile;
}
openGallery(){
  PickedFile pickedFile = ( ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  )) as PickedFile;
}
Future<void> showPictureDialog(BuildContext context) {
  return showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                GestureDetector(
                  child: new Text('Tomar una foto de la cámara'),
                  onTap: openCamera,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  child: new Text('Seleccionar de la galería'),
                  onTap: openGallery,
                ),
              ],
            ),
          ),
        );
      });
}

