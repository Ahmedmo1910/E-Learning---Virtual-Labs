import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ExamAttachmentCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ExamAttachmentCard({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  IconData _getIcon() {
    if (description.toLowerCase().contains('image')) {
      return LucideIcons.image;
    } else if (description.toLowerCase().contains('pdf')) {
      return LucideIcons.fileText;
    }
    return LucideIcons.file;
  }

  Color _getColor() {
    if (description.toLowerCase().contains('image')) {
      return Colors.blue;
    } else if (description.toLowerCase().contains('pdf')) {
      return Colors.red;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getColor().withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(_getIcon(), color: _getColor(), size: 26),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
