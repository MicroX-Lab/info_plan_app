import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/content_provider.dart';
import '../../routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await context.read<ContentProvider>().ready;
    if (!mounted) return;
    final hasContent = context.read<ContentProvider>().hasContent;
    if (hasContent) {
      context.goNamed(AppRoute.home.name);
    } else {
      context.goNamed(AppRoute.empty.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

