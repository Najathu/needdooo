import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:needoo/Widgets/locationpage/Homepages/Banglore.dart';
import 'package:needoo/Widgets/locationpage/Homepages/Calicut.dart';
import 'package:needoo/Widgets/locationpage/Homepages/Kochi.dart';

import '../../Screens/HomePage.dart';

class locationPage extends StatefulWidget {
  const locationPage({Key? key}) : super(key: key);

  @override
  State<locationPage> createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(top: 8.0), // Add padding here
            sliver: SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 100.0,
              centerTitle: true,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ],
              ),
              title: Text("Search Your Location", style: TextStyle(fontSize: 18, color: Colors.black)),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none, // Remove the underline
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Icon(Icons.location_searching_outlined, size: 20, color: Colors.greenAccent),
                  SizedBox(width: 5),
                  Text(
                    "Use Current Location",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                String title;
                String subtitle;
                Widget nextPage;

                // Determine title, subtitle, and next page based on index
                switch (index) {
                  case 0:
                    title = "Kochi";
                    subtitle = "SH 28, Palarivattam, Kochi";
                    nextPage = kochi(); // Provide appropriate page widget
                    break;
                  case 1:
                    title = "Calicut";
                    subtitle = "Mavoor Road, Calicut";
                    nextPage = calicut(); // Provide appropriate page widget
                    break;
                  case 2:
                    title = "Bangalore";
                    subtitle = "Bangalore Main City, Bangalore";
                    nextPage = bang(); // Provide appropriate page widget
                    break;
                  default:
                    title = "";
                    subtitle = "";
                    nextPage = Container();
                }

                return Card(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.location_solid),
                    title: Text(title),
                    subtitle: Text(subtitle),
                    onTap: () {
                      // Navigate to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => nextPage),
                      );
                    },
                  ),
                );
              },
              childCount: 3, // Number of list items
            ),
          ),




        ],
      ),
    );
  }
}
