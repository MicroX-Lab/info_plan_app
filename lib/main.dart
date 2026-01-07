import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/providers/content_provider.dart';
import 'src/providers/layout_provider.dart';
import 'src/providers/plan_provider.dart';
import 'src/providers/tag_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const InfoPlanApp());
}

class InfoPlanApp extends StatelessWidget {
  const InfoPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LayoutProvider()),
        ChangeNotifierProvider(create: (_) => ContentProvider()),
        ChangeNotifierProvider(create: (_) => PlanProvider()),
        ChangeNotifierProvider(create: (_) => TagProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, _) => const InfoPlanRoot(),
      ),
    );
  }
}
