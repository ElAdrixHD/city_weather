import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const CustomFAB({Key? key, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onErrorContainer,
      ),
      onPressed: onTap,
    );
  }
}
