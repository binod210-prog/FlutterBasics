import 'package:velocity_x/velocity_x.dart';
import 'package:day2/models/cart.dart';
import 'package:day2/models/catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
