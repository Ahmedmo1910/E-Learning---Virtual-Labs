// import 'package:e_learning/features/home/presentation/views/data/category_model.dart';
// import 'package:flutter/material.dart';

// final List<CategoryModel> categories = [
//   CategoryModel(icon: Icons.code, name: "Technical"),
//   CategoryModel(icon: Icons.design_services, name: "Design"),
//   CategoryModel(icon: Icons.brush, name: "Art"),
//   CategoryModel(icon: Icons.campaign, name: "Marketing"),
//   CategoryModel(icon: Icons.laptop_mac, name: "E-Commerce"),
// ];
import 'package:e_learning/features/home/presentation/views/data/category_model.dart';
import 'package:e_learning/generated/l10n.dart';
import 'package:flutter/material.dart';

List<CategoryModel> categories(BuildContext context) {
  return [
    CategoryModel(icon: Icons.code, name: S.of(context).categoryTechnical),
    CategoryModel(icon: Icons.design_services, name: S.of(context).categoryDesign),
    CategoryModel(icon: Icons.brush, name: S.of(context).categoryArt),
    CategoryModel(icon: Icons.campaign, name: S.of(context).categoryMarketing),
    CategoryModel(icon: Icons.laptop_mac, name: S.of(context).categoryECommerce),
  ];
}
