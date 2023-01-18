import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Order order;
  @override
  void initState() {
    super.initState();
  }

  void incrementQuantity(Order order) {
    double initialPrice = order.price / order.quantity;
    setState(() {
      order.quantity++;
      order.price = initialPrice * order.quantity;
    });
  }

  void decrementQuantity(Order order) {
    if (order.quantity > 1) {
      double initialPrice = order.price / order.quantity;
      setState(() {
        order.quantity--;
        order.price = initialPrice * order.quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return ListTile(
            title: Text(order.name),
            subtitle: Text('USD ${order.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    onPressed: () => decrementQuantity(order),
                    icon: const Icon(Icons.remove)),
                const SizedBox(width: 15),
                Text('${order.quantity}'),
                const SizedBox(width: 15),
                IconButton(
                    onPressed: () => incrementQuantity(order),
                    icon: const Icon(Icons.add)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Order {
  Order(
    this.name,
    this.price,
    this.quantity,
  );
  String name;
  int quantity;
  double price;
}

final List<Order> _orders = [
  Order(
    'Coffee',
    20.00,
    1,
  ),
  Order(
    'Tea',
    10.00,
    1,
  ),
  Order(
    'Cake',
    50.00,
    1,
  ),
  Order(
    'Pizza',
    100.00,
    1,
  ),
];
