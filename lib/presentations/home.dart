import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        title: const Text('synkuro'),
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        bottom: TabBar(
          tabs: _tab,
          controller: tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.symmetric(vertical: 10),
          labelPadding: const EdgeInsets.symmetric(horizontal: 20),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade700, width: 3),
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

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.edit,
      ),
    );
  }
}

class Preview extends StatelessWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.preview,
      ),
    );
  }
}
