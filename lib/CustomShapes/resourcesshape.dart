import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SResCata extends StatelessWidget {
  final String img;
  final VoidCallback onpressed;

  const SResCata({
    super.key,
    required this.img,
    required this.onpressed,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 180,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 4), // bottom only
              blurRadius: 8,
              spreadRadius: 0,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img, height: 100),
              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}
