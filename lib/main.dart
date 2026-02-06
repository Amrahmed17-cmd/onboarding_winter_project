import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:onboarding_winter_project/core/di/module.dart';
import 'package:onboarding_winter_project/core/storage/shared_prefs_helper.dart';
import 'package:onboarding_winter_project/onboarding_app.dart';
import 'package:path_provider/path_provider.dart';

HiveCacheStore? cacheStore;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  final prefs = getIt<SharedPrefsHelper>();
  debugPrint('Current State:');
  debugPrint('  - Visited Before: ${prefs.getVisitedBefore()}');
  debugPrint('  - Logged In: ${prefs.getLoggedIn()}');

  await prefs.clearAll();
  debugPrint('All stored data cleared - starting fresh!');

  Directory directory = await getApplicationDocumentsDirectory();
  cacheStore = HiveCacheStore(directory.path);
  debugPrint(cacheStore?.hiveBoxName);
  runApp(const OnboardingApp());
}
