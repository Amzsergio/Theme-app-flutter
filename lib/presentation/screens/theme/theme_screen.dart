import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_theme_app/presentation/providers/theme_provider.dart';

class ThemeSettingsScreen extends ConsumerWidget {
  const ThemeSettingsScreen({super.key});

  static const String name = 'theme_settings';

  @override
  Widget build(BuildContext context, ref) {
    final isDarkmode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
        actions: [
          IconButton(
            icon: Icon(isDarkmode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),
      body: const _ThemeScreen(),
    );
  }
}

enum Category { history, math, software, tech }

class _ThemeScreen extends ConsumerStatefulWidget {
  const _ThemeScreen();

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends ConsumerState<_ThemeScreen> {
  Category selectedCategory = Category.history;
  List<Category> categoriesOption = Category.values.toList();

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            title: const Text("Fondo de pantalla"),
            subtitle: const Text('Selecciona tu tema (sin persistencia)'),
            children: categoriesOption.map((category) {
              return RadioListTile(
                title: Text('Tema ${category.name}'),
                value: category,
                groupValue: selectedCategory,
                onChanged: (value) => setState(() {
                  if (value != null) {
                    selectedCategory = value;
                  }
                }),
              );
            }).toList(),
          ),
          ExpansionTile(
            title: const Text('Tema'),
            subtitle: const Text('Selecciona un color (con persistencia)'),
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: colors.length,
                itemBuilder: (BuildContext context, int index) {
                  final Color color = colors[index];

                  return RadioListTile(
                    title: Text('Este color', style: TextStyle(color: color)),
                    subtitle: Text('${color.value}'),
                    value: index,
                    groupValue: selectedColor,
                    onChanged: (value) => setState(() {
                      if (value != null) {
                        ref.read(selectedColorProvider.notifier).state = index;
                      }
                    }),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
