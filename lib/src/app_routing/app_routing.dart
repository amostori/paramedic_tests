import 'package:go_router/go_router.dart';
import 'package:paramedic_tests/src/features/drugs/presentation/drugScreen.dart';

import '../features/breath/presentation/breath_screen.dart';
import '../features/home/presentation/home.dart';
import '../features/mask/presentation/mask_screen.dart';
import '../features/pulse/presentation/pulse_screen.dart';
import '../features/six_times/presentation/six_times.dart';
import '../features/ventilation/presentation/vent_screen.dart';
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
          builder: (context, state) => const SixTimes(),
        ),
        GoRoute(
          path: 'weight',
          name: AppRoute.weight.name,
          builder: (context, state) => const WeightScreen(),
        ),
        GoRoute(
          path: 'breath',
          name: AppRoute.breath.name,
          builder: (context, state) => const BreathScreen(),
        ),
        GoRoute(
          path: 'pulse',
          name: AppRoute.pulse.name,
          builder: (context, state) => const PulseScreen(),
        ),
        GoRoute(
          path: 'vent',
          name: AppRoute.vent.name,
          builder: (context, state) => const VentScreen(),
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
      ],
    ),
  ],
);
