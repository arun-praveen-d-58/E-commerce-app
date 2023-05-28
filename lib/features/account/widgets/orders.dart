
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

import '../../../common/loader.dart';
import '../../../constants/global_variables.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<String> images = [
    'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
    'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
    'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75',
    'https://navbharattimes.indiatimes.com/thumb/93654834/touch-screen-laptop-under-30000-rupees-93654834.jpg?imgsize=34856&width=1200&height=900&resizemode=75'
 ];


  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return  Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),
              // display orders
              Container(
                height: 170,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {

                      return SingleProduct(
                        image: images[index]

                      );
                  },
                ),
              ),
            ],
          );
  }
}
