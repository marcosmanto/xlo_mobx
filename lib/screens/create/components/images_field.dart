import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/create/components/image_source_modal.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: 1.12,
      scaleY: 1.12,
      origin: Offset(0, 120),
      child: Container(
        color: Colors.grey[200],
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (_, int index) {
            return GestureDetector(
              onTap: () {
                if (Platform.isAndroid) {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => ImageSourceModal(),
                  );
                } else {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (_) => ImageSourceModal(),
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
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
