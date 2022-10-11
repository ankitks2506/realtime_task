import 'package:flutter/material.dart';
import 'package:mevolve_hashtag/base/constants/colors.dart';

class CommonScreen extends StatelessWidget {
  final int number; // just for demo purpose
  const CommonScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Divider(
              color: AppColors.secondary,
              thickness: 6,
              height: 4,
            ),
            Expanded(
              child: Center(
                child: Text("Screen $number"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
