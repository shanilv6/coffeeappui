import 'package:coffeeappui/coffeetile.dart';
import 'package:coffeeappui/coffeetype.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List coffeetype = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  void CoffeetypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeetype.length; i++) {
        coffeetype[i][1] = false;
      }
      coffeetype[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu,color: Colors.white,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person,color: Colors.white,),
          )
        ],
      ),
     
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text("Find The Best Coffee For You",
                style:
                    GoogleFonts.bebasNeue(fontSize: 56, color: Colors.white)),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,color: Colors.white,
                ),
                hintText: "Find your coffee...",
                hintStyle: TextStyle(color: Colors.white),
                focusColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeetype.length,
              itemBuilder: (context, index) {
                return Coffeetype(
                  coffeetype: coffeetype[index][0],
                  isSelected: coffeetype[index][1],
                  onTap: () {
                    CoffeetypeSelected(index);
                  },
                );
              },
            ),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              coffeeTile(
                coffeeImagePath: "assets/janko-ferlic-h9Iq22JJlGk-unsplash.jpg",
                coffeeName: "Latte",
                coffeePrice: '4.20',
              ),
              coffeeTile(
                coffeeImagePath: "assets/nathan-dumlao-6VhPY27jdps-unsplash.jpg",
                coffeeName: "Cappucino",
                coffeePrice: '3.51',
              ),
              coffeeTile(
                coffeeImagePath: "assets/coff.jpg",
                coffeeName: "Milk Coffee thing",
                coffeePrice: '4.60',
              ),
              
            ],
          ))
        ],
      ),
    );
  }
}
