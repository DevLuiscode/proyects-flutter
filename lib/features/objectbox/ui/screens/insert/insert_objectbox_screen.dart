import 'dart:io';

import 'package:flutter/material.dart';

import 'package:personal_proyects/features/objectbox/ui/screens/insert/sections/form_section.dart';
import 'package:personal_proyects/features/objectbox/ui/screens/insert/sections/select_image_section.dart';

import 'sections/image_section.dart';

class InserObjectboxScreen extends StatefulWidget {
  static const name = "insert_objectbox_screen";

  const InserObjectboxScreen({
    super.key,
  });

  @override
  State<InserObjectboxScreen> createState() => _InserObjectboxScreenState();
}

class _InserObjectboxScreenState extends State<InserObjectboxScreen> {
  File? selectImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar producto"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageSection(
                image: selectImage,
              ),
              SelectImageSection(
                selectImage: selectImage,
                onImageSelected: (File? image) {
                  setState(() {
                    selectImage = image;
                  });
                },
              ),
              FormSection(
                imageSelect: selectImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
