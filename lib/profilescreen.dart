import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      backgroundColor: Color.fromARGB(255, 236, 234, 234),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BackButton(),
          Padding(padding: EdgeInsets.only(right: 50,left: 50)),
          Card(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Codenig is life",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("abc@gmail.com"),
                        Row(
                          children: [
                            Text(
                              "View activity",
                              style: TextStyle(color: Colors.pink),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.pink,
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        CircularPercentIndicator(
                          radius: 55.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 5.0,
                          percent: 0.4,
                          center: Container(),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.pink,
                        ),
                        const Positioned(
                          top: 5,
                          left: 5,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://albanyvet.com.au/wp-content/uploads/2019/11/blank-profile-picture-973460_640.png"),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          left: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                "32%",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Icon(Icons.favorite_outline),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Favourites",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Icon(Icons.currency_rupee),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Money",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const ListTile(
                    title: Text("Your Rating"),
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 227, 225, 225),
                      child: Icon(
                        Icons.star,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined,
                        color: Colors.grey, size: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10,right: 235),
                        child: Text("Food Orders",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      ListTile(                        
                        title: Text("Your Orders"),
                        leading: CircleAvatar(
                          
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.shopping_bag,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Favourites Orders"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                     Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Address Book"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.contact_page,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                     Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Online ordering help"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.contact_page,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                const SizedBox(
                        height: 20,
                      ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10,right: 280),
                        child: Text("Dining",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      ListTile(
                        title: Text("Your deals & transactions"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.alarm,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Your dining rewards"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.card_giftcard,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Table reservations"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.deck,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Dining help"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.comment_sharp,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                       Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Frequently asked qestions"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.help,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                const SizedBox(
                        height: 20,
                      ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),                    
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),                    
                  child: const Column(                   
                    children: [                      
                      Padding(
                        padding: EdgeInsets.only(top: 10,right: 280),
                        child: Text("Money",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      ListTile(
                        title: Text("Wallet"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.wallet,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Buy Gift Card"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.card_giftcard,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Claim Gift Card"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.message_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Credits"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.hdr_auto,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      Divider(
                        height: 10,                      
                      ),
                      ListTile(
                        title: Text("Manage payment methods"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.payment,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ),
                      
                    ],
                  ),
                ), 
                const SizedBox(
                        height: 20,
                      ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),                    
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),                    
                  child: const Column(                   
                    children: [                      
                      Padding(
                        padding: EdgeInsets.only(top: 10,right: 270),
                        child: Text("Enterprise",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      ListTile(
                        title: Text("For employee"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.badge,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),                     
                    ],
                  ),
                ),     
                const SizedBox(
                        height: 20,
                      ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),                    
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),                    
                  child: const Column(                   
                    children: [                      
                      Padding(
                        padding: EdgeInsets.only(top: 10,right: 270),
                        child: Text("Coupons",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      ListTile(
                        title: Text("Collected coupons"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.percent_sharp,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),                     
                    ],
                  ),
                ),
                 const SizedBox(
                        height: 20,
                      ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),                    
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),                    
                  child: const Column(                   
                    children: [                      
                      Padding(
                        padding: EdgeInsets.only(top: 10,right: 270),
                        child: Text("More",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      ListTile(
                        title: Text("About"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),  
                      ListTile(
                        title: Text("Send feedback"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.rate_review_sharp,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ), 
                       ListTile(
                        title: Text("Settings"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.settings,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),
                      ListTile(
                        title: Text("Log out"),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 227, 225, 225),
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.grey, size: 18),
                      ),                       
                    ],
                  ),
                ), 
                Padding(padding: EdgeInsets.only(bottom: 100))    
              ],
            ),
          ),
        ],
      ),
    );
  }
}
