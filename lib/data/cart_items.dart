import 'package:workshop_shopping_app/models/item.dart';

List<Item> cartItems = [];

onPressed: () {
	// Create new item from current product
  final newItem = Item(
    productId: widget.product.id!,
    productName: widget.product.name,
    imageUrl: widget.product.images.first,
    price: widget.product.price,
    quantity: quantity,
  );
  
  // If item already exists in cart, override the item with new quantity
  if (cartItems.any((item) => item.productId == newItem.productId)) {
    final existingItemIndex = cartItems.indexWhere((item) => item.productId == newItem.productId);
    setState(() {
      final existingItem = cartItems[existingItemIndex];
      cartItems[existingItemIndex] = Item(
        productId: existingItem.productId,
        productName: existingItem.productName,
        imageUrl: existingItem.imageUrl,
        price: existingItem.price,
        quantity: existingItem.quantity + quantity,
      );
    });
    
  // Else, add new item into cart
  } else {
    setState(() {
      cartItems.add(newItem);
    });
  }
  
  // Notify user
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Product added to cart successfully!'),
      duration: Duration(milliseconds: 500),
    ),
  );
},