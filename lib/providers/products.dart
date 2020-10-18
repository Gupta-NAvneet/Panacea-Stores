import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Bournvita',
      description: 'A 500 gram Cadbury product malted chocolate drink mix that can be enjoyed piping hot or deliciously cold.For flavor and energy.',
      price: 249.99,
      imageUrl:
      'https://images-na.ssl-images-amazon.com/images/I/51gn%2BccasqL._SL1000_.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Basmati rice',
      description: 'Polished basmati rice,product name India gate weighing 10kilogram',
      price: 539.99,
      imageUrl:
      'https://4.imimg.com/data4/BM/KX/MY-15922529/india-gate-basmati-rice-premium-500x500.jpg',
    ),
    Product(
      id: 'p3',
      title: 'knorr soup',
      description: 'A warm soup of knorr soup for snack and flavor of mix vegitable flavor',
      price: 49.99,
      imageUrl:
      'https://rukminim1.flixcart.com/image/352/352/j3rm8i80/soup/r/y/m/61-soup-mix-veg-vegetable-knorr-original-imaeusugqktrpm9e.jpeg?q=70',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: '50-50 biscuit',
      description: 'A sweet and salty britania product for snack',
      price: 20.00,
      imageUrl:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSvdBRUaHnK4OxBA_jwke3I9fVJOKRUCsov7A&usqp=CAU',
    ),
    Product(
      id: 'p6',
      title: 'lays',
      description: 'with a magic masala taste',
      price: 19.99,
      imageUrl:
      'https://images-na.ssl-images-amazon.com/images/I/81X7W2BrGaL._SX425_.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Kurkure',
      description: 'with a masala munch flavor',
      price: 19.99,
      imageUrl:
      'https://i5.walmartimages.ca/images/Enlarge/118/863/6000200118863.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Oreo',
      description: 'Twist,lick,dunk eat',
      price: 17.99,
      imageUrl:
      'https://images-na.ssl-images-amazon.com/images/I/41XPnuR-uJL.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Garnier acno face wash',
      description: 'for clear face wash',
      price: 169.99,
      imageUrl:
      'https://images-na.ssl-images-amazon.com/images/I/51ROHYE3lXL._SL1000_.jpg',
    ),
    Product(
      id: 'p10',
      title: 'Almond hair oil',
      description: 'for silky hair and smooth hair',
      price: 159.99,
      imageUrl:
      'https://i5.walmartimages.ca/images/Enlarge/787/562/6000199787562.jpg',
    ),
    Product(
      id: 'p11',
      title: 'milky Bar',
      description: 'for the taste u need',
      price: 10.00,
      imageUrl:
      'https://assetscdn1.paytm.com/images/catalog/product/F/FA/FASNESTLE-MILKYBIGB98583245B0112/1561501196067_0.jpg',
    ),
    Product(
      id: 'p12',
      title: 'Dairy milk',
      description: 'chocolaty',
      price: 20.00,
      imageUrl:
      'https://www.fewabazar.com/images/thumbs/001/0014800_dairy-milk-52-gm-ktm.jpeg',
    ),
  ];
  var _showFavoritesOnly = false;
  List<Product> get items {
    if(_showFavoritesOnly){
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items];
  }

  void showFavoritesOnly(){
    _showFavoritesOnly=!_showFavoritesOnly;
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    //To add item at start of list
    //_items.insert(0,newProduct);
    notifyListeners();
  }
  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
