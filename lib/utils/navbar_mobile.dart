import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on selected index
    // switch (index) {
    //   case 0:
    //     Get.toNamed('/home'); // Navigate to Home screen
    //     break;
    //   case 1:
    //     Get.toNamed('/search'); // Navigate to Search screen
    //     break;
    //   case 2:
    //     Get.toNamed('/add'); // Navigate to Add screen
    //     break;
    //   case 3:
    //     Get.toNamed('/notifications'); // Navigate to Notifications screen
    //     break;
    //   case 4:
    //     Get.toNamed('/profile'); // Navigate to Profile screen
    //     break;
    //   default:
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/calendar.svg',
            color: _selectedIndex == 0 ? Colors.black : Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/map.svg',
            color: _selectedIndex == 1 ? Colors.black : Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
              backgroundColor: Colors.lightBlueAccent,
            child:Icon(Icons.add,color: _selectedIndex == 2 ? Colors.black : Colors.black,)
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/users.svg',
            color: _selectedIndex == 3 ? Colors.black : Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/star.svg',
            color: _selectedIndex == 4 ? Colors.black : Colors.black,
          ),
          label: '',
        ),
      ],
      backgroundColor: Colors.white,
    );
  }

}
