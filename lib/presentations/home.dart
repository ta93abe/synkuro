import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'edit.dart';
import 'preview.dart';

const _tab = [
  Tab(
    text: 'Edit',
  ),
  Tab(
    text: 'Preview',
  ),
];

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: _tab.length);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () => GoRouter.of(context).push('/settings'),
          ),
        ],
        bottom: TabBar(
          tabs: _tab,
          controller: tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.symmetric(vertical: 10),
          labelPadding: const EdgeInsets.symmetric(horizontal: 20),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.shade700,
              width: 3,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Edit(),
          Preview(),
        ],
      ),
    );
  }
}
