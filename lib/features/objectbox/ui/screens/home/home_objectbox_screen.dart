import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:personal_proyects/features/objectbox/ui/screens/insert/insert_objectbox_screen.dart';

import '../widgets/appbar_objectbox_widget.dart';
import 'sections/sections.dart';

class HomeScreenObjectBox extends StatelessWidget {
  static const name = "home_objectbox_screen";
  const HomeScreenObjectBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBarObjectBoxWidget(textTheme: textTheme),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          SearchSection(textTheme: textTheme),
          const SizedBox(height: 12),
          const CategorySection(),
          const SizedBox(height: 12),
          ListProductSection(
            textTheme: textTheme,
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.refresh,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              context.pushNamed(InserObjectboxScreen.name);
            },
            icon: const Icon(
              Iconsax.add,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
