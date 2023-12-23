import 'package:larak_app/models/produt_model/product.dart'; 
import 'package:larak_app/models/category_model/category.dart'; 

class CategoryService {
  List<CategoryModel> getAllCategories() {

    return [
      CategoryModel(
        name: 'Category 1',
        products: [
          ProductModel(
            id: '1',
            name: 'Product 1',
            image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsoikCCpO-GYFzo31IMQVXEC1pzvO2UtjKHg&usqp=CAU',
            price: '22',
            description: 'Some description',
            quantity: 1,
            status: 'Available',
            favourite: false,
          ),
          // Add more products here
        ],
      ),
      CategoryModel(
        name: 'Category 2',products: [], // This had no product
      ),
      CategoryModel(
        name: 'Category 1',
        products: [
          ProductModel(
            id: '1',
            name: 'Product 1',
            image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsoikCCpO-GYFzo31IMQVXEC1pzvO2UtjKHg&usqp=CAU',
            price: '22',
            description: 'Some description',
            status: 'Available',
            quantity: 1,
            favourite: false,
          ),
          // Add more products here
        ],
      ),
      CategoryModel(
        name: 'Category 1',
        products: [
          ProductModel(
            id: '1',
            name: 'Product 1',
            image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsoikCCpO-GYFzo31IMQVXEC1pzvO2UtjKHg&usqp=CAU',
            price: '22',
            description: 'Some description',
            status: 'Available',
            quantity: 1,
            favourite: false,
          ),
          // Add more products here
        ],
      ),
    ];
  }
}
