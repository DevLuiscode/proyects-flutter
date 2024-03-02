import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_proyects/config/models/app_listhome_model.dart';
import 'package:personal_proyects/features/objectbox/ui/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Proyects"),
      ),
      body: ListView.builder(
        itemCount: listHomeTitle.length,
        itemBuilder: (context, index) {
          final item = listHomeTitle[index];
          return ListTile(
            onTap: () {
              context.pushNamed(HomeScreenObjectBox.name);
            },
            title: Text(item.title),
            leading: Icon(item.icon),
          );
        },
      ),
    );
  }
}
