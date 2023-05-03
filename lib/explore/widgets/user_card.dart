import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _scaleTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _scaleTween = Tween<double>(begin: 1.0, end: 0.9);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  /// Abort animation if the onTapDown event is not followed by an onTapUp event
  /// (e.g. user taps on an image and then scrolls the parent container)
  void onTapCancel() {
    _controller.reverse();
  }

  void onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final scaleAnim = _scaleTween.animate(_controller);
    return ScaleTransition(
      scale: scaleAnim,
      child: GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        child: Center(
          child: Card(
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: const <Widget>[
                ListTile(
                  title: Text(
                    'example',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
