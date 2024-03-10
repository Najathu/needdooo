import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fav extends StatelessWidget {
  const fav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("hy")),
    );
  }
}
//
//
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             expandedHeight: 200.0,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('Your Title Here'),
//               background: Image.network(
//                 'https://via.placeholder.com/500',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text('Item $index'),
//                 );
//               },
//               childCount: 50,
//             ),
//           ),
//         ],
//       ),
//       persistentFooterButtons: <Widget>[
//         CurvedBottomNavigation(),
//       ],
//     );
//   }
// }