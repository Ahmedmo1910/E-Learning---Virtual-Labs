import 'package:flutter/material.dart';
import 'package:e_learning/core/utils/app_colors.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${(progress * 100).toInt()}% Completed',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth * progress;
                      return Stack(
                        children: [
                          Container(
                            width: width,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
