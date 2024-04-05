import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_clone/apiService.dart';
import 'package:swiggy_clone/loginUserData.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ApiService apiService = ApiService();

  var orders = [];
  getOrders() async {
    var userData =
        Provider.of<LoginUserData>(context, listen: false).getUserData();
    final formData = FormData.fromMap({
      'uid': userData['uid'],
    });
    var res = await apiService.postCall("order.php", formData);
    if (res['status'] == true) {
      setState(() {
        orders = res['data'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'All Orders'),
              Tab(text: 'Accepted Orders'),
              Tab(text: 'Rejected Orders'),
            ],
          ),
          // Customize the app bar color
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            orderslist("3"),
            orderslist("1"),
            orderslist("2"),
          ],
        ));
  }

  Widget orderslist(status) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];

        return status == order['orderstatus'] || status == "3"
            ? Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage("${apiService.url}/${order['pimage']}"),
                  ),
                  title: Text(
                    'Order #00000${order['oid']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Restaurant: ${order['resname']}'),
                      SizedBox(height: 8),
                      Text('Date: ${order['oredrdatetime']}'),
                      SizedBox(height: 8),
                      _buildOrderedItems(order),
                    ],
                  ),
                  trailing: Text(
                    '\₹${order['totalamount']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                  onTap: () {
                    // Add your onTap functionality here
                  },
                ),
              )
            : Container();
      },
    );
  }

  Widget _buildOrderedItems(item) {
    var status = "";
    Color statuscolor = Colors.black;
    if (item['orderstatus'] == "1") {
      status = "Accepted";
      statuscolor = Colors.lightGreen;
    } else if (item['orderstatus'] == "0") {
      status = "Pending";
      statuscolor = Colors.orange;
    } else if (item['orderstatus'] == "2") {
      status = "Rejected";
      statuscolor = Colors.redAccent;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${item['pname']} (${item['quantity']}x)'),
        Text(
          '\₹${item['price']}',
          style: TextStyle(color: Colors.grey), // Customize item price color
        ),
        Text(
          status,
          style: TextStyle(color: statuscolor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
