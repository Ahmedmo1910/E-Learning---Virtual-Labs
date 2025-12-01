import 'package:e_learning/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  final Function(int)? onItemTapped;
  final int currentIndex;

  const CustomBottomNavigation({
    super.key,
    this.onItemTapped,
    this.currentIndex = 0,
  });

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 67, 67, 67).withOpacity(0.6),
            blurRadius: 8,
            offset: const Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(
            icon: Icons.person,
            label: "Profile",
            isActive: widget.currentIndex == 0,
            onTap: () => widget.onItemTapped?.call(0),
          ),
          BottomNavItem(
            icon: Icons.book,
            label: "Courses",
            isActive: widget.currentIndex == 1,
            onTap: () => widget.onItemTapped?.call(1),
          ),
          BottomNavItem(
            icon: Icons.home_outlined,
            label: "Home",
            isActive: widget.currentIndex == 2,
            onTap: () => widget.onItemTapped?.call(2),
          ),
          BottomNavItem(
            icon: Icons.chat_bubble_outline,
            label: "Inbox",
            isActive: widget.currentIndex == 3,
            onTap: () => widget.onItemTapped?.call(3),
          ),
          BottomNavItem(
            icon: Icons.settings_outlined,
            label: "Settings",
            isActive: widget.currentIndex == 4,
            onTap: () => widget.onItemTapped?.call(4),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNavItem({super.key, 
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.primaryColor : const Color(0xffB0B0B0),
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isActive
                  ? AppColors.primaryColor
                  : const Color(0xffB0B0B0),
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
