import 'package:bakery_order_system/features/products/domain/category.dart';
import 'package:bakery_order_system/features/products/bloc/product_bloc.dart';
import 'package:bakery_order_system/features/products/domain/product.dart';
import 'package:bakery_order_system/features/products/presentation/create_product_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductInitial) {
        context.read<ProductBloc>().add(FetchProducts());
      }
      if (state is ProductsLoaded) {
        return Column(
            children: [_productList(state.products), CreateProductWidget()]);
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  _productList(List<Product> products) {
    return Column(
      children: List.generate(
          products.length,
          (index) => Row(
                children: [
                  // products[index].path!.isNotEmpty
                  //     ? Image.network(products[index].path!)
                  //     : Container(),
                  Text(products[index].path ?? "No path"),
                  Text(products[index].name),
                  Text(products[index].category.name),
                  Text(products[index].price.toString()),
                ],
              )),
    );
  }
}
