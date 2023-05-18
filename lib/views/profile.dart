import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:tech_media/res/color.dart';

class Profile with ChangeNotifier {
  final picker = ImagePicker();

  XFile? _image;
  XFile? get image => _image;

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
    }
  }

  void pickeImage(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Container(
          height: 120,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  pickCameraImage(context);
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.camera,
                  color: Colors.black,
                ),
                title: Text('Camera'),
              ),
              ListTile(
                onTap: () {
                  pickGalleryImage(context);
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.image,
                  color: Colors.black,
                ),
                title: Text('Gallery'),
              )
            ],
          ),
        ));
      },
    );
  }
}
