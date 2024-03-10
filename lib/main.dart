import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/app_routing/app_routing.dart';
import 'package:paramedic_tests/src/features/french/adding_word/model/word_model.dart';
import 'package:paramedic_tests/src/utils/constants.dart';
import 'package:paramedic_tests/src/utils/strings_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Lokalizacja:
// 1. Przygotuj pliki json z tłumaczeniami (en.json, pl.json)
// 2. Dodaj metodę tr() do Stringów wymagających przetłumaczenia
// 3. Do main() dodaj metodę EasyLocalization.ensureInitialized();
// 4. Opakuj MyApp w widget EasyLocalization
// Widget Phoenix jest potrzebny by zrestartować aplikację automatycznie po
// zmianie np języka.
// 5. W klasie MyApp do MaterialApp dodaj wpisy:
// localizationsDelegates: context.localizationDelegates,
// supportedLocales: context.supportedLocales,
// locale: context.locale,

// dart run build_runner watch -d
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordModelAdapter());
  await Hive.openBox<WordModel>(Constants.wordBox);
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [ENGLISH_LOCALE, POLISH_LOCALE],
        path: ASSETS_PATH_LOCALISATION,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: routeByName,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      title: StringsManager.appName.tr(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
  }
}
