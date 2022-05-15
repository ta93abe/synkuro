import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:synkuro/commons/theme.dart';
import 'package:universal_platform/universal_platform.dart';

import 'firebase_options.dart';
import 'routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
      theme: myLightThemeData,
      darkTheme: myDarkThemeData,
      builder: (context, child) => Scaffold(
        body: GestureDetector(
          onTap: () {
            if (UniversalPlatform.isIOS) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                currentFocus.focusedChild?.unfocus();
              }
            }
          },
          child: child,
        ),
      ),
    );
  }
}
