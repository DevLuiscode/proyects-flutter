import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import 'package:personal_proyects/features/sqflite/ui/providers/products/form_products_provider/form_products_provider.dart';

class FormSection extends ConsumerStatefulWidget {
  const FormSection({
    super.key,
  });

  @override
  FormSectionState createState() => FormSectionState();
}

class FormSectionState extends ConsumerState<FormSection> {
  @override
  Widget build(BuildContext context) {
    final fromProductState = ref.watch(formProductProvider);
    final formNotifier = ref.read(formProductProvider.notifier);
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField(
            items: formNotifier.getListDropDownItem(),
            onChanged: (newValue) {
              formNotifier.setId(newValue);
              formNotifier.formIsValid();
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              prefixIcon: const Icon(Iconsax.pen_add),
              hintText: "Categoria",
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
            controller: formNotifier.nameController,
            onChanged: (value) {
              formNotifier.formIsValid();
            },
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
            controller: formNotifier.descriptionController,
            onChanged: (value) {
              formNotifier.formIsValid();
            },
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
            controller: formNotifier.priceUnitController,
            onChanged: (value) {
              formNotifier.formIsValid();
            },
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
            controller: formNotifier.priceHigherController,
            onChanged: (value) {
              formNotifier.formIsValid();
            },
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
            onPressed: fromProductState
                ? () {
                    formNotifier.isRegisterProduct();
                  }
                : null,
            child: const Text("Agregar"),
          )
        ],
      ),
    );
  }
}
