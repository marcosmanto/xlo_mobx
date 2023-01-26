import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  const ImageSourceModal({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton.icon(
              icon: Icon(
                Icons.camera_alt,
                size: 25,
              ),
              label: Text(
                'Câmera',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: getFromCamera,
            ),
            TextButton.icon(
              icon: Icon(
                Icons.list_alt,
                size: 25,
              ),
              onPressed: getFromGallery,
              label: Text(
                'Galeria',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: Text('Selecionar foto para o anúncio'),
        message: Text('Escolha a origem da foto:'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          child: Text('Cancelar'),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: Text('Câmera'),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: Text('Galeria'),
          ),
        ],
      );
    }
  }

  Future<void> getFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      imageSelected(File(image.path));
    }
  }

  Future<void> getFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageSelected(File(image.path));
    }
  }

  void imageSelected(File imageFile) {
    print(imageFile.path);
  }
}
