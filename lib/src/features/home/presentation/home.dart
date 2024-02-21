import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paramedic_tests/src/features/home/presentation/widgets/home_list_button.dart';
import 'package:paramedic_tests/src/utils/strings_manager.dart';

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
                title: StringsManager.sixTimes.tr(),
              ),
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.weight.name),
                title: StringsManager.weight.tr(),
              ),
              HomeListButton(
                onTap: () => context.goNamed(AppRoute.breath.name),
                title: StringsManager.breathingRate.tr(),
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
