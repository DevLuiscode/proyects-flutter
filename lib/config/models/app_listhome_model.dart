import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeModel {
  final String title;
  final IconData icon;

  HomeModel({required this.title, required this.icon});
}

final List<HomeModel> listHomeTitle = [
  HomeModel(title: "ObjectBox", icon: Iconsax.dcube),
];
