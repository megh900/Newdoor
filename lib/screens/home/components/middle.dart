import 'package:first/latest.dart';
import 'package:first/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../../../product.dart';
import '../../../upcoming.dart';

class middle extends StatefulWidget {
  const middle({super.key});

  @override
  State<middle> createState() => _middleState();
}

class _middleState extends State<middle> {

  List<Product> productlist=[
    Product('assets/images/app_logo.png','Bunglow',90,15,80),
    Product('assets/images/app_logo.png','Flat',10,15,80),
    Product('assets/images/app_logo.png','Shop',90,15,80),
    Product('assets/images/app_logo.png','Land',90,15,80),
    Product('assets/images/app_logo.png','Office',90,15,80),
  ];
  List<Latest> latestlist=[
    Latest('assets/images/app_logo.png','Bunglow',90,15),
    Latest('assets/images/app_logo.png','Flat',10,15),
    Latest('assets/images/app_logo.png','Shop',90,15),
    Latest('assets/images/app_logo.png','Land',90,15),
    Latest('assets/images/app_logo.png','Office',90,15),
  ];
  List<Upcoming> upcominglist=[
    Upcoming('assets/images/app_logo.png','Bunglow',90,15),
    Upcoming('assets/images/app_logo.png','Flat',10,15),
    Upcoming('assets/images/app_logo.png','Shop',90,15),
    Upcoming('assets/images/app_logo.png','Land',90,15),
    Upcoming('assets/images/app_logo.png','Office',90,15),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {
                        Navigator.pushNamed(context, AppRoute.buyScreen);
                    }, child: Text("buy / Rent")),
                    ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, AppRoute.sellScreen);
                    }, child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text("sell"),
                    )),
                    // ElevatedButton(onPressed: () {
                    //
                    // }, child: Text("Rent"))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Special Offer",
                  style: TextStyle(
                      wordSpacing: 2,
                    letterSpacing: 2,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ScrollSnapList(
                  itemBuilder:itemBuilder ,
                  itemCount:productlist.length,
                  itemSize: 150,
                  onItemFocus: (index){},
                  dynamicItemSize: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Latest Property",
                  style: TextStyle(
                      wordSpacing: 2,
                      letterSpacing: 2,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ScrollSnapList(
                  itemBuilder:itemBuilder1,
                  itemCount:productlist.length,
                  itemSize: 150,
                  onItemFocus: (index){},
                  dynamicItemSize: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Upcoming Property",
                  style: TextStyle(
                      wordSpacing: 2,
                      letterSpacing: 2,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ScrollSnapList(
                  itemBuilder:itemBuilder2,
                  itemCount:productlist.length,
                  itemSize: 150,
                  onItemFocus: (index){},
                  dynamicItemSize: true,
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    Product product= productlist[index];
    return SizedBox(
      width: 150,
      height: 300,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.asset(
                product.imagePath,
                fit:BoxFit.cover,
                // height: 180,
                // width: 150,
              ),
              SizedBox(height: 10,),
              Text(product.title,style: TextStyle(fontSize: 15),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('\$${product.cost}',
                            style: const TextStyle(color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold)),
                        Text('\$${product.price}',style: TextStyle(
                          fontWeight: FontWeight.bold
                         ),
                        ),
                      ],
                    ),
                    Text('${product.reviewCount}reviews',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.blue.shade800),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget itemBuilder1(BuildContext context, int index) {

    Latest latest=latestlist[index];
    return SizedBox(
      width: 150,
      height: 300,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.asset(
                latest.imagePath,
                fit:BoxFit.cover,
              ),
              SizedBox(height: 10,),
              Text(latest.title,style: TextStyle(fontSize: 15),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('\$${latest.cost}',
                            style: const TextStyle(color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text('${latest.reviewCount}reviews',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.blue.shade800),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget itemBuilder2(BuildContext context, int index) {
    Upcoming upcoming=upcominglist[index];

    return SizedBox(
      width: 150,
      height: 300,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.asset(
                upcoming.imagePath,
                fit:BoxFit.cover,

              ),
              SizedBox(height: 10,),
              Text(upcoming.title,style: TextStyle(fontSize: 15),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('\$${upcoming.cost}',
                            style: const TextStyle(color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text('${upcoming.reviewCount}reviews',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.blue.shade800),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
