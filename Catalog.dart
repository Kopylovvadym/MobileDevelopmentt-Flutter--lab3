import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Api.dart';
import 'Sushi.dart';
import 'Cart.dart';

class Catalog extends StatefulWidget {

  @override
  createState() => new CatalogState();
}

class CatalogState extends State<Catalog> {

  Future<Menu> futureMenu;

  @override
  void initState(){
    super.initState();
    futureMenu = fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Menu>(
      future: futureMenu,
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: snapshot.data.menu_items.map((MenuItem sushi_item) {
                      return Sushi(
                        menu_item: sushi_item,
                      );
                    }).toList(),
                  ),
                )
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return  Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
              width: 50,
              height: 50,
            ));
      },
    );
  }

}
