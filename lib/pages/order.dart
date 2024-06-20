import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/service/database.dart';
import 'package:food/service/shared_pref.dart';
import 'package:food/widgets/widget_support.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id, wallet;
  int total = 0, amount2 = 0;
  Timer? timer;

  void startTimer() {
    timer = Timer(Duration(seconds: 3), () {
      if (mounted) {
        amount2 = total;
        setState(() {});
      }
    });
  }

  Future<void> getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    wallet = await SharedPreferenceHelper().getUserWallet();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> ontheload() async {
    await getthesharedpref();
    foodStream = await DatabaseMethods().getFoodCart(id!);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    ontheload();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Stream<QuerySnapshot<Object?>>? foodStream;

  void deleteCartItem(String cartItemId, int itemTotal) async {
    try {
      await DatabaseMethods().deleteCartItem(id!, cartItemId);
      setState(() {
        total -= itemTotal; // Subtract item total from the total price
      });
      showSnackBar("Item deleted successfully", success: true);
    } catch (e) {
      print('Delete cart item error: $e');
      showSnackBar("Failed to delete item", success: false);
    }
  }

  void showSnackBar(String message, {bool success = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> checkout() async {
    int userWalletAmount = int.parse(wallet ?? '0');

    if (userWalletAmount < total) {
      showSnackBar("Insufficient wallet balance!", success: false);
      return;
    }

    bool confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Checkout'),
        content: Text('Are you sure you want to checkout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Confirm'),
          ),
        ],
      ),
    );

    if (confirm) {
      CollectionReference ordersRef = FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('Orders');

      CollectionReference cartRef = FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .collection('Cart');

      QuerySnapshot cartSnapshot = await cartRef.get();

      for (var doc in cartSnapshot.docs) {
        await ordersRef.add(doc.data()!);
      }

      for (var doc in cartSnapshot.docs) {
        await doc.reference.delete();
      }

      int newWalletAmount = userWalletAmount - total;
      await DatabaseMethods().UpdateUserwallet(id!, newWalletAmount.toString());
      await SharedPreferenceHelper().saveUserWallet(newWalletAmount.toString());

      setState(() {
        total = 0;
        foodStream = null; // Clear the cart items
      });

      showSnackBar('Checkout successful!', success: true);
    }
  }

  Widget foodCart() {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: foodStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          total = 0;
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (context, index) {
              DocumentSnapshot<Object?> ds = snapshot.data!.docs[index];
              int itemTotal = int.parse(ds["Total"].toString());
              total += itemTotal;
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ds["Image"].toString(),
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ds["Name"].toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "\$" + itemTotal.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      children: [
                        Text(
                          'Quantity: ' + ds["Quantity"].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteCartItem(ds.id, itemTotal);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(child: Text("Your cart is empty!"));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Cart",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: foodCart(),
            ),
            SizedBox(height: 20.0),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$" + total.toString(),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: checkout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 1.0),
                child: Center(
                    child: Text(
                  "CheckOut",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
