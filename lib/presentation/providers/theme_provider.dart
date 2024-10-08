import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_theme_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

final isDarkmodeProvider = StateProvider((ref) => false);
