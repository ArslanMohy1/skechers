class Order {
  int? id;
  String name;
  int price;
  String size;
  int quantity;
  String image;

  Order({
    this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.quantity,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'size': size,
      'quantity': quantity,
      'image': image,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      size: map['size'],
      quantity: map['quantity'],
      image: map['image'],
    );
  }

  Order copyWith({int? id, int? quantity}) {
    return Order(
      id: id ?? this.id,
      name: name,
      price: price,
      size: size,
      quantity: quantity ?? this.quantity,
      image: image,
    );
  }

  int getTotalPrice() {
    return price * quantity;
  }
}
