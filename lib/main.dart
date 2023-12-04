import 'package:debt_tracker/core/localization/export.dart';
import 'package:debt_tracker/feature/auth/auth_view.dart';
import 'package:debt_tracker/product/init/firebase_init.dart';
import 'package:debt_tracker/product/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await FirebaseInit.init();
  await LocalizationInit.init();

  runApp(
    ProviderScope(
      child: LocalizationInit(
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData.dark(),
      home: AuthService.isLoggedIn()
          ? Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await AuthService.logOut();
                  },
                  child: const Text('asd'),
                ),
              ),
            )
          : const AuthView(),
    );
  }
}
