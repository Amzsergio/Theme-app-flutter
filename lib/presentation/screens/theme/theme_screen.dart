import 'package:flutter/material.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  static const String name = 'theme_settings';

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

  // Category selectedCategory = Category.history;

  // List<Category> categoriesOption = Category.values.toList();

// ExpansionTile(
//       title: const Text("Categorías"),
//       subtitle: Text('Selecciona tu categoría'),
//       children: categoriesOption.map((category) {
//         return RadioListTile(
//           title: Text('by ${category.name}'),
//           value: category,
//           groupValue: selectedCategory,
//           onChanged: (value) => setState(() {
//             if (value != null) {
//               selectedCategory = value;
//             }
//           }),
//         );
//       }).toList(),
//     );