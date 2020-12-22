import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async' show Future;

Future<Menu> fetchMenu() async{
  final response = await http.get('https://api.jsonbin.io/b/5fde86c887e11161f87ccc5a/3');

  if (response.statusCode == 200) {
    return Menu.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load info');
  }
}

class Menu {
  final List<MenuItem> menu_items;

  Menu({this.menu_items});

  factory Menu.fromJson(Map<String, dynamic> json){

    var parsed_menu_items = json['menu_items'] as List;
    List<MenuItem> menuList = parsed_menu_items.map((i) => MenuItem.fromJson(i)).toList();


    return Menu(
      menu_items: menuList,
    );

  }

}

class MenuItem {

  final int id;
  final String name;
  final double price;
  final String description;
  final String weight;
  int count;

  MenuItem({this.id, this.name, this.price, this.description, this.weight, this.count});

  factory MenuItem.fromJson(Map<String, dynamic> json){
    return MenuItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      weight: json['weight'],
      count: 0,
    );
  }
}