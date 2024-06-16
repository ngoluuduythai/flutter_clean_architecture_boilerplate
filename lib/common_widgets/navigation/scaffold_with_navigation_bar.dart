import 'package:flutter/material.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'Product', icon: Icon(Icons.inventory_2)),
          NavigationDestination(label: 'Scan', icon: Icon(Icons.qr_code_scanner)),
          NavigationDestination(label: 'Profile', icon: Icon(Icons.account_circle)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
