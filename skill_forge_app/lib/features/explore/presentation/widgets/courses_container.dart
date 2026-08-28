import 'package:flutter/material.dart';

class CoursesContainer extends StatelessWidget {
  const CoursesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 208, 208),
        border: Border.all(color: const Color.fromARGB(74, 0, 0, 0)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 40, 40, 40),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Color.fromARGB(255, 192, 206, 255),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Best Seller",
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 201, 56, 46),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "-20%",
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
                      child: Icon(Icons.favorite_border),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      "4.8",
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("(12.8k)", style: textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Mastering UI/UX Desing: from zero to hero",
                  maxLines: 2,
                  style: textTheme.headlineSmall,
                ),
                SizedBox(height: 10),

                Text("Sarah Jenkins", maxLines: 2, style: textTheme.bodyMedium),
                SizedBox(height: 20),

                Row(
                  spacing: 20,
                  children: [
                    Text(
                      "\$49.99",
                      maxLines: 2,
                      style: textTheme.headlineMedium!.copyWith(
                        color: const Color.fromARGB(255, 3, 55, 146),
                      ),
                    ),
                    Text(
                      "\$64.99",
                      maxLines: 2,
                      style: textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
