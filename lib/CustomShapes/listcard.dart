import 'package:flutter/material.dart';
import 'package:nccapp/constants/colors.dart';

class listcard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String cardImage;
  final VoidCallback onpressed;

  const listcard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.cardImage,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 216,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.ashtext,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Fixed-width image
            Container(
              height: 216,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  cardImage.isNotEmpty ? cardImage : 'assets/images/placeholder.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Flexible text section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.ashtext,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
