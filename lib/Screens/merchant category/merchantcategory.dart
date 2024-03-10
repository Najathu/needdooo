import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:needoo/Screens/HomePage.dart';
import 'package:needoo/Widgets/carousil%20slider.dart';

class MerchantCategory extends StatefulWidget {
  const MerchantCategory({Key? key});

  @override
  State<MerchantCategory> createState() => _MerchantCategoryState();
}

class _MerchantCategoryState extends State<MerchantCategory> {
  var foods = [
    "assets/images/burgers02.jpg",
    "assets/images/pizza03.jpg",
    "assets/images/albaikk.jpeg",
  ];

  var text = ["Burger King", "Pizza Hut", "Al Baik"];
  var place = ["Malappuram", "Kottakkal", "Tirur"];

  var distance = ["5.8 km", "10.2 km", "8.5 km"];

  var logos = [
    "assets/logos/burgerking.png",
    "assets/logos/pizzahuticon.png",
    "assets/logos/albaikicon.png"
  ];

  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 60.0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            title: Text(
              'Shops',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 130.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: [
                    "assets/images/broast22.jpeg",
                    "assets/images/burgers1.jpeg",
                    "assets/images/french1.jpeg",
                    "assets/images/pizza2.jpeg",
                  ].map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(item),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Container(
                        width: 10.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == i
                              ? Colors.green
                              : Colors.greenAccent,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            final actualindex= index % foods.length;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              width: 400.0,
              height: 260.0,
              child: ClipRRect(borderRadius: BorderRadius.circular(30),
                child: Card(elevation: 4,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image(image: AssetImage(foods[index])),
                        ],
                      ),
                      ListTile(
                        title: Text(
                          text[actualindex],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          place[actualindex],
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Text(distance[actualindex],style: TextStyle(color: Colors.black),),
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
            childCount: foods.length,
          ))
        ],
      ),
    );
  }
}
