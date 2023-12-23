import 'package:larak_app/models/produt_model/product.dart';
import 'package:flutter/material.dart';
import 'package:larak_app/screens/product_details/product_details.dart';

class BestProduct extends StatelessWidget {
  final ProductModel bestproduct;

  BestProduct({required this.bestproduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      color: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Image.network(
            bestproduct.image,
            height: 60,
            width: 60,
          ),
          const SizedBox(height: 30),
          Text(bestproduct.name),
          Text('Price: \$ ${bestproduct.price}'),
          const SizedBox(height: 12),
          SizedBox(
            height: 30,
            width: 140,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, ProductDetails.routeName,
                    arguments: bestproduct);
              },
              child: Text('Add to cart'),
            ),
          )
        ],
      ),
    );
  }
}

List<ProductModel> bestproduct = [
  ProductModel(
      image:
          'https://c0.klipartz.com/pngpicture/26/861/gratis-png-ilustracion-de-fruta-de-manzana-manzana-de-dibujos-animados-manzana.png',
      id: '1',
      name: 'apple',
      price: '12 IQD',
      description:
          'it nsadhdnkmashdfkshfkhf hhhgg Ahmed moaied gassan deyab hmady najem aldulaimy',
      status: 'available',
      favourite: false),
  ProductModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7YiyS5k1Ftxyh29NsoUzPDrN5cYbkJdOy1uETM7A&s',
      id: '2',
      name: 'carrot',
      price: '12',
      description: 'ghfjsgfhjgfhgfhgfhsdgfhgfhsgfhsdgf',
      status: 'pending',
      favourite: false),
  ProductModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7YiyS5k1Ftxyh29NsoUzPDrN5cYbkJdOy1uETM7A&s',
      id: '3',
      name: 'carrot',
      price: '12',
      description: 'ghfjsgfhjgfhgfhgfhsdgfhgfhsgfhsdgf',
      status: 'pending',
      favourite: false),
  ProductModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7YiyS5k1Ftxyh29NsoUzPDrN5cYbkJdOy1uETM7A&s',
      id: '4',
      name: 'carrot',
      price: '12',
      description: 'ghfjsgfhjgfhgfhgfhsdgfhgfhsgfhsdgf',
      status: 'pending',
      favourite: false),
  ProductModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7YiyS5k1Ftxyh29NsoUzPDrN5cYbkJdOy1uETM7A&s',
      id: '5',
      name: 'carrot',
      price: '12',
      description: 'ghfjsgfhjgfhgfhgfhsdgfhgfhsgfhsdgf',
      status: 'pending',
      favourite: false),
  ProductModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7YiyS5k1Ftxyh29NsoUzPDrN5cYbkJdOy1uETM7A&s',
      id: '6',
      name: 'carrot',
      price: '12',
      description: 'ghfjsgfhjgfhgfhgfhsdgfhgfhsgfhsdgf',
      status: 'pending',
      favourite: false),
  ProductModel(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7YiyS5k1Ftxyh29NsoUzPDrN5cYbkJdOy1uETM7A&s',
      id: '1',
      name: 'carrot',
      price: '12',
      description: 'ghfjsgfhjgfhgfhgfhsdgfhgfhsgfhsdgf',
      status: 'pending',
      favourite: false),
  ProductModel(
      image:
          'https://images.unsplash.com/photo-1550258987-190a2d41a8ba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
      id: '1',
      name: 'carrot',
      price: '12',
      description: 'ghfjsgfhjgfhgfhgfhsdgfhgfhsgfhsdgf',
      status: 'pending',
      favourite: false)
];
