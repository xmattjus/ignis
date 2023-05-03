import 'package:flutter/material.dart';

import 'package:ignis/explore/widgets/user_card.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ignis'),
      ),
      body: GridView.count(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 2,
          children: List.generate(16, (index) {
            return const UserCard();
          })),
    );
  }
}
