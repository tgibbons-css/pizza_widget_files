import 'package:flutter/material.dart';
import 'package:pizza_widget_files/pizza.dart';
import 'package:pizza_widget_files/pizza_order.dart';
import 'package:provider/provider.dart';

class AddPizzaDialog extends StatefulWidget {

  PizzaOrder pizzaOrder;

  AddPizzaDialog({ Key key, PizzaOrder this.pizzaOrder}): super(key: key);

  @override
  AddPizzaDialogState createState() => AddPizzaDialogState();
}

class AddPizzaDialogState extends State<AddPizzaDialog> {

  final pizzaToppingTextField = TextEditingController();
  int _sizeSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
          height: 200,
          child:  Column(
            children: <Widget>[
              Text(
                'Toppings:',
                style: Theme.of(context).textTheme.headline4,
              ),
              TextField(
                controller: pizzaToppingTextField,
                style: Theme.of(context).textTheme.headline4,
              ),
              DropdownButton(
                  style: Theme.of(context).textTheme.headline4,
                  value: _sizeSelected,
                  items:[
                    DropdownMenuItem(child: Text("Small"), value: 0),
                    DropdownMenuItem(child: Text("Medium"), value: 1),
                    DropdownMenuItem(child: Text("Large"), value: 2),
                    DropdownMenuItem(child: Text("X-Lareg"), value: 3)
                  ],
                  onChanged: (value) {
                    setState(() {
                      _sizeSelected = value;
                    });
                  }),
              ElevatedButton(
                child: Text('Add Pizza'),
                onPressed: () {
                  print("Adding a pizza");
                  setState(() {
                    Pizza newPizza = new Pizza(pizzaToppingTextField.text, _sizeSelected);
                    // TODO: call add pizza in parent
                    widget.pizzaOrder.addPizza(newPizza);
                    //pizzasInOrder.add(newPizza);
                    Provider.of<PizzaOrder>(context, listen: false).addPizza(newPizza);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        )
    );
  }
}