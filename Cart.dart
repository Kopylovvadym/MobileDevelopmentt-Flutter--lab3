import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/Api.dart';
import 'package:lab3/Sushi.dart';
import 'package:provider/provider.dart';
import 'CartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {

  @override
  createState() => new CartState();
}

class CartState extends State<Cart> {

  List<MenuItem> cart;
  var marginTop;
  var sum;

  @override
  void initState(){
    super.initState();
    cart = Provider.of<CartModel>(context, listen: false).items;
    sum = 0.0;
    cart.map((MenuItem item){
      sum += item.price.roundToDouble();
    }).toList();
    if (cart.isEmpty == true) {
      marginTop = 70.0;
    } else {
      marginTop = 20.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 23 ),
              color: Color(0xFFF0F0F0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: (){Navigator.of(context).pop();},
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.pink,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Корзина", style: TextStyle(fontSize: 27),),
                        ),
                      ),
                      InkWell(
                        onTap: (){setState(() {
                          marginTop = 70.0;
                          Provider.of<CartModel>(context, listen: false).removeAll();
                        });},
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(Icons.delete_outline, color: Colors.red,),
                        ),
                      )
                    ],
                  ),
                  Text(" "),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:15, bottom: 15),
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {},
                        textColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        padding: const EdgeInsets.only(left:120.0, right:120, top:15, bottom: 15),
                        child: Text("ВВЕСТИ ПРОМОКОД", style: TextStyle(fontSize: 14),),
                      ),
                    ),
                    //ТУТ НАЧИНАЕТСЯ ВЕТКА - ЛИБО ПУСТО, ЛИБО ПОДГРУЖАЮТСЯ ТОВАРЫ
                    (cart.isEmpty == true) ?
                    Container(
                      child: Image.asset("assets/images/empty.PNG"),
                    ) : Container(
                      height: 400,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: cart.map((MenuItem sushi_item) {
                            return Sushi(
                              menu_item: sushi_item,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: marginTop),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {},
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                        padding: const EdgeInsets.only(left:120.0, right:120, top:15, bottom: 15),
                        child: (cart.isEmpty == true) ?
                        Text( "КОРЗИНА ПУСТА", style: TextStyle(fontSize: 14),) : Text( "ЗАКАЗАТЬ НА $sum грн.", style: TextStyle(fontSize: 14),) ,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}