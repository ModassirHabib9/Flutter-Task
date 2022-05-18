// import 'package:flutter/material.dart';

// class Extra extends StatefulWidget {
//   const Extra({ Key? key }) : super(key: key);

//   @override
//   _ExtraState createState() => _ExtraState();
// }

// class _ExtraState extends State<Extra> {
//   @override
//   Widget build(BuildContext context) {
//     return 

// Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Add New Product'),
//       ),
//       body: Card(
//         child: Container(
//           padding: EdgeInsets.all(10),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               shrinkWrap: true,
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     labelText: 'Product Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Product Name Required';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     productData['p_name'] = value!;
//                   },
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Product Price'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Product Price Required';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     productData['p_price'] = value!;
//                   },
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(labelText: 'Phone Number'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Phone Number  Required';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     productData['phone_number'] = value!;
//                   },
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
                
//                 SizedBox(
//                   height: 30,
//                 ),
//                 ElevatedButton(
//                   onPressed: addProduct,
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );



// Add this on top

//   final _formKey = GlobalKey<FormState>();
//   Map<String, dynamic> productData = {
//     "p_name": "",
//     "p_price": "",
//     "p_upload_date": DateTime.now().millisecondsSinceEpoch,
//     "phone_number": ""
//   };

// addProduct() {
//      _formKey.currentState!.save();
//     if (_formKey.currentState!.validate()) {
//       print("Form is vaid ");
     
//       print('Data for login $productData');
      
//     }
//   }




// product_image_picker.dart

// First return this

// Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Container(
//           width: 100,
//           height: 100,
//           child:  Image.network(
//                   'https://static.thenounproject.com/png/2413564-200.png',
//                   fit: BoxFit.cover,
//                 ),
//         ),
//         ElevatedButton.icon(
//           onPressed: imagePickerOption,
//           icon: Icon(Icons.image),
//           label: Text('Add Image'),
//         ),
//       ],
//     );

// BottomSheet 

// void imagePickerOption() {
//     Get.bottomSheet(
//       SingleChildScrollView(
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0),
//           ),
//           child: Container(
//             color: Colors.white,
//             height: 250,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text(
//                     "Pic Image From",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       pickImage(ImageSource.camera);
//                     },
//                     icon: Icon(Icons.camera),
//                     label: Text("Camera"),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       pickImage(ImageSource.gallery);
//                     },
//                     icon: Icon(Icons.image),
//                     label: Text("Gallery"),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: Icon(Icons.close),
//                     label: Text("Cancel"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }



// Now Pic the Image

//  pickImage(ImageSource imageType) async {
//     final ImagePicker _picker = ImagePicker();
//     try {
//       final photo = await _picker.pickImage(source: imageType);
//       if (photo == null) return;
//       final tempImage = File(photo.path);
//       setState(() {
//         this.pickedImage = tempImage;
//       });
//       widget.getImageValue(pickedImage!);
//       Get.back();
//     } catch (error) {
//       print(error);
//     }
//   }

// Image condition 

// pickedImage != null
//               ? Image.file(
//                   pickedImage!,
//                   fit: BoxFit.cover,
//                 )
//               : Image.network(
//                   'https://static.thenounproject.com/png/2413564-200.png',
//                   fit: BoxFit.cover,
//                 ),


// Get Image in AddProductScreen from ImagepickerScreen 

// add this method in AddProductScreen 
// void _pickedImage(File image) {
//     _userImageFile = image;
   
    
//   }



// add this method in ImagepickerScreen 

// final void Function(File pickedImage) getImageValue;
//   ProductImagePicker(this.getImageValue);




// Check Image null or not

// if (_userImageFile == null) {
//       Get.snackbar(
//         "Opps",
//         "Image Required",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Theme.of(context).errorColor,
//         colorText: Colors.white,
//       );
//       return;



// Add this method in data_controller.dart file

// Future<void> addNewProduct(Map productdata, File image) async {
//     var pathimage = image.toString();
//     var temp = pathimage.lastIndexOf('/');
//     var result = pathimage.substring(temp + 1);
//     print(result);
//     final ref =
//         FirebaseStorage.instance.ref().child('product_images').child(result);
//     var response = await ref.putFile(image);
//     print("Updated $response");
//     var imageUrl = await ref.getDownloadURL();

//     try {
//       CommanDialog.showLoading();
//       var response = await firebaseInstance.collection('productlist').add({
//         'product_name': productdata['p_name'],
//         'product_price': productdata['p_price'],
//         "product_upload_date": productdata['p_upload_date'],
//         'product_image': imageUrl,
//         'user_Id': authController.userId,
//         "phone_number": productdata['phone_number'],
//       });
//       print("Firebase response1111 $response");
//       CommanDialog.hideLoading();
//       Get.back();
//     } catch (exception) {
//       CommanDialog.hideLoading();
//       print("Error Saving Data at firestore $exception");
//     }
//   }

// }