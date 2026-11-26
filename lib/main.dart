import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pehrawan/app.dart';
import 'package:pehrawan/core/storage/app_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  AppStorageService.hiveReady = true;
  runApp(const ProviderScope(child: PehrawanApp()));
}
