import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paramedic_tests/src/features/home/presentation/widgets/home_list_button.dart';

import '../../../app_routing/app_routing.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.six.name),
                title: 'Wielokrotność 6',
              ),
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.weight.name),
                title: 'Waga',
              ),
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.breath.name),
                title: 'Częstość oddechu',
              ),
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.pulse.name),
                title: 'Częstość akcji serca',
              ),
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.vent.name),
                title: 'Częstość wentylacji',
              ),
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.mask.name),
                title: 'Maska Ambu',
              ),
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.drugs.name),
                title: 'Dawkowanie leków',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
