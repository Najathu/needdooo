import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:needoo/bottom%20nav/cart.dart';
import 'package:needoo/bottom%20nav/fav.dart';
import 'package:needoo/bottom%20nav/profile.dart';
import 'package:needoo/bottom%20nav/shopping.dart';

import '../../../Screens/merchant category/merchantcategory.dart';
import '../../bottom navigation bar.dart';
import '../loactionpage.dart';


class calicut extends StatefulWidget {
  @override
  State<calicut> createState() => _calicutState();
}

class _calicutState extends State<calicut> {
  int _selectedIndex = 0;
  // String _currentLocation = 'Loading...';

  @override
  // void initState() {
  //   super.initState();
  //   _getCurrentLocation();
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => fav()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => cart()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => shopping()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => profile()));
        break;
    }
  }

  var name = ["Burgers", "Pizza", "French Fries", "Broast"];
  var image = [
    "assets/images/card01.jpeg",
    "assets/images/pizza.jpeg",
    "assets/images/friescard.jpeg",
    "assets/images/card4.jpeg"
  ];

  // void _getCurrentLocation() async {
  //   try {
  //     LocationPermission locationPermission = await Geolocator.requestPermission();
  //     if (locationPermission == LocationPermission.denied) {
  //       setState(() {
  //         _currentLocation = 'Permission denied';
  //       });
  //     } else {
  //       Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //       List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  //       setState(() {
  //         _currentLocation = placemarks[0].subLocality ?? placemarks[0].locality ?? 'Unknown';
  //       });
  //     }
  //   } catch (e) {
  //     print('Error getting location: $e');
  //     setState(() {
  //       _currentLocation = 'Error getting location';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.green,
              expandedHeight: 120.0,
              centerTitle: true,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Mavoor Road,Calicut",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.0),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => locationPage()));
                    },
                    icon: Icon(Icons.keyboard_arrow_down),
                  )
                ],
              ),
              bottom: AppBar(automaticallyImplyLeading: false,
                  backgroundColor: Colors.green,
                  elevation: 5,
                  title: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search", prefixIcon: Icon(Icons.search)),
                    ),
                  ))),
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/carosel1.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/carosel2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/carosel3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Merchant Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Card(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MerchantCategory()),
                            );
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Image(
                                          image: AssetImage(image[index]))),
                                  // SizedBox(height: 2.0,),

                                  Text(
                                    name[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ));
              }, childCount: name.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              )),
        ],
      ),
      persistentFooterButtons: <Widget>[
        CurvedBottomNavigation(
          selectedIndex: _selectedIndex,
          onTabSelected: _onItemTapped,
          navigateToPage: _navigateToPage,
        )
      ],
    );
  }
}
