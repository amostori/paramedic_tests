import 'package:go_router/go_router.dart';
import 'package:paramedic_tests/src/features/breath/presentation/breathing_screen.dart';
import 'package:paramedic_tests/src/features/french/home/presentation/drawing_screen.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/presentation/leki_u_dzieci_screen.dart';
import 'package:paramedic_tests/src/features/leki_u_dzieci/presentation/no_draw_screen.dart';
import 'package:paramedic_tests/src/features/saturation/presentation/saturation_screen.dart';
import 'package:paramedic_tests/src/features/six_times/presentation/six_screen.dart';
import 'package:paramedic_tests/src/features/ventilation/presentation/ventilation_screen.dart';

import '../features/drugs/presentation/drug_screen.dart';
import '../features/french/adding_word/presentation/adding_word_screen.dart';
import '../features/home/presentation/home.dart';
import '../features/mask/presentation/mask_screen.dart';
import '../features/pulse/presentation/pulse_screen.dart';
import '../features/ventilation/presentation/archive/vent_screen.dart';
import '../features/weight/presentation/weight_screen.dart';
import '../presentation/error_page.dart';

enum AppRoute {
  home,
  six,
  weight,
  breath,
  pulse,
  vent,
  mask,
  drugs,
  saturation,
  drawing,
  nodrawing,
  french,
  addingWord,
}

final routeByName = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  errorBuilder: (context, state) => const ErrorPage(),
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: 'six',
          name: AppRoute.six.name,
          builder: (context, state) => const SixScreen(),
        ),
        GoRoute(
          path: 'weight',
          name: AppRoute.weight.name,
          builder: (context, state) => const WeightScreen(),
        ),
        GoRoute(
          path: 'breath',
          name: AppRoute.breath.name,
          builder: (context, state) => const BreathingScreen(),
        ),
        GoRoute(
          path: 'pulse',
          name: AppRoute.pulse.name,
          builder: (context, state) => const PulseScreen(),
        ),
        GoRoute(
          path: 'vent',
          name: AppRoute.vent.name,
          builder: (context, state) => const VentilationScreen(),
        ),
        GoRoute(
          path: 'mask',
          name: AppRoute.mask.name,
          builder: (context, state) => const MaskScreen(),
        ),
        GoRoute(
          path: 'drugs',
          name: AppRoute.drugs.name,
          builder: (context, state) => const DrugScreen(),
        ),
        GoRoute(
          path: 'saturation',
          name: AppRoute.saturation.name,
          builder: (context, state) => const SaturationScreen(),
        ),
        GoRoute(
          path: 'drawing',
          name: AppRoute.drawing.name,
          builder: (context, state) => const LekiUDzieciScreen(),
        ),
        GoRoute(
          path: 'nodrawing',
          name: AppRoute.nodrawing.name,
          builder: (context, state) => NoDrawScreenForLeki(),
        ),
        GoRoute(
          path: 'french',
          name: AppRoute.french.name,
          builder: (context, state) => const DrawingScreen(),
          routes: [
            GoRoute(
                path: 'addingWord',
                name: AppRoute.addingWord.name,
                builder: (context, state) => AddingWordScreen()),
          ],
        ),
      ],
    ),
  ],
);
