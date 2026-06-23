import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/boot.dart';

void main() async {
  final override = await getOverrides();
  runApp(ProviderScope(overrides: override, child: FoodNinja()));
}
