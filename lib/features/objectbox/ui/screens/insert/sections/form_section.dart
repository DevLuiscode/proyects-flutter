import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import 'package:personal_proyects/features/objectbox/domain/models/product_model.dart';
import 'package:personal_proyects/features/objectbox/ui/providers/products/product_provider.dart';

class FormSection extends ConsumerStatefulWidget {
  final File? imageSelect;
  const FormSection({
    super.key,
    required this.imageSelect,
  });

  @override
  _FormSectionState createState() => _FormSectionState();
}

class _FormSectionState extends ConsumerState<FormSection> {
  final TextEditingController nameController = TextEditingController(text: "");
  final descriptionController = TextEditingController(text: "");
  final priceHigherController = TextEditingController(text: "");
  final priceUnitController = TextEditingController(text: "");

  bool isValid = true;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceHigherController.dispose();
    priceUnitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productNotifier = ref.read(productProvider.notifier);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: nameController,
            onChanged: (value) {},
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              prefixIcon: const Icon(Iconsax.pen_add),
              hintText: "Nombre de prenda",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: descriptionController,
            onChanged: (value) {},
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              prefixIcon: const Icon(Iconsax.pen_add),
              hintText: "Descripción",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: priceHigherController,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              prefixIcon: const Icon(Iconsax.money_add),
              hintText: "Precio Unidad",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: priceUnitController,
            onChanged: (value) {},
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              prefixIcon: const Icon(Iconsax.money_add),
              hintText: "Precio Mayor",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            disabledColor: Colors.blueAccent,
            color: const Color.fromARGB(255, 40, 33, 243),
            onPressed: isValid
                ? () {
                    final productModel = ProductModel(
                      name: nameController.text,
                      description: descriptionController.text,
                      priceHigher: double.parse(priceHigherController.text),
                      pridceUnit: double.parse(priceUnitController.text),
                      image: widget.imageSelect!.path,
                    );
                    productNotifier.insertProduct(productModel);
                    productNotifier.loadData();
                  }
                : null,
            child: const Text("Agregar"),
          )
        ],
      ),
    );
  }

  void registerProduct() {
    nameController.text = "";
    descriptionController.text = "";
    priceHigherController.text = "";
    priceUnitController.text = "";
    isValid = false;
  }
}
