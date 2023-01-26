import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/create/components/image_source_modal.dart';
import 'package:xlo_mobx/stores/create_store.dart';

class ImagesField extends StatelessWidget {
  const ImagesField(this.createStore, {super.key});

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File? image) {
      Navigator.of(context).pop();
      if (image != null) {
        createStore.images.add(image);
      }
    }

    return Transform.scale(
      scaleX: 1.12,
      scaleY: 1.12,
      origin: Offset(0, 120),
      child: Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(
            builder: (_) {
              final imagesCount = createStore.images.length;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagesCount < 5
                    ? imagesCount + 1
                    : 5, //limit images insertion to 5
                itemBuilder: (_, int index) {
                  if (index == imagesCount) {
                    return GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => ImageSourceModal(onImageSelected),
                          );
                        } else {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => ImageSourceModal(onImageSelected),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.grey[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 40,
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          8,
                          8,
                          index == 4 ? 8 : 0,
                          8,
                        ),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: FileImage(createStore.images[index]),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          )),
    );
  }
}
