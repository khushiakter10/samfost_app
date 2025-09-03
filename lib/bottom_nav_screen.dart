

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BottomNavScreen extends StatefulWidget {
  final int initialIndex;

  const BottomNavScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [

    // HomeScreen(),
    // ScheduleScreen(),
    // MyEquipmentTwoScreen(),
    // TrainerScreen(),
    // MyStoryScreen(),

  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

    );
  }
}
