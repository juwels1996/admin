import 'package:admin_app/model/orders_model.dart';
import 'package:admin_app/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OrderEditPage extends StatefulWidget {
  Order? orderModel;

  OrderEditPage({Key? key, this.orderModel}) : super(key: key);

  @override
  _OrderEditPageState createState() => _OrderEditPageState();
}

class _OrderEditPageState extends State<OrderEditPage> {
  TextEditingController? titleController;
  bool isLoading = false;
  String? title;

  @override
  void initState() {
    // TODO: implement initState
    titleController =
        TextEditingController(text: widget.orderModel!.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order"),
        ),
        resizeToAvoidBottomInset: false,
        body: ModalProgressHUD(
          inAsyncCall: isLoading == true,
          progressIndicator: spinkit,
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Text('Order Id : ${widget.orderModel!.id}'),
                SizedBox(
                  height: 5,
                ),
                Text(
                    'Order Status : ${widget.orderModel!.orderStatus!.orderStatusCategory.name ?? "Not Define"}'),
                SizedBox(
                  height: 5,
                ),
                Text(
                    'Order Date : ${widget.orderModel!.orderDateAndTime!.toIso8601String() ?? "Not Define"}'),
                Divider(),

                ...widget.orderModel!.orderFoodItems
                    .map((e) => ProductInfoContainer(e, context))
                    .toList(),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                UserInfoContainer(widget.orderModel!.user),
                SizedBox(
                  height: 5,
                ),
                ShippingAddressContainer(widget.orderModel!.shippingAddress),
                SizedBox(
                  height: 5,
                ),
                priceContainer(widget.orderModel),
                SizedBox(
                  height: 5,
                ),
                Text(
                    'Order Status : ${widget.orderModel!.orderStatus!.orderStatusCategory.name ?? "Not Define"}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget ProductInfoContainer(
    OrderFoodItem? orderFoodItem, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Item name : ${orderFoodItem!.name}"),
            Text("Quantity : ${orderFoodItem.pivot.quantity}")
          ],
        ),
      ],
    ),
  );
}

Widget ShippingAddressContainer(IngAddress? shippingAddress) {
  return Card(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(" Shipping area "),
              Text("${shippingAddress!.area ?? "Not define"}")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping district "),
              Text("${shippingAddress.district ?? "Not define"}")
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping City "),
              Text("${shippingAddress.city ?? "Not define"}")
            ],
          )
        ],
      ),
    ),
  );
}

Widget UserInfoContainer(User? user) {
  return Card(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(" User Name "),
              Text("${user!.name ?? "Not define"}")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("User email "),
              Text("${user.email ?? "Not define"}")
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("User contact "),
              Text("${user.contact ?? "Not define"}")
            ],
          )
        ],
      ),
    ),
  );
}

Widget priceContainer(Order? order) {
  return Card(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("VAT "), Text("${order!.vat ?? "0"}")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total discount "),
              Text("${order.discount ?? "0"}")
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Total price "), Text("${order.price ?? "0"}")],
          )
        ],
      ),
    ),
  );
}
