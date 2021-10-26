import 'package:day2/pages/home_widgets/add_to_cart.dart';
import 'package:day2/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:day2/models/cart.dart';
import 'package:day2/models/catalog.dart';
import 'package:day2/pages/home_page.dart';
import 'package:day2/pages/home_page_detail.dart';
import 'package:day2/pages/home_widgets/catalog_Image.dart';
import 'package:day2/utils/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => context.vxNav.push(
                Uri(
                    path: MyRoutes.homeDetailsRoute,
                    queryParameters: {"id": catalog.id.toString()}),
                params: catalog),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mH4,
                children: [
                  "\Rs ${catalog.price}".text.bold.make(),
                  AddToCart(catalog: catalog),
                ],
              )
            ],
          ))
        ],
      ),
    )
        .color(context.cardColor)
        .rounded
        .square(180)
        .make()
        .py12(); //vertical py padding
  }
}
