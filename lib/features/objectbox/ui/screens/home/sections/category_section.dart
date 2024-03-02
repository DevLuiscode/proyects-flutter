import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemExtent: 120,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Card(
                child: Center(
                  child: Text(
                    "category $index",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
