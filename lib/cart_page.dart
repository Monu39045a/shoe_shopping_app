import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/cart_provider.dart';
// import 'package:shoe_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("CART"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          // print(cartItem);
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 23,
            ),
            trailing: IconButton(
              onPressed: () {
                // Cnfirmation Dialog box
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                        "Are you Sure you want to delete this Product?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "NO",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Provider.of<CartProvider>(context, listen: false)
                                .removeProduct(cartItem);
                          },
                          child: const Text(
                            "YES",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],

                      // child: Text("Are you Sure you want to delete this item?"),
                    );
                  },
                );

                // Provider.of<CartProvider>(context).removeProduct(product);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              cartItem['title'] as String,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              'Size: ${cartItem['size']}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
      ),
    );
  }
}
