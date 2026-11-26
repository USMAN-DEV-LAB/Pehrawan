import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/l10n/app_localizations.dart';

class PehrawanApp extends ConsumerWidget {
  const PehrawanApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Pehrawan',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light(locale: locale),
      darkTheme: AppTheme.dark(locale: locale),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
