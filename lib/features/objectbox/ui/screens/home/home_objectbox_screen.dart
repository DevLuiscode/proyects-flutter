import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/categories/categories_provider.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/navigation/app_navigation.dart';
import 'package:personal_proyects/features/objectbox/ui/screens/insert/insert_objectbox_screen.dart';
import '../widgets/appbar_objectbox_widget.dart';
import 'sections/sections.dart';

class HomeScreenObjectBox extends ConsumerStatefulWidget {
  static const name = "home_objectbox_screen";
  const HomeScreenObjectBox({super.key});

  @override
  HomeScreenObjectBoxState createState() => HomeScreenObjectBoxState();
}

class HomeScreenObjectBoxState extends ConsumerState<HomeScreenObjectBox> {
  @override
  void initState() {
    ref.read(categoriesProvider.notifier).insertFirtsCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBarObjectBoxWidget(textTheme: textTheme),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          //SearchSection(textTheme: textTheme),
          const SizedBox(height: 12),
          const CategorySection(),
          const SizedBox(height: 12),
          ListProductSection(
            textTheme: textTheme,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0XFF0040D4),
        onPressed: () {
          ref
              .read(appNavigationProvider.notifier)
              .setNavigationScreen(InserObjectboxScreen.name);
        },
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
