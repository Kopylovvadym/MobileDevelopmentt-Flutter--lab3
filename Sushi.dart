import 'package:flutter/material.dart';
import 'package:lab3/Api.dart';
import 'package:provider/provider.dart';
import 'CartModel.dart';


class Sushi extends StatefulWidget {
  var menu_item;

  Sushi({this.menu_item});

  @override
  SushiState createState() => SushiState(menu_item);
}

class SushiState extends State<Sushi> {

  var menu_item;

  SushiState(this.menu_item);


  _removeProduct() {
    setState(() {
      if (menu_item.count > 0) {
        menu_item.count--;
        Provider.of<CartModel>(context, listen: false).remove(menu_item);
      }
    });}

  _addProduct() {
    setState(() {
      menu_item.count++;
      Provider.of<CartModel>(context, listen: false).add(menu_item);
    });}

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left:10, right: 10),
                  child: InkWell(
                    child: Image.asset('assets/images/roll' + menu_item.id.toString() + '.jpg', width: 170,),
                    onTap: (){Navigator.pop(context);},
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 210,
                  margin: EdgeInsets.only(right: 10, top: 10 ),
                  child: Column(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(menu_item.name, style: TextStyle(fontSize: 17)),
                        ),
                      ),
                      Text(" ", style: TextStyle(fontSize: 8)),
                      Text(menu_item.description, style: TextStyle(fontSize: 15)),
                      Text(" ", style: TextStyle(fontSize: 8)),
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(menu_item.weight, style: TextStyle(fontSize: 15)),
                        ),
                      ),
                      Text(" ", style: TextStyle(fontSize: 8)),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right:30.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(menu_item.price.toString(), style: TextStyle(fontSize: 18, color: Colors.red)),
                              )
                          ),
                          InkWell(
                            onTap: () {_removeProduct();},
                            child: Container(
                              height: 33,
                              margin: const EdgeInsets.only(left:10.0),
                              padding: const EdgeInsets.only(left: 14.0, right: 14),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child:  Text("-", style: TextStyle(fontSize: 25, color: Colors.black)),

                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left:10.0),
                            child: Text(menu_item.count.toString(), style: TextStyle(fontSize: 18, color: Colors.black)),
                          ),
                          InkWell(
                            onTap: () {_addProduct();},
                            child: Container(
                              height: 33,
                              margin: const EdgeInsets.only(left:10.0),
                              padding: const EdgeInsets.only(left: 11.0, right: 11, top: 2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(color: Colors.red),
                                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child:  Text("+", style: TextStyle(fontSize: 20 , color: Colors.white)),

                            ),
                          ),
                        ],
                      ),

                    ],

                  ),

                ),

              ],
            ),
            Divider(),
          ],
        )
    );
  }}