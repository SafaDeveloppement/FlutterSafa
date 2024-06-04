import 'dart:convert';
import 'dart:io';

import 'package:applicationpef/models/group.dart';
import 'package:applicationpef/services/groupApi.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Creategroup extends StatefulWidget {
  @override
  _CreategroupState createState() => _CreategroupState();
}

class _CreategroupState extends State<Creategroup> {
  File? _selectedImage;
  String? imageGroup;
   final TextEditingController _groupNameController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final GroupService _groupApi = GroupService();

   Future<void> _Creategroup() async {
  String name = _groupNameController.text.trim();
  String email = _emailController.text.trim();

  if (name.isNotEmpty && email.isNotEmpty && _selectedImage != null) {
    Group group = Group(
      groupName: name,
      imageGroup: '', // Laissez vide car vous ajouterez l'image dans Creategroup
      ownerGroup: email,
      id: '', // L'ID sera assigné par le serveur
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 0,
    );

    try {
      String imagePath = _selectedImage!.path;
      await _groupApi.Creategroup(group, _selectedImage!, context);
      print("Group created successfully");
    } catch (error) {
      print('Error creating group: $error');
    }
  } else {
    print('Please fill in all fields and select an image.');
  }
}


  //selecter image 
  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        convertImageToBase64(File(pickedImage.path));
      });
    }
  }
  //convert type image
  Future<String> convertImageToBase64(File imageFile) async {
  final imageBytes = await imageFile.readAsBytes();
  final imageBase64 = base64Encode(imageBytes);
  imageGroup = imageBase64;
  print("image à la base 64 : $imageBase64");
  return imageBase64;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _groupNameController,
                decoration: const InputDecoration(
                  labelText: 'Name of Group',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            if (_selectedImage != null)
              Container(child: Image.file(_selectedImage!), width: 80, height:90)
            else
              Text('No image selected'),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),  
            ),
            ElevatedButton(
              onPressed: _Creategroup,
              child: Text('Create group chat'),
              ),

            
          ],
        ),
      ),
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     home: Creategroup(),
//   ));
// }




// class Creategroup extends StatefulWidget {
//   const Creategroup({Key? key}) : super(key: key);

//   @override
//   State<Creategroup> createState() => _CreategroupState();
// }

// class _CreategroupState extends State<Creategroup> {
//   File? _pickedImage;
//   final TextEditingController _groupNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();

//   final GroupService _groupApi = GroupService();
//   String base64Image = '';

//   Future<void> getImageFromGallery() async {
//     final pickedFile =
//         await ImagePicker().getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         base64Image = base64Encode(File(pickedFile.path).readAsBytesSync());
//       });
//     }
//   }

//   Future<void> _getImageFromGallery() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _pickedImage = File(pickedImage.path);
//       });
//     } else {
//       print('No image selected.');
//     }
//   }

//   Future<void> _Creategroup(BuildContext context) async {
//     String groupName = _groupNameController.text.trim();
//     String ownerEmail = _emailController.text.trim();

//     if (groupName.isNotEmpty && ownerEmail.isNotEmpty && _pickedImage != null) {
//       // Compression de l'image avant l'encodage en base64
//       List<int> imageBytes = await _pickedImage!.readAsBytes();
//       List<int> compressedImageBytes = await compressImage(imageBytes);
//       String base64Image = base64Encode(compressedImageBytes);

//       Group newGroup = Group(
//         groupName: groupName,
//         imageGroup: base64Image,
//         ownerGroup: '',
//         id: '', // L'ID sera assigné par le serveur
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         v: 0,
//       );

//       try {
//         await _groupApi.Creategroup(newGroup,  , context );
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Group created successfully'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       } catch (error) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error creating group: $error'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill in all fields and select an image.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   Future<List<int>> compressImage(List<int> imageBytes) async {
//     // Implémentez la logique de compression de l'image ici
//     // Vous pouvez utiliser des packages comme flutter_image_compress
//     // pour réduire la taille de l'image avant l'encodage en base64.
//     return imageBytes; // Retourne les données d'image compressées
//   }

//   @override
//   void dispose() {
//     _groupNameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 250, 250, 250),
//         title: Center(
//           child: Text(
//             "Create Group Chat",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 controller: _groupNameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name of Group',
//                   border: OutlineInputBorder(),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _getImageFromGallery,
//                 child: Text(
//                   'Select Group Image',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: const Color(0xFFDECFCF),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//               ),
//               SizedBox(height: 20),
//               _pickedImage != null
//                   ? ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.file(
//                         _pickedImage!,
//                         height: 150,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : Container(
//                       height: 150,
//                       color: Colors.grey[200],
//                       child: Center(
//                         child: Text(
//                           'No image selected',
//                           style: TextStyle(fontSize: 16, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _Creategroup(context),
//                 child: Text(
//                   'Create Group',
//                   style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: const Color(0xFFDECFCF),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
