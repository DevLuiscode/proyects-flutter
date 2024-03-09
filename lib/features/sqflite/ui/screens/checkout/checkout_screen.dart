import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/ui/providers/card/cards_provder.dart';

class CheckOutScreen extends ConsumerStatefulWidget {
  static const name = "checkout_screen";
  const CheckOutScreen({super.key});

  @override
  CheckOutScreenState createState() => CheckOutScreenState();
}

class CheckOutScreenState extends ConsumerState<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    final cardProvide = ref.watch(cardProvider);
    final totalPriceCard = ref.watch(totalProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compra"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  const TableRow(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    children: [
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Cantidad",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Prenda",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Precio",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Total",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(
                    cardProvide.length,
                    (index) {
                      final item = cardProvide[index];
                      return TableRow(
                        children: [
                          TableCell(
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${item.amount}"),
                            )),
                          ),
                          TableCell(
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item.name),
                            )),
                          ),
                          TableCell(
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item.amount! >= 3
                                  ? "s/ ${item.priceHigher}"
                                  : "s/ ${item.pridceUnit}"),
                            )),
                          ),
                          TableCell(
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("s/ ${item.priceTotal}"),
                            )),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    children: [
                      const TableCell(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Cuenta total = "),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "s/ $totalPriceCard",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
