import 'package:flutter/material.dart';
import 'Catalog.dart';
import 'Cart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'CartModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var images = [
    Image.asset("assets/images/3.jpg"),
    Image.asset("assets/images/4.jpg"),
    Image.asset("assets/images/5.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sushi Wok',
        home: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onPressed: () {
              // Respond to button press
            },
            child: Icon(Icons.call_sharp),),
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Image.asset("assets/images/sushiwok.png", height: 33),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.red,),
                  onPressed: () { Scaffold.of(context).openDrawer(); },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: <Widget>[
              Builder(builder: (context) => IconButton(
                  icon: const Icon(Icons.shopping_cart_rounded, color: Colors.red,),
                  tooltip: "Go to cart!",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Cart(
                      )),
                    );}))
            ],
          ),
          drawer: Builder(builder: (context) => Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Image.asset("assets/images/sushiwok.png", height: 13, width: 13,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                ListTile(
                    title: Text('Каталог', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    onTap: () {
                      Navigator.of(context).pop();

                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Catalog(
                        )),
                      );}
                ),
                ListTile(
                  title: Text('Акции', style: TextStyle(fontSize: 17)),
                  onTap: () {
                    Catalog();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Профиль', style: TextStyle(fontSize: 17)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Магазины', style: TextStyle(fontSize: 17)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Доставка', style: TextStyle(fontSize: 17)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(height: 200.0,
                            aspectRatio: 16/9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            //enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          items: [0,1,2].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return  Container(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    child: images[i],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Наше меню:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)),
                        )
                        ,Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 21),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/6.jpg", height: 144,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/7.jpg",  height: 144,),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:10, right: 120),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Попробуй!", style: TextStyle(fontSize: 17,),)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Fit", style: TextStyle(fontSize: 17,),)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 21),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/1.jpg", height: 144,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/2.jpg",  height: 144,),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:10, right: 70),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Наборы и комбо", style: TextStyle(fontSize: 17,),)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Роллы", style: TextStyle(fontSize: 17,),)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 21),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/8.jpg", height: 144,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/9.jpg",  height: 144,),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:10, right: 50),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Запеченные роллы", style: TextStyle(fontSize: 17,),)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Wok", style: TextStyle(fontSize: 17,),)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 21),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/10.jpg", height: 144,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/15.jpg",  height: 144,),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:10, right: 75),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Вегетарианское", style: TextStyle(fontSize: 17,),)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Суши", style: TextStyle(fontSize: 17,),)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 21),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/17.jpg", height: 144,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/21.jpg",  height: 144,),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:10, right: 150),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Пицца", style: TextStyle(fontSize: 17,),)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Салаты и закуски", style: TextStyle(fontSize: 17,),)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 21),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/12.jpg", height: 144,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/13.jpg",  height: 144,),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:10, right: 160),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Супы", style: TextStyle(fontSize: 17,),)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Горячее", style: TextStyle(fontSize: 17,),)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 21),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/19.jpg", height: 144,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child:  Image.asset("assets/images/14.jpg",  height: 144,),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:10, right: 92),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Бизнес-ланчи", style: TextStyle(fontSize: 17,),)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top:10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Десерты и напитки", style: TextStyle(fontSize: 17,),)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
