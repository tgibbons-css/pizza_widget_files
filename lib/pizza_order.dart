
import 'package:flutter/foundation.dart';
import 'package:pizza_widget_files/pizza.dart';

class PizzaOrder extends ChangeNotifier{
  List<Pizza> pizzasInOrder = List();
  //List<Pizza> pizzasInOrder = [];

  int length() {
    return pizzasInOrder.length;
  }

  Pizza getPizza(int position) {
    return pizzasInOrder[position];
  }

  void addPizza(Pizza pizza) {
    pizzasInOrder.add(pizza);
    notifyListeners();
  }

}