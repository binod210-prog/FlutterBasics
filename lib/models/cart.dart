import 'package:day2/core/store.dart';
import 'package:day2/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';


class CartModel {
   //catalog Field
  
  late CatalogModel _catalog; 
  
  //Collection of Id's . Store Each of them
  final List<int> _itemIds = [];

  //Get catalog
  CatalogModel get catalog => _catalog;
  

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null); 
    _catalog = newCatalog;
  }
  //Get items in the list
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total Price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

 

}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.remove(item.id);
  }
}
