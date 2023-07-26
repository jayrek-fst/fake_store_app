import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entity/product_entity.dart';
import '../../../util/constant_util.dart';
import 'star_rating_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Container(
          color: Colors.grey.shade200,
          margin: const EdgeInsets.all(4),
          child: GestureDetector(
            onTap: () async {
              context.goNamed('product',
                  pathParameters: {'id': productEntity.id.toString()});
              // Navigator.of(context).pushNamed(
              //   ConstantUtil.routeProductDetails,
              //   arguments: productEntity.id.toString(),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    productEntity.image.toString(),
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  // Hero(
                  //   tag: productEntity.id.toString(),
                  //   child: Image.network(
                  //     productEntity.image.toString(),
                  //     fit: BoxFit.cover,
                  //     height: 100,
                  //   ),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          productEntity.title.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '${ConstantUtil.price} \$${productEntity.price}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${ConstantUtil.qty}  ${productEntity.rating?.count}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          StarRatingWidget(
                            rating: productEntity.rating?.rate,
                            color: Colors.yellow.shade900,
                          ),
                          Text(
                            '${productEntity.rating?.rate}',
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
