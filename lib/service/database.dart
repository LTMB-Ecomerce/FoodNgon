import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getSuccessfulOrders(String id) {
    return FirebaseFirestore.instance
        .collection('orders')
        .where('id',
            isEqualTo:
                id) // Ensure 'Id' matches exactly with Firestore field name
        .get();
  }

  Future<void> UpdateUserwallet(String id, String walletAmount) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({'wallet': walletAmount});
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addFoodToCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection("Cart")
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodCart(String id) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Cart")
        .snapshots();
  }

  Future<void> updateCartItemStatus(
      String userId, String cartItemId, bool status) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('Cart')
        .doc(cartItemId)
        .update({'purchased': status});
  }

  Future<void> deleteCartItem(String userId, String cartItemId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('Cart')
        .doc(cartItemId)
        .delete();
  }

  Future<void> updateCartItemQuantity(
      String userId, String cartItemId, int quantity) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("Cart")
        .doc(cartItemId)
        .update({"Quantity": quantity.toString()});
  }
}
