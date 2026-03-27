import 'cart_model.dart';
import 'product_model.dart';

class CartManager {
  static List<CartItem> cartItems = [];

  static void addToCart(Product product) {
    int index = cartItems.indexWhere(
            (item) => item.product.title == product.title);

    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  static void removeFromCart(Product product) {
    cartItems.removeWhere(
            (item) => item.product.title == product.title);
  }

  static double get subtotal {
    return cartItems.fold(
        0, (sum, item) => sum + item.totalPrice);
  }

  static double get shipping => 50;

  static double get total => subtotal + shipping;

  static void clearCart() {
    cartItems.clear();
  }
}