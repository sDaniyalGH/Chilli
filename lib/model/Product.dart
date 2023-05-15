class Product {
  final int _id;
  final String _title;
  final String _imgurl;
  int _quantity;
  int _price;

  Product(this._id, this._title, this._imgurl, this._quantity , this._price);

  
  get id => _id;
  String get title => _title;
  String get imgurl => _imgurl;
  int get quantity => _quantity;
  int get price => _price;
  set setQuantity(int newValue) => _quantity = newValue;
}