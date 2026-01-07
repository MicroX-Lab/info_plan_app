import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_theme.dart';
import 'routes.dart';

class InfoPlanRoot extends StatelessWidget {
  const InfoPlanRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '信息池',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', ''),
        Locale('en', ''),
      ],
    );
  }
}

