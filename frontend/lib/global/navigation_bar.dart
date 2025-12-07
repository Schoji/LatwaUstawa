import 'package:flutter/material.dart';
import 'package:latwe_ustawy/global/notifiers.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      Notifiers.selectedTab.value = index;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Strona główna'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Posłowie'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: colors.primary,
      onTap: _onItemTapped,
    );
  }
}
