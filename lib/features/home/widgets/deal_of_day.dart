
import 'package:flutter/material.dart';

import '../../../common/loader.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
 // Product? product;
  //final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
   // product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }
/*
  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return /*product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : */
            GestureDetector(
                onTap: (){},//navigateToDetailScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15,bottom: 15),
                      child: const Text(
                        'Deal of the day',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Image.network(
                        'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        '\$100',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: const Text(
                        'Akshay',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Image.network(
                          'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
                                fit: BoxFit.fitWidth,
                                width: 100,
                                height: 100,
                              ),
                          Image.network(
                            'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
                            fit: BoxFit.fitWidth,
                            width: 100,
                            height: 100,
                          ),
                          Image.network(
                            'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
                            fit: BoxFit.fitWidth,
                            width: 100,
                            height: 100,
                          ),
                          Image.network(
                            'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
                            fit: BoxFit.fitWidth,
                            width: 100,
                            height: 100,
                          ),
                          Image.network(
                            'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
                            fit: BoxFit.fitWidth,
                            width: 100,
                            height: 100,
                          ),
                            ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'See all deals',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
