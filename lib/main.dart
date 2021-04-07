import 'package:flutter/material.dart';
import 'package:pizza_widget_files/pizza.dart';
import 'package:pizza_widget_files/add_pizza_dialog.dart';
import 'package:pizza_widget_files/pizza_order.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => PizzaOrder(),
        child: MyHomePage(title: 'Pizza Order'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<Pizza> pizzasInOrder = new List();

  PizzaOrder pizzaOrder = new PizzaOrder();

  _MyHomePageState() {
    //pizzasInOrder[0] = new Pizza("Large", 1);
    //pizzasInOrder.add(new Pizza("Small", 1));
  }

  void _addPizza() {
    showDialog(
        context: context,
        builder: (context) {
          return AddPizzaDialog(pizzaOrder: pizzaOrder);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    pizzaOrder = Provider.of<PizzaOrder>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: pizzaOrder.length(),
        itemBuilder: (BuildContext context, int position) {
          return Card(
              child: ListTile(
                leading: Icon(Icons.restaurant),
                title: Text(pizzaOrder.getPizza(position).description),
                onTap: () {
                  print("You tapped on items $position");
                },
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPizza,
        tooltip: 'Add a pizza',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}









