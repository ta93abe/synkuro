import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLockedStateProvider = StateProvider<bool>((ref) => false);

class Edit extends HookConsumerWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLocked = ref.watch(isLockedStateProvider);
    final isLockedNotifier = ref.read(isLockedStateProvider.notifier);
    final controller = useTextEditingController(text: '');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Switch(
                  value: isLocked,
                  onChanged: (value) {
                    isLockedNotifier.state = value;
                  },
                ),
                const Text('LOCK'),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: controller.text));
              },
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: TextField(
                maxLines: null,
                minLines: 10,
                controller: controller,
                enabled: !isLocked,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
