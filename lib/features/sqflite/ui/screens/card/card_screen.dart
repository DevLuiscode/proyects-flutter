import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/card/cards_provder.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/navigation/app_navigation.dart';
import 'package:personal_proyects/features/sqflite/ui/screens/checkout/checkout_screen.dart';

class CardScreen extends StatelessWidget {
  static const name = "card_screen";
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        top: false,
        left: false,
        right: false,
        bottom: true,
        child: Column(
          children: [
            ListCardWidget(),
            CheckoutWidget(),
          ],
        ),
      ),
    );
  }
}

class ListCardWidget extends ConsumerStatefulWidget {
  const ListCardWidget({
    super.key,
  });

  @override
  ListCardWidgetState createState() => ListCardWidgetState();
}

class ListCardWidgetState extends ConsumerState<ListCardWidget> {
  @override
  void initState() {
    ref.read(cardProvider.notifier).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardList = ref.watch(cardProvider);
    final cardNotifier = ref.read(cardProvider.notifier);
    double? heigh;
    double? width;
    return Expanded(
      flex: 7,
      child: ListView.builder(
        itemCount: cardList.length,
        itemExtent: 150,
        itemBuilder: (context, index) {
          final item = cardList[index];
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              heigh = constraints.maxHeight;
              width = constraints.maxWidth;
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(right: 8, top: 2, bottom: 3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            height: heigh,
                            width: width! * 0.2,
                            File(item.image),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item.name),
                                IconButton(
                                  onPressed: () {
                                    cardNotifier.deleteCard(item.name);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cardNotifier.decrementePrice(index);
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(item.amount! >= 3
                                    ? "s/. ${item.priceHigher}"
                                    : "s/. ${item.pridceUnit}"),
                                IconButton(
                                  onPressed: () {
                                    cardNotifier.incrementePrice(index);
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    cardNotifier.decrementeAmount(index);
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text("${item.amount} ud."),
                                IconButton(
                                  onPressed: () {
                                    cardNotifier.incrementeAmount(index);
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                            Text(
                              "total = s/ ${item.priceTotal}",
                              textAlign: TextAlign.end,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CheckoutWidget extends ConsumerStatefulWidget {
  const CheckoutWidget({
    super.key,
  });

  @override
  CheckoutWidgetState createState() => CheckoutWidgetState();
}

class CheckoutWidgetState extends ConsumerState<CheckoutWidget> {
  @override
  Widget build(BuildContext context) {
    final totalProvide = ref.watch(totalProvider);
    final navigationNotifier = ref.read(appNavigationProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total"),
              Text(
                "s/ $totalProvide",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 12),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.blueGrey,
            onPressed: () {
              navigationNotifier.setNavigationScreen(CheckOutScreen.name);
            },
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(
                Iconsax.arrow_right,
                color: Colors.white,
              ),
              label: const Text(
                "CkeckOut",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
