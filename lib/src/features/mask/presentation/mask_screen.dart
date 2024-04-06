import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paramedic_tests/src/features/mask/provider/mask_provider.dart';
import 'package:paramedic_tests/src/presentation/style_manager.dart';

import '../../../widgets/floating_button.dart';
import '../../../widgets/my_body.dart';

class MaskScreen extends ConsumerStatefulWidget {
  const MaskScreen({super.key});

  @override
  ConsumerState createState() => _MaskScreenState();
}

class _MaskScreenState extends ConsumerState<MaskScreen> {
  @override
  Widget build(BuildContext context) {
    final mask = ref.watch(maskProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rozmiar maski Ambu'),
        actions: [
          IconButton(
            onPressed: () {
              _showEducationPanel(context);
            },
            icon: const Icon(Icons.ac_unit),
          ),
        ],
      ),
      floatingActionButton: const FloatingButton(),
      body: MyBody(
        question: mask.age,
        answer: mask.maskNr,
      ),
    );
  }

  Future<void> _showEducationPanel(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Maska twarzowa'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('0 m.ż - 11 m.ż:'),
                        Text('12 - 14 m.ż:'),
                        Text('15 - 18 m.ż:'),
                        Text('2 - 7 r.ż:'),
                        Text('8 - 9 r.ż:'),
                        Text('>9 r.ż:'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('maska 1'),
                        Text('maska 2'),
                        Text('maska 3'),
                        Text('maska 4'),
                        Text('maska 5'),
                        Text('maska 5 - 6'),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('Anuluj'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }
}
