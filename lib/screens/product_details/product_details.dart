import 'package:flutter/material.dart';
import 'package:larak_app/models/produt_model/product.dart';
import 'package:provider/provider.dart';
import 'package:larak_app/models/favourit_provider/favourit_provider.dart';
import 'package:larak_app/models/cart/cart_provider.dart'; // Import CartProvider

class ProductDetails extends StatefulWidget {
  static String routeName = "/product_details";

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1; // Default quantity

  @override
  Widget build(BuildContext context) {
    final ProductModel singleProduct =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Consumer<FavoriteProvider>(
      builder: (ctx, favoriteProvider, _) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/cart'),
              icon: const Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: () {
                if (favoriteProvider.isFavorite(singleProduct)) {
                  favoriteProvider.removeFavorite(singleProduct);
                } else {
                  favoriteProvider.addFavorite(singleProduct);
                }
              },
              icon: favoriteProvider.isFavorite(singleProduct)
                  ? Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border_outlined),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                singleProduct.name,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: 400,
                  height: 400,
                  child: Image.network(singleProduct.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('Price: ${singleProduct.price}',
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Text(singleProduct.description,
                  style: TextStyle(fontSize: 18)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text("$quantity"),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  ProductModel productToAdd =
                      singleProduct.copyWith(quantity: quantity);
                  Provider.of<CartProvider>(context, listen: false)
                      .addItem(productToAdd);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEF774C),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child:
                    const Text('Add to Cart', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
