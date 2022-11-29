import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> imgList = [
    "assets/images/ic_hotel1.jpg",
    "assets/images/ic_hotel2.jpg",
    "assets/images/ic_hotel3.jpg",
    "assets/images/ic_hotel4.jpg",
    "assets/images/ic_hotel5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ic_header.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.4),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Best Hotels Ever",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey,),
                          border: InputBorder.none,
                          hintText: "Search for hotels...",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 18,),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Business Hotels",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 190,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeItem("Hotel 1"),
                        makeItem("Hotel 2"),
                        makeItem("Hotel 3"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Airport Hotels",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 190,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeItem("Hotel 1"),
                        makeItem("Hotel 2"),
                        makeItem("Hotel 3"),
                      ],
                    ),

                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resort Hotels",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 190,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeItem("Hotel 1"),
                        makeItem("Hotel 2"),
                        makeItem("Hotel 3",),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  int index = 0;
  void imageChanger() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        index++;
        if (index == imgList.length - 1) {
          index = 0;
        }
      });
    });
  }
  @override
  void initState() {
    imageChanger();
    super.initState();
  }
  Widget makeItem(title) {
    return AspectRatio(
      aspectRatio: 2 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 20,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imgList[index]),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}