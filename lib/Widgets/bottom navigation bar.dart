//
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
//
// import '../bottom nav/fav.dart';
//
// class CurvedBottomNavigation extends StatelessWidget {
//   int _page = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(child: CurvedNavigationBar(
//
//       index: 0,
//       height: 60.0,
//
//       items: <Widget>[
//         IconButton(
//           color: Colors.white, onPressed: () {}, icon: Icon(Icons.home),),
//         IconButton(color: Colors.white,
//           onPressed: () {},
//           icon: Icon(Icons.favorite),),
//         IconButton(color: Colors.white,
//           onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>fav() ));
//           },
//           icon: Icon(Icons.shopping_cart),),
//         IconButton(color: Colors.white,
//           onPressed: () {},
//           icon: Icon(Icons.shopping_bag),),
//         IconButton(
//           color: Colors.white, onPressed: () {}, icon: Icon(Icons.person),),
//       ],
//       color: Colors.green,
//       buttonBackgroundColor: Colors.green,
//       backgroundColor: Colors.white12,
//       animationCurve: Curves.easeInOut,
//       animationDuration: Duration(milliseconds: 600),
//
//
//       letIndexChange: (index) => true,
//     ),);
//   }
// }


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurvedBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  CurvedBottomNavigation({
    required this.selectedIndex,
    required this.onTabSelected,
    required void Function(int index) navigateToPage,
  });


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: CurvedNavigationBar(
        index: selectedIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.shopping_cart, color: Colors.white),
          Icon(Icons.shopping_bag, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        color: Colors.green,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Colors.white12,
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 600),
        onTap: onTabSelected


      ),
    );
  }
}
